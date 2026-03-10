#!/usr/bin/env python3
from __future__ import annotations

import itertools
import time
from dataclasses import dataclass
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

Vertex = int
Edge = Tuple[Vertex, Vertex]
CanonicalForm = Tuple[Edge, ...]


@dataclass(frozen=True)
class GraphRecord:
    canonical: CanonicalForm
    edges: Tuple[Edge, ...]
    edge_mask: int


def _sorted_edge(u: int, v: int) -> Edge:
    return (u, v) if u <= v else (v, u)


def graph_to_canonical_form(n: int, edges: Sequence[Edge]) -> CanonicalForm:
    """Return the lexicographically smallest edge list obtained by relabelling the vertices."""
    best: Optional[CanonicalForm] = None
    edges = [tuple(e) for e in edges]

    for perm in itertools.permutations(range(n)):
        permuted = [_sorted_edge(perm[u], perm[v]) for (u, v) in edges]
        form = tuple(sorted(permuted))
        if best is None or form < best:
            best = form

    return best if best is not None else tuple()


def enumerate_non_isomorphic_graphs(n: int, show_progress: bool = True) -> List[GraphRecord]:
    """Brute-force all edge masks and keep one representative of each isomorphism class."""
    vertices = list(range(n))
    all_edges = list(itertools.combinations(vertices, 2))
    total_masks = 1 << len(all_edges)

    unique: Dict[CanonicalForm, Tuple[Tuple[Edge, ...], int]] = {}

    t0 = time.time()
    last = t0

    for mask in range(total_masks):
        edges = tuple(e for i, e in enumerate(all_edges) if mask & (1 << i))
        canonical = graph_to_canonical_form(n, edges)
        if canonical not in unique:
            unique[canonical] = (edges, mask)

        if show_progress:
            now = time.time()
            if now - last >= 1.0 or mask == total_masks - 1:
                done = mask + 1
                pct = 100.0 * done / total_masks
                rate = done / max(now - t0, 1e-9)
                eta = (total_masks - done) / max(rate, 1e-9)
                print(
                    f"\r[enumerate] {done}/{total_masks} ({pct:5.1f}%) | "
                    f"unique={len(unique):4d} | ETA {eta:6.1f}s",
                    end="",
                    flush=True,
                )
                last = now

    if show_progress:
        print()

    return [GraphRecord(canonical=c, edges=e, edge_mask=m) for c, (e, m) in unique.items()]


def is_induced_subgraph(
    small_edges: Sequence[Edge],
    large_edges: Sequence[Edge],
    n_large: int,
) -> Tuple[bool, Optional[Dict[Vertex, Vertex]]]:
    """
    Check whether the graph with edge set small_edges occurs as an induced subgraph
    of the graph with edge set large_edges.

    Returns (found, mapping), where mapping sends vertices of the smaller graph
    to vertices of the larger one.
    """
    # Recover the vertex set of the smaller graph from its edge list.
    small_vertices_set = set()
    for u, v in small_edges:
        small_vertices_set.add(u)
        small_vertices_set.add(v)
    small_vertices = sorted(small_vertices_set)
    k = len(small_vertices)

    if k > n_large:
        return False, None

    large_edge_set = set(_sorted_edge(u, v) for (u, v) in large_edges)
    small_edge_set = set(_sorted_edge(u, v) for (u, v) in small_edges)

    # Test all injective maps from the small vertex set into {0, ..., n_large - 1}.
    for image in itertools.permutations(range(n_large), k):
        mapping = dict(zip(small_vertices, image))

        ok = True
        for i in range(k):
            for j in range(i + 1, k):
                u_s, v_s = small_vertices[i], small_vertices[j]
                u_l, v_l = mapping[u_s], mapping[v_s]

                in_small = _sorted_edge(u_s, v_s) in small_edge_set
                in_large = _sorted_edge(u_l, v_l) in large_edge_set

                if in_small != in_large:
                    ok = False
                    break
            if not ok:
                break

        if ok:
            return True, mapping

    return False, None


def count_containing_induced(
    graphs: Iterable[GraphRecord],
    subgraph_edges: Sequence[Edge],
    n: int,
    show_progress: bool = True,
) -> int:
    """Count how many graphs in the list contain the chosen induced subgraph."""
    graphs_list = list(graphs)
    total = len(graphs_list)

    t0 = time.time()
    last = t0
    hits = 0

    for idx, g in enumerate(graphs_list, start=1):
        found, _ = is_induced_subgraph(subgraph_edges, g.edges, n)
        if found:
            hits += 1

        if show_progress:
            now = time.time()
            if now - last >= 1.0 or idx == total:
                pct = 100.0 * idx / max(total, 1)
                rate = idx / max(now - t0, 1e-9)
                eta = (total - idx) / max(rate, 1e-9)
                print(
                    f"\r[filter   ] {idx}/{total} ({pct:5.1f}%) | hits={hits:4d} | ETA {eta:6.1f}s",
                    end="",
                    flush=True,
                )
                last = now

    if show_progress:
        print()

    return hits


def main() -> None:
    import argparse

    parser = argparse.ArgumentParser(
        description="Count non-isomorphic graphs on n vertices and how many contain a chosen induced subgraph."
    )
    parser.add_argument("n", type=int, help="number of vertices (e.g. 6)")
    parser.add_argument("--no-progress", action="store_true", help="disable progress/ETA display")
    args = parser.parse_args()

    n = args.n
    show = not args.no_progress

    # K_{2,2} on vertices {0,1,2,3}.
    k22_edges: List[Edge] = [(0, 2), (0, 3), (1, 2), (1, 3)]

    graphs = enumerate_non_isomorphic_graphs(n, show_progress=show)
    total_noniso = len(graphs)

    # hits = count_containing_induced(graphs, k22_edges, n, show_progress=show)

    print(f"n = {n}")
    print(f"non-isomorphic graphs: {total_noniso}")
    # print(f"non-isomorphic graphs containing induced K2,2: {hits}")


if __name__ == "__main__":
    main()