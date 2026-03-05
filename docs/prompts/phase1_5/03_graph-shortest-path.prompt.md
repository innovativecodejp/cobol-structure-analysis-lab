# Phase1.5 Prompt03

## Guarantee Graph / Shortest Path

### Goal

Transform Guarantee Space into a transition graph for migration
analysis.

### Tasks

1.  Define Guarantee Transition Graph

G_trans = (V, E)

Where

V = G_dep

E = cover relations of the lattice.

2.  Define cover relation

S ⋖ T

iff

T = S ∪ {p} p ∉ S S ∪ {p} ∈ G_dep

3.  Show graph properties

-   Directed
-   Acyclic (DAG)
-   Layered by \|S\|

4.  Define Migration Path

A path from ⊥ to ⊤ in G_trans.

5.  Interpret migration planning as

Shortest Path problem on the lattice graph.

### Output

Guarantee-Transition-Graph.md
