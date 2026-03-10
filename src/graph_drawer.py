from __future__ import annotations

from tqdm import tqdm
import itertools
import shutil
import subprocess
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

# Type aliases
Vertex = int
Edge = Tuple[Vertex, Vertex]
CanonicalForm = Tuple[Edge, ...]


# Try to switch to an interactive matplotlib backend before importing pyplot.
def _try_enable_interactive_backend() -> str:
    """
    Try to use an interactive backend instead of Agg.
    If this fails, plotting will still work, but plt.show() will not open a window.
    """
    import matplotlib

    # Leave the backend alone if it is already interactive.
    current = matplotlib.get_backend().lower()
    if "agg" not in current:
        return matplotlib.get_backend()

    for candidate in ("TkAgg", "QtAgg", "GTK3Agg", "WXAgg"):
        try:
            matplotlib.use(candidate, force=True)
            return candidate
        except Exception:
            pass

    return matplotlib.get_backend()


_BACKEND = _try_enable_interactive_backend()

# Import pyplot only after choosing the backend.
import matplotlib.pyplot as plt  # noqa: E402
import networkx as nx  # noqa: E402


def _sorted_edge(u: int, v: int) -> Edge:
    return (u, v) if u <= v else (v, u)


def infer_n_from_edges(edges: Sequence[Edge]) -> int:
    if not edges:
        return 0
    return max(max(u, v) for (u, v) in edges) + 1


def graph_to_canonical_form(n: int, edges: Sequence[Edge]) -> CanonicalForm:
    best: Optional[CanonicalForm] = None
    edges = [tuple(e) for e in edges]

    for perm in itertools.permutations(range(n)):
        permuted = [_sorted_edge(perm[u], perm[v]) for (u, v) in edges]
        form = tuple(sorted(permuted))
        if best is None or form < best:
            best = form

    return best if best is not None else tuple()


@dataclass(frozen=True)
class SpecificGraph:
    edges: Tuple[Edge, ...]
    n: int
    canonical: CanonicalForm


def make_specific_graph(edges: Sequence[Edge], n: Optional[int] = None) -> SpecificGraph:
    if n is None:
        n = infer_n_from_edges(edges)
    edges_t = tuple(_sorted_edge(u, v) for (u, v) in edges)
    canon = graph_to_canonical_form(n, edges_t)
    return SpecificGraph(edges=tuple(sorted(edges_t)), n=n, canonical=canon)


def show_graphs_grid(
    graphs: Sequence[SpecificGraph],
    per_page: int = 12,
    seed: int = 0,
) -> None:
    """
    Show the graphs in a paged grid.
    """
    if not graphs:
        print("No graphs to draw.")
        return

    backend = str(_BACKEND).lower().strip()

    # Warn only if matplotlib ended up on a non-interactive backend.
    if backend == "agg":
        print(
            f"[warning] Matplotlib backend is '{_BACKEND}' (non-interactive). "
            "A window cannot be shown.\n"
            "Fix: sudo apt install python3-tk  (and make sure WSLg/X display is available)."
        )

    per_page = max(1, int(per_page))

    for page_start in range(0, len(graphs), per_page):
        chunk = graphs[page_start : page_start + per_page]

        cols = int((len(chunk) ** 0.5) + 0.9999)
        rows = (len(chunk) + cols - 1) // cols

        fig, axes = plt.subplots(rows, cols, figsize=(4 * cols, 4 * rows))

        # axes may be a single Axes object or an array
        if hasattr(axes, "ravel"):
            axes_list = list(axes.ravel())
        else:
            axes_list = [axes]

        # Hide everything first, then fill in the plots we use.
        for ax in axes_list:
            ax.axis("off")

        for i, sg in enumerate(chunk):
            ax = axes_list[i]

            G = nx.Graph()
            G.add_nodes_from(range(sg.n))
            G.add_edges_from(sg.edges)

            pos = nx.spring_layout(G, seed=seed)
            nx.draw_networkx(
                G,
                pos=pos,
                ax=ax,
                with_labels=True,
                node_size=350,
                font_size=10,
                width=1.2,
            )

            ax.set_title(f"Graph {page_start + i + 1}")
            ax.axis("off")

        fig.tight_layout()
        plt.show()

        if page_start + per_page < len(graphs):
            input(
                f"Displayed graphs {page_start+1}-{page_start+len(chunk)}. "
                "Press Enter for next page..."
            )


def generate_specific_macaulay2_code(
    graphs: Sequence[SpecificGraph],
    out_dir: str,
    m2_filename: str = "specific_mac2.m2",
) -> Path:
    out_path = Path(out_dir) / m2_filename
    out_path.parent.mkdir(parents=True, exist_ok=True)

    with out_path.open("w", encoding="utf-8") as f:
        f.write("-- Macaulay2 code for toric ideal analysis\n")
        f.write("-- Generated in the same print/style pattern as graph_counter_no_filter.py\n\n")

        for idx, sg in enumerate(graphs, start=1):
            edges = sg.edges
            num_edges = len(edges)

            vertices_used = sorted({v for e in edges for v in e})
            vertex_to_t: Dict[int, str] = {v: f"t{i+1}" for i, v in enumerate(vertices_used)}

            f.write(f"-- ===== Graph {idx} =====\n")
            f.write(f"-- Edges: {list(edges)}\n")
            f.write(f"-- Canonical form: {sg.canonical}\n\n")

            edge_vars = ", ".join(f"x{j+1}" for j in range(num_edges))
            f.write("-- Edge ring\n")
            f.write(f"R{idx} = QQ[{edge_vars}];\n\n")

            vertex_vars = ", ".join(f"t{j+1}" for j in range(len(vertices_used)))
            f.write("-- Vertex ring\n")
            f.write(f"S{idx} = QQ[{vertex_vars}];\n\n")

            f.write("-- Edge-to-vertex map\n")
            monomials: List[str] = []
            for j, (u, v) in enumerate(edges, start=1):
                mon = f"{vertex_to_t[u]}*{vertex_to_t[v]}"
                monomials.append(mon)
                f.write(f"-- x{j} -> {mon}  (edge {{{u+1},{v+1}}})\n")
            f.write("\n")

            f.write(f"phi{idx} = map(S{idx}, R{idx}, {{{', '.join(monomials)}}});\n\n")
            f.write(f"I{idx} = kernel phi{idx};\n\n")
            f.write(f"J{idx} = ideal mingens I{idx};\n\n")

            f.write("-- Output for this graph\n")
            f.write(f'print("Graph {idx}: ");\n')
            f.write(f'print("  Edges = {list(edges)}");\n')
            f.write(f'print("  Canonical form = {sg.canonical}");\n')
            f.write(f'print("  Regularity = " | toString(regularity I{idx}));\n')
            f.write(f'print("  Number of generators (mingens) = " | toString(numgens J{idx}));\n')
            f.write(f'print("  Degrees of generators (mingens) = " | toString(degrees J{idx}));\n')
            f.write(f'print("  Minimal generators: " | toString J{idx});\n')
            f.write("\n" + "-" * 50 + "\n\n")

    return out_path


def run_macaulay2_script(m2_path: Path, log_path: Path) -> None:
    log_path.parent.mkdir(parents=True, exist_ok=True)

    if shutil.which("M2") is None:
        raise RuntimeError(
            "Macaulay2 executable `M2` was not found in PATH. "
            "Run this from your Ubuntu/WSL terminal where `M2` works."
        )

    proc = subprocess.run(
        ["M2", "--script", str(m2_path)],
        text=True,
        capture_output=True,
    )

    log_path.write_text(proc.stdout + "\n\n--- STDERR ---\n" + proc.stderr, encoding="utf-8")


def main() -> None:
    # Put the chosen graphs here.
    specific_edge_lists: List[List[Edge]] = [
        # Family 1
        # (1,1)
        [(0,1),(1,2),(2,0),
        (3,4),(4,5),(5,3),
        (0,3),
        (1,4)],

        # (2,1)
        [(0,1),(1,2),(2,0),
        (3,4),(4,5),(5,3),
        (0,6),(6,3),
        (1,4)],

        # (2,2)
        [(0,1),(1,2),(2,0),
        (3,4),(4,5),(5,3),
        (0,6),(6,3),
        (1,7),(7,4)],

        # (3,1)
        [(0,1),(1,2),(2,0),
        (3,4),(4,5),(5,3),
        (0,6),(6,7),(7,3),
        (1,4)],

        # (3,2)
        [(0,1),(1,2),(2,0),
        (3,4),(4,5),(5,3),
        (0,6),(6,7),(7,3),
        (1,8),(8,4)],

        # (3,3)
        [(0,1),(1,2),(2,0),
        (3,4),(4,5),(5,3),
        (0,6),(6,7),(7,3),
        (1,8),(8,9),(9,4)],

        # Family 2
        # n = 1
        [(0,1),(1,2),(2,0),(1,3),(3,0),
        (2,3)],

        # n = 2
        [(0,1),(1,2),(2,0),(1,3),(3,0),
        (2,4),(4,3)],

        # n = 3
        [(0,1),(1,2),(2,0),(1,3),(3,0),
        (2,4),(4,5),(5,3)],

        # n = 4
        [(0,1),(1,2),(2,0),(1,3),(3,0),
        (2,4),(4,5),(5,6),(6,3)],

        # n = 5
        [(0,1),(1,2),(2,0),(1,3),(3,0),
        (2,4),(4,5),(5,6),(6,7),(7,3)],

        # n = 6
        [(0,1),(1,2),(2,0),(1,3),(3,0),
        (2,4),(4,5),(5,6),(6,7),(7,8),(8,3)],

        # n = 7
        [(0,1),(1,2),(2,0),(1,3),(3,0),
        (2,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,3)],

    ]

        # [(0,1),(1,2),(2,0),  (0,3),(3,4),(4,0)],
        # [(0,1),(1,2),(2,0),  (3,4),(4,5),(5,3),  (0,3)],
        # [(0,1),(1,2),(2,0),  (4,5),(5,6),(6,4),  (0,3),(3,4)],
        # [(0,1),(1,2),(2,0),  (5,6),(6,7),(7,5),  (0,3),(3,4),(4,5)],
        # [(0,1),(1,2),(2,0),  (6,7),(7,8),(8,6),  (0,3),(3,4),(4,5),(5,6)],
        # [(0,1),(1,2),(2,0),  (7,8),(8,9),(9,7),  (0,3),(3,4),(4,5),(5,6),(6,7)],
        # [(0,1),(1,2),(2,0),  (8,9),(9,10),(10,8),  (0,3),(3,4),(4,5),(5,6),(6,7),(7,8)],
        # [(0,1),(1,2),(2,0),  (1,3),(3,0)],
        # [(0,1),(1,2),(2,0),  (0,3),(3,4),(4,0),  (1,3)],
        # [(0,1),(1,2),(2,0),  (0,3),(3,4),(4,0),  (1,5),(5,3)],
        # [(0,1),(1,2),(2,0),  (0,3),(3,4),(4,0),  (1,5),(5,6),(6,3)],
        # [(0,1),(1,2),(2,0),  (0,3),(3,4),(4,0),  (1,5),(5,6),(6,7),(7,3)],
        # [(0,1),(1,2),(2,0),  (0,3),(3,4),(4,0),  (1,5),(5,6),(6,7),(7,8),(8,3)],
        # [(0,1),(1,2),(2,0),  (0,3),(3,4),(4,0),  (1,5),(5,6),(6,7),(7,8),(8,9),(9,3)],
        # [(0,1),(1,2),(2,0),  (0,3),(3,4),(4,0),  (1,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,3)],

    graphs = []
    for e in tqdm(specific_edge_lists, desc="Preparing graphs"):
        graphs.append(make_specific_graph(e))

    # Show the graphs in a grid.
    show_graphs_grid(graphs, per_page=12, seed=0)

    # Write Macaulay2 input and run it.
    out_dir = Path("outputs") / "specific"
    m2_path = generate_specific_macaulay2_code(graphs, out_dir=str(out_dir))
    print(f"Wrote: {m2_path}")

    log_path = out_dir / "specific_toric_analysis.txt"
    run_macaulay2_script(m2_path, log_path)
    print(f"Wrote: {log_path}")


if __name__ == "__main__":
    main()

# cd ~/toric-project
# python3 -m venv venv
# source venv/bin/activate
# pip install tqdm networkx matplotlib

# Run command:
# source venv/bin/activate
# python3 src/graph_drawer.py