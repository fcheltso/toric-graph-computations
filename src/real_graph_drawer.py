"""
draw_graph_from_edges.py

Draw a simple undirected graph from an edge list and save it as a PNG.

Requires:
  pip install networkx matplotlib
"""

from __future__ import annotations

from pathlib import Path
from typing import Iterable, List, Tuple, Optional

Edge = Tuple[int, int]


def draw_graph(
    edges: List[Edge],
    n: Optional[int] = None,
    out_path: str = "graph.png",
    title: Optional[str] = None,
    seed: int = 0,
    dpi: int = 200,
) -> str:
    # Import here so the error message is clearer if the packages are missing.
    try:
        import networkx as nx  # type: ignore
        import matplotlib.pyplot as plt  # type: ignore
    except Exception as e:
        raise ImportError(
            "This script requires networkx and matplotlib. "
            "Install them with: pip install networkx matplotlib"
        ) from e

    # If n is not given, work it out from the largest vertex label in the edge list.
    if n is None:
        if edges:
            n = max(max(u, v) for (u, v) in edges) + 1
        else:
            n = 0

    G = nx.Graph()
    G.add_nodes_from(range(n))
    G.add_edges_from(edges)

    # Fix the layout so repeated runs give the same picture.
    pos = nx.spring_layout(G, seed=seed)

    fig = plt.figure(figsize=(4, 4))
    ax = fig.add_subplot(111)

    nx.draw_networkx(
        G,
        pos=pos,
        ax=ax,
        with_labels=True,
        node_size=350,
        font_size=10,
        width=1.2,
    )

    if title is not None:
        ax.set_title(title)

    ax.axis("off")
    fig.tight_layout()

    out = Path(out_path)
    out.parent.mkdir(parents=True, exist_ok=True)
    fig.savefig(str(out), dpi=dpi)
    plt.close(fig)

    return str(out)


if __name__ == "__main__":
    # Example graph
    edges = [(0, 1), (0, 2), (0, 3), (0, 4), (1, 2), (1, 5), (3, 4), (3, 6), (5, 6)]

    png = draw_graph(
        edges=edges,
        n=None,
        out_path="graph.png",
        seed=0,
        dpi=200,
    )
    print(f"Wrote: {png}")