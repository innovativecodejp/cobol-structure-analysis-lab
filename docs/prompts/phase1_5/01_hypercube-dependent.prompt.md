# Phase1.5 Prompt01

## Hypercube / Dependent Guarantee Space

### Goal

Refine the structural geometry of Guarantee Space.

### Tasks

1.  Define Guarantee Space

G = P(P)

Interpret it as:

-   Power set
-   Boolean lattice
-   N-dimensional hypercube

Explain the correspondence:

P(P) ≅ {0,1}\^\|P\|

Each guarantee state corresponds to a vertex of the hypercube.

2.  Introduce dependency relation

D ⊆ P × P

Define partial order:

p_j ≤\_D p_i (p_i depends on p_j)

3.  Define Dependent Guarantee Space

G_dep = Idl(P, ≤\_D)

Where Idl(P, ≤\_D) are ideals (lower sets).

Explain that:

-   G_dep ⊂ P(P)
-   G_dep forms a finite distributive lattice.

### Output

Dependent-Guarantee-Space.md
