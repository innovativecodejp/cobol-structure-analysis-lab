# Prompt01: Migration Path Theory

## Goal

Formalize migration as a path problem on the Guarantee Transition Graph.

## Task

Define Migration Path on the Guarantee Transition Graph.

### Definitions

Path = (S0, S1, ..., Sn)

Conditions:

S0 = ⊥ = ∅\
Sn = ⊤ = P\
(Si, Si+1) ∈ E

### Atomic Migration Step

Si+1 = Si ∪ {p}

### Path Length

L(Path) = number of atomic steps

### Interpretation

Migration planning becomes a graph path finding problem.

## Output

Migration-Path-Theory.md
