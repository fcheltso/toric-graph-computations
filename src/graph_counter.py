"""
graph_counter_v10_simplified.py

Enumerates non-isomorphic simple graphs on n vertices by brute force,
filters those containing a chosen induced subgraph, and writes Macaulay2
input for the toric ideal calculations used in the project.
"""

from __future__ import annotations

import itertools
import time
import math
import subprocess
import shutil
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Dict, Iterable, List, Optional, Sequence, Tuple

Vertex = int
Edge = Tuple[Vertex, Vertex]
CanonicalForm = Tuple[Edge, ...]


@dataclass(frozen=True)
class GraphRecord:
    """Store one representative of an isomorphism class."""
    canonical: CanonicalForm
    edges: Tuple[Edge, ...]
    edge_mask: int


@dataclass(frozen=True)
class ContainingRecord(GraphRecord):
    """Graph record together with a witness map for the induced subgraph."""
    mapping: Dict[Vertex, Vertex]


def _sorted_edge(u: int, v: int) -> Edge:
    return (u, v) if u <= v else (v, u)


def graph_to_canonical_form(n: int, edges: Sequence[Edge]) -> CanonicalForm:
    """
    Return a canonical edge list by checking all vertex relabellings and
    taking the lexicographically smallest result.
    """
    best: Optional[CanonicalForm] = None
    edges = [tuple(e) for e in edges]

    for perm in itertools.permutations(range(n)):
        permuted = [_sorted_edge(perm[u], perm[v]) for (u, v) in edges]
        form = tuple(sorted(permuted))
        if best is None or form < best:
            best = form

    # For n >= 1, best is always defined, including the empty graph.
    return best if best is not None else tuple()


def enumerate_non_isomorphic_graphs(n: int, show_progress: bool = True) -> List[GraphRecord]:
    """
    Go through all graphs on n vertices and keep one representative from
    each isomorphism class.
    """
    vertices = list(range(n))
    all_edges = list(itertools.combinations(vertices, 2))
    total = 1 << len(all_edges)

    unique: Dict[CanonicalForm, Tuple[Tuple[Edge, ...], int]] = {}

    start = time.time()
    for mask in range(total):
        edges = tuple(e for i, e in enumerate(all_edges) if mask & (1 << i))
        canonical = graph_to_canonical_form(n, edges)
        if canonical not in unique:
            unique[canonical] = (edges, mask)

        if show_progress and mask % 500 == 0 and mask > 0:
            elapsed = time.time() - start
            pct = 100.0 * mask / total
            print(f"n={n}: {pct:5.1f}%  unique={len(unique):4d}  elapsed={elapsed:6.1f}s", end="\r")

    if show_progress:
        elapsed = time.time() - start
        print(f"n={n}: 100.0%  unique={len(unique):4d}  elapsed={elapsed:6.1f}s")

    return [GraphRecord(canonical=c, edges=e, edge_mask=m) for c, (e, m) in unique.items()]


def is_induced_subgraph(
    small_edges: Sequence[Edge],
    large_edges: Sequence[Edge],
    n_large: int,
) -> Tuple[bool, Optional[Dict[Vertex, Vertex]]]:
    """
    Check whether the graph with edge set small_edges appears as an induced
    subgraph of the graph with edge set large_edges on {0, ..., n_large - 1}.
    """
    # Recover the vertex set of the smaller graph from its edges.
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

    # Check all injective maps from the smaller graph into the larger one.
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


def filter_graphs_by_induced_subgraph(
    graphs: Iterable[GraphRecord],
    subgraph_edges: Sequence[Edge],
    n: int,
) -> List[ContainingRecord]:
    """Keep only the graphs containing the chosen induced subgraph."""
    out: List[ContainingRecord] = []
    for g in graphs:
        found, mapping = is_induced_subgraph(subgraph_edges, g.edges, n)
        if found and mapping is not None:
            out.append(ContainingRecord(canonical=g.canonical, edges=g.edges, edge_mask=g.edge_mask, mapping=mapping))
    return out


def generate_macaulay2_code(
    graphs: Sequence[ContainingRecord],
    n: int,
    filename: Optional[str] = None,
    out_dir: str = ".",
) -> str:
    """
    Write a Macaulay2 script that builds the toric ideals, computes minimal
    generators, and prints the data used in the project.
    """
    if filename is None:
        filename = f"toric_analysis_n{n}.m2"
    path = Path(out_dir) / filename
    with path.open("w", encoding="utf-8") as f:
        f.write("-- Macaulay2 code for toric ideal analysis\n")
        f.write("-- Generated from graph_counter_v10_simplified.py\n")
        f.write(f"-- Analyzing graphs on n={n} vertices containing the chosen induced subgraph\n\n")

        for idx, rec in enumerate(graphs, start=1):
            edges = rec.edges
            num_edges = len(edges)

            # Keep the same convention as before: only use vertex variables
            # for vertices that actually appear.
            vertices_used = sorted({v for e in edges for v in e})
            vertex_to_t = {v: f"t{i+1}" for i, v in enumerate(vertices_used)}

            f.write(f"-- ===== Graph {idx} =====\n")
            f.write(f"-- Edges: {list(edges)}\n")
            f.write(f"-- Canonical form: {rec.canonical}\n\n")

            edge_vars = ", ".join(f"x{j+1}" for j in range(num_edges))
            f.write("-- Edge ring\n")
            f.write(f"R{idx} = QQ[{edge_vars}];\n\n")

            vertex_vars = ", ".join(f"t{j+1}" for j in range(len(vertices_used)))
            f.write("-- Vertex ring\n")
            f.write(f"S{idx} = QQ[{vertex_vars}];\n\n")

            f.write("-- Edge-to-vertex map\n")
            monomials = []
            for j, (u, v) in enumerate(edges, start=1):
                mon = f"{vertex_to_t[u]}*{vertex_to_t[v]}"
                monomials.append(mon)
                # Keep the vertex labels in the comment 1-indexed.
                f.write(f"-- x{j} -> {mon}  (edge {{{u+1},{v+1}}})\n")

            f.write("\n")
            f.write(f"phi{idx} = map(S{idx}, R{idx}, {{{', '.join(monomials)}}});\n\n")
            f.write("-- Toric ideal\n")
            f.write(f"I{idx} = kernel phi{idx};\n\n")
            f.write(f"J{idx} = ideal mingens I{idx};\n\n")

            f.write("-- Output for this graph\n")
            f.write(f'print("Graph {idx}: ");\n')
            f.write(f'print("  Regularity = " | toString(regularity I{idx}));\n')
            f.write(f'print("  Number of generators (mingens) = " | toString(numgens J{idx}));\n')
            f.write(f'print("  Degrees of generators (mingens) = " | toString(degrees J{idx}));\n')
            f.write(f'print("  Minimal generators: " | toString J{idx});\n')
            f.write("\n" + "-" * 50 + "\n\n")

    return str(path)



# ---------------------------
# Macaulay2 runner (optional)
# ---------------------------

def run_macaulay2_script(m2_path: str | Path, log_path: str | Path) -> str:
    """Run a Macaulay2 script and save stdout/stderr to a log file."""
    m2_path = Path(m2_path)
    log_path = Path(log_path)
    log_path.parent.mkdir(parents=True, exist_ok=True)

    if shutil.which("M2") is None:
        raise RuntimeError(
            "Macaulay2 executable `M2` was not found in PATH. "
            "In WSL, install Macaulay2 and ensure `M2` is available in your terminal."
        )

    proc = subprocess.run(
        ["M2", "--script", str(m2_path)],
        text=True,
        capture_output=True,
    )

    log_path.write_text(proc.stdout + "\n\n--- STDERR ---\n" + proc.stderr, encoding="utf-8")
    return str(log_path)


def project_paths(n: int, base_dir: str = "outputs") -> Dict[str, Path]:
    """Project folder layout."""
    base = Path(base_dir) / f"n{n}"
    return {
        "base": base,
        "m2": base / "m2",
        "logs": base / "logs",
        "viz": base / "viz",
        "viz_all": base / "viz" / "all",
        "viz_containing": base / "viz" / "containing",
    }




# ---------------------------
# Visualization (optional)
# ---------------------------

def make_induced_highlighter(subgraph_edges: Sequence[Edge]) -> Callable[[GraphRecord], Iterable[Edge]]:
    """Build a helper that returns the highlighted edge set for a witness copy."""

    def _hi(rec: GraphRecord) -> List[Edge]:
        mapping = getattr(rec, "mapping", None)
        if not mapping:
            return []
        out: List[Edge] = []
        for u, v in subgraph_edges:
            if u in mapping and v in mapping:
                out.append(_sorted_edge(mapping[u], mapping[v]))
        return out

    return _hi

def export_graph_gallery_pdf(
    graphs: Sequence[GraphRecord],
    n: int,
    pdf_path: str,
    per_page: int = 12,
    highlight_edges: Optional[Callable[[GraphRecord], Iterable[Edge]]] = None,
) -> str:
    """Export the graphs to a multi-page PDF."""
    try:
        import networkx as nx  # type: ignore
        import matplotlib.pyplot as plt  # type: ignore
        from matplotlib.backends.backend_pdf import PdfPages  # type: ignore
    except Exception as e:
        raise ImportError(
            "export_graph_gallery_pdf requires networkx and matplotlib. "
            "Install them (e.g. pip install networkx matplotlib) and try again."
        ) from e

    def to_nx_graph(edges: Sequence[Edge]) -> "nx.Graph":
        G = nx.Graph()
        G.add_nodes_from(range(n))
        G.add_edges_from(edges)
        return G

    graphs_per_page = max(1, per_page)
    cols = int(math.ceil(math.sqrt(graphs_per_page)))
    rows = int(math.ceil(graphs_per_page / cols))

    with PdfPages(pdf_path) as pdf:
        for page_start in range(0, len(graphs), graphs_per_page):
            chunk = graphs[page_start : page_start + graphs_per_page]
            fig, axes = plt.subplots(rows, cols, figsize=(8.27, 11.69))  # A4 portrait
            axes_list = axes.ravel() if hasattr(axes, "ravel") else [axes]

            # Hide empty panels on the last page.
            for ax in axes_list[len(chunk):]:
                ax.axis("off")

            for local_idx, (ax, rec) in enumerate(zip(axes_list, chunk), start=1):
                Gnx = to_nx_graph(rec.edges)
                pos = nx.spring_layout(Gnx, seed=0)  # fixed layout for reproducibility

                # Draw the graph first.
                nx.draw_networkx(
                    Gnx,
                    pos=pos,
                    ax=ax,
                    with_labels=True,
                    node_size=250,
                    font_size=8,
                    width=1.0,
                )

                # Highlight a selected edge set if requested.
                if highlight_edges is not None:
                    hi = list(highlight_edges(rec) or [])
                    if hi:
                        nx.draw_networkx_edges(
                            Gnx,
                            pos=pos,
                            ax=ax,
                            edgelist=hi,
                            width=2.5,
                            edge_color="red",
                        )
                ax.set_title(f"Graph {page_start + local_idx}", fontsize=10)
                ax.axis("off")

            fig.tight_layout()
            pdf.savefig(fig)
            plt.close(fig)

    return pdf_path


def export_graph_pngs(
    graphs: Sequence[GraphRecord],
    n: int,
    out_dir: str,
    highlight_edges: Optional[Callable[[GraphRecord], Iterable[Edge]]] = None,
) -> str:
    """Export one PNG per graph."""
    try:
        import networkx as nx  # type: ignore
        import matplotlib.pyplot as plt  # type: ignore
    except Exception as e:
        raise ImportError(
            "export_graph_pngs requires networkx and matplotlib. "
            "Install them (e.g. pip install networkx matplotlib) and try again."
        ) from e

    Path(out_dir).mkdir(parents=True, exist_ok=True)

    def to_nx_graph(edges: Sequence[Edge]) -> "nx.Graph":
        G = nx.Graph()
        G.add_nodes_from(range(n))
        G.add_edges_from(edges)
        return G

    for idx, rec in enumerate(graphs, start=1):
        fig = plt.figure(figsize=(4, 4))
        ax = fig.add_subplot(111)
        Gnx = to_nx_graph(rec.edges)
        pos = nx.spring_layout(Gnx, seed=0)
        nx.draw_networkx(
            Gnx,
            pos=pos,
            ax=ax,
            with_labels=True,
            node_size=350,
            font_size=10,
            width=1.2,
        )

        if highlight_edges is not None:
            hi = list(highlight_edges(rec) or [])
            if hi:
                nx.draw_networkx_edges(
                    Gnx,
                    pos=pos,
                    ax=ax,
                    edgelist=hi,
                    width=3.0,
                    edge_color="red",
                )
        ax.set_title(f"Graph {idx}")
        ax.axis("off")
        fig.tight_layout()
        fig.savefig(str(Path(out_dir) / f"graph_{idx:03d}.png"), dpi=200)
        plt.close(fig)

    return out_dir

def main() -> None:
    """
    Main project run:
    - enumerate non-isomorphic graphs on n vertices;
    - filter those containing an induced K_{2,2};
    - write a Macaulay2 script;
    - optionally run Macaulay2;
    - optionally export graph images.
    """

    # ----------------
    # CONFIG
    # ----------------
    n = 5

    # Induced subgraph to look for.
    k22_edges: List[Edge] = [(0, 2), (0, 3), (1, 2), (1, 3)]

    # Macaulay2
    run_m2 = True          # set False to skip running Macaulay2
    output_root = "outputs"

    # Visualisation
    visualize = True       # set True to export graph galleries
    visualize_which = "both"  # "containing", "all", or "both"
    per_page = 12          # fewer per page gives larger graphs

    # ----------------
    # Pipeline
    # ----------------
    paths = project_paths(n=n, base_dir=output_root)
    for p in paths.values():
        if isinstance(p, Path):
            p.mkdir(parents=True, exist_ok=True)

    print(f"Enumerating non-isomorphic graphs on n={n} vertices...")
    graphs = enumerate_non_isomorphic_graphs(n=n, show_progress=True)
    print(f"Found {len(graphs)} non-isomorphic graphs (representatives).")

    print("Filtering graphs that contain K_{2,2} as an induced subgraph...")
    containing = filter_graphs_by_induced_subgraph(graphs, k22_edges, n=n)
    print(f"Found {len(containing)} graphs containing K_{{2,2}} as an induced subgraph.")

    # Write Macaulay2 input.
    m2_file = Path(paths["m2"]) / f"toric_analysis_n{n}.m2"
    out_file = generate_macaulay2_code(containing, n=n, filename=m2_file.name, out_dir=str(m2_file.parent))
    print(f"Wrote Macaulay2 input: {out_file}")

    # Run Macaulay2 if requested.
    if run_m2:
        log_file = Path(paths["logs"]) / f"toric_analysis_n{n}.txt"
        log_path = run_macaulay2_script(m2_file, log_file)
        print(f"Ran Macaulay2 and saved log: {log_path}")

    # Export graph images if requested.
    if visualize:
        highlight_k22 = make_induced_highlighter(k22_edges)

        if visualize_which in ("containing", "both"):
            export_graph_gallery_pdf(
                containing,
                n=n,
                pdf_path=str(Path(paths["viz_containing"]) / f"graphs_n{n}_containing_gallery.pdf"),
                per_page=per_page,
                highlight_edges=highlight_k22,
            )
            export_graph_pngs(
                containing,
                n=n,
                out_dir=str(Path(paths["viz_containing"]) / "pngs"),
                highlight_edges=highlight_k22,
            )
            print(f"Wrote containing-gallery PDF/PNGs under: {paths['viz_containing']}")

        if visualize_which in ("all", "both"):
            export_graph_gallery_pdf(
                graphs,
                n=n,
                pdf_path=str(Path(paths["viz_all"]) / f"graphs_n{n}_all_gallery.pdf"),
                per_page=per_page,
                highlight_edges=None,
            )
            export_graph_pngs(
                graphs,
                n=n,
                out_dir=str(Path(paths["viz_all"]) / "pngs"),
                highlight_edges=None,
            )
            print(f"Wrote all-graphs PDF/PNGs under: {paths['viz_all']}")



if __name__ == "__main__":
    main()