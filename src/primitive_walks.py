"""
Primitive even closed walks in a small undirected graph.

Given a list of undirected edges, this script:
1) lists even closed walks up to a chosen maximum length;
2) keeps only those that are primitive in the toric-ideal sense;
3) removes duplicates coming from the same binomial, up to sign.

Walks are printed as closed vertex sequences (v0, v1, ..., vL) with vL = v0.

This is only meant for fairly small graphs and modest length bounds.
"""

from __future__ import annotations

from collections import defaultdict, Counter, deque
from typing import List, Tuple, Dict, Set

Edge = Tuple[int, int]
Walk = Tuple[int, ...]


def norm_edge(u: int, v: int) -> Edge:
    return (u, v) if u < v else (v, u)


def build_adj(edges: List[Edge]) -> Dict[int, List[int]]:
    adj: Dict[int, List[int]] = defaultdict(list)
    for u, v in edges:
        adj[u].append(v)
        adj[v].append(u)
    return adj


def rotate_to_min(seq: Tuple[int, ...]) -> Tuple[int, ...]:
    """Return the lexicographically smallest rotation of a cyclic sequence."""
    n = len(seq)
    best = seq
    for i in range(1, n):
        cand = seq[i:] + seq[:i]
        if cand < best:
            best = cand
    return best


def canonical_cycle_vertices(cycle: Tuple[int, ...]) -> Tuple[int, ...]:
    """
    Put a cyclic vertex sequence into a standard form by taking the smallest
    rotation among the cycle and its reversal.
    """
    a = rotate_to_min(cycle)
    b = rotate_to_min(tuple(reversed(cycle)))
    return a if a < b else b


def walk_edges_multiset(walk_closed: Walk) -> Counter[Edge]:
    """Return the edge multiset of a closed walk."""
    c: Counter[Edge] = Counter()
    for i in range(len(walk_closed) - 1):
        c[norm_edge(walk_closed[i], walk_closed[i + 1])] += 1
    return c


def is_connected_eulerian_even(edge_multiset: Counter[Edge]) -> bool:
    """
    Check whether the multigraph is connected on its support, has all degrees even,
    and has an even number of edges.
    """
    total_edges = sum(edge_multiset.values())
    if total_edges == 0 or total_edges % 2 != 0:
        return False

    deg: Dict[int, int] = defaultdict(int)
    neigh: Dict[int, Set[int]] = defaultdict(set)

    for (u, v), m in edge_multiset.items():
        if m <= 0:
            continue
        deg[u] += m
        deg[v] += m
        neigh[u].add(v)
        neigh[v].add(u)

    support = [v for v, d in deg.items() if d > 0]
    if not support:
        return False

    if any(deg[v] % 2 != 0 for v in support):
        return False

    # Check connectivity on the underlying simple graph.
    start = support[0]
    seen = {start}
    q = deque([start])
    while q:
        x = q.popleft()
        for y in neigh[x]:
            if y not in seen:
                seen.add(y)
                q.append(y)

    return all(v in seen for v in support)


def is_primitive(edge_multiset: Counter[Edge]) -> bool:
    """
    Brute-force primitive test for small walks.

    A walk is not primitive if its edge multiset splits into two nonempty parts
    such that both parts are connected Eulerian multigraphs with even length.
    """
    # First check that the whole walk has the expected basic properties.
    if not is_connected_eulerian_even(edge_multiset):
        return False

    # Expand the multiset into individual edge occurrences.
    occ: List[Edge] = []
    for e, m in edge_multiset.items():
        occ.extend([e] * m)

    m = len(occ)
    if m < 4 or m % 2 != 0:
        return False

    full_mask = (1 << m) - 1

    # Go through proper nonempty subsets. To avoid counting complements twice,
    # require the first occurrence to lie in the chosen subset.
    for mask in range(1, full_mask):
        if (mask & 1) == 0:
            continue
        if mask == full_mask:
            continue

        sub: Counter[Edge] = Counter()
        comp: Counter[Edge] = Counter()
        for i, e in enumerate(occ):
            if (mask >> i) & 1:
                sub[e] += 1
            else:
                comp[e] += 1

        if not sub or not comp:
            continue

        if is_connected_eulerian_even(sub) and is_connected_eulerian_even(comp):
            return False

    return True


def enumerate_even_closed_walks(
    edges: List[Edge],
    max_len: int = 14,
    edge_mult_cap: int = 2,
    forbid_immediate_backtrack: bool = True,
) -> List[Walk]:
    """
    Enumerate even closed walks up to max_len.

    At this stage the deduplication is only by cyclic vertex sequence up to
    rotation and reversal. A second pass later deduplicates by binomial.
    """
    adj = build_adj(edges)
    vertices = sorted(adj.keys())

    seen_keys: Set[Tuple[int, ...]] = set()
    walks: List[Walk] = []

    for start in vertices:
        # stack item: (current vertex, path, edge-use counter, previous vertex)
        stack = [(start, (start,), Counter(), None)]

        while stack:
            cur, path, edge_use, prev = stack.pop()
            L = len(path) - 1
            if L > max_len:
                continue

            # Record closed walks of even length at least 4.
            if cur == start and L >= 4 and L % 2 == 0:
                walk_closed = path
                cyc = walk_closed[:-1]
                key = canonical_cycle_vertices(cyc)
                if key not in seen_keys:
                    seen_keys.add(key)
                    walks.append(walk_closed)

            if L == max_len:
                continue

            for nxt in adj[cur]:
                if forbid_immediate_backtrack and prev is not None and nxt == prev:
                    continue

                e = norm_edge(cur, nxt)
                if edge_use[e] >= edge_mult_cap:
                    continue

                new_edge_use = edge_use.copy()
                new_edge_use[e] += 1
                new_path = path + (nxt,)
                stack.append((nxt, new_path, new_edge_use, cur))

    return walks


def walk_to_binomial_key(walk_closed: Walk) -> Tuple[Tuple[Edge, ...], Tuple[Edge, ...]]:
    """
    Return a canonical key for the binomial coming from an even closed walk.

    For
        f_W = product of odd-position edges - product of even-position edges,
    this records the two edge multisets and identifies (A, B) with (B, A).
    """
    odd: List[Edge] = []
    even: List[Edge] = []

    # i = 0 corresponds to the first edge, so it contributes to the odd part.
    for i in range(len(walk_closed) - 1):
        e = norm_edge(walk_closed[i], walk_closed[i + 1])
        if i % 2 == 0:
            odd.append(e)
        else:
            even.append(e)

    odd_key = tuple(sorted(odd))
    even_key = tuple(sorted(even))
    return (odd_key, even_key) if (odd_key, even_key) <= (even_key, odd_key) else (even_key, odd_key)


def dedupe_walks_by_binomial(walks: List[Walk]) -> List[Walk]:
    """Keep one walk for each binomial, up to sign."""
    seen: Set[Tuple[Tuple[Edge, ...], Tuple[Edge, ...]]] = set()
    out: List[Walk] = []
    for w in walks:
        key = walk_to_binomial_key(w)
        if key not in seen:
            seen.add(key)
            out.append(w)
    return out


def find_primitive_even_closed_walks(
    edges: List[Edge],
    max_len: int = 14,
    edge_mult_cap: int = 2,
) -> List[Walk]:
    all_walks = enumerate_even_closed_walks(
        edges,
        max_len=max_len,
        edge_mult_cap=edge_mult_cap,
        forbid_immediate_backtrack=True,
    )

    prim: List[Walk] = []
    for w in all_walks:
        em = walk_edges_multiset(w)
        if is_primitive(em):
            prim.append(w)

    # Remove duplicates coming from the same toric binomial.
    prim = dedupe_walks_by_binomial(prim)

    prim.sort(key=lambda w: (len(w) - 1, w))
    return prim


if __name__ == "__main__":
    edges = [(0, 1), (0, 2), (0, 3), (1, 2), (3, 4), (3, 5), (4, 5)]
    prim_walks = find_primitive_even_closed_walks(edges, max_len=14, edge_mult_cap=2)

    print(f"Found {len(prim_walks)} primitive even closed walks (binomial-distinct):\n")
    for w in prim_walks:
        print(f"len={len(w)-1:2d}  walk={w}")