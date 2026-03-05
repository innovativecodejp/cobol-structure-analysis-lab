# 01 Guarantee Space Formalization Prompt

## Research Context
**COBOL Structure Analysis Laboratory** - Phase 3
Goal: Construct a structural theory that supports legacy system migration decisions.

This task bridges Phase 2 (Guarantee Space Theory) and Phase 3 (Migration Decision).
We need to formalize the Guarantee Space not just as a descriptive model, but as a **decision space**.

## Task
Formalize **Guarantee Space for Decision Making**.

Define the Guarantee Space $\mathcal{G}$ specifically for the purpose of binary decision making (Safe vs. Unsafe).
The output must provide the mathematical foundation for defining "Migration Safety".

## Theoretical Focus (from Roadmap)
1.  **Guarantee Lattice as Decision Space**:
    - Formalize $\mathcal{G}$ as a Distributive Lattice.
    - Define the "Safety Region" within this lattice.
2.  **Critical Guarantees ($G_{crit}$)**:
    - Define the subset of guarantees that *must* be preserved for a valid migration.
    - $G_{crit} \subset \mathcal{P}(\mathbb{P})$
3.  **Structural Mapping**:
    - How do AST/CFG/DFG patterns map to specific regions in the Guarantee Space?

## Required Definitions
- **Guarantee State $S$**: A set of preserved properties.
- **Safety Function $Safe(S)$**: A boolean function determining if state $S$ is acceptable.
- **Critical Core**: The infimum of all safe states? Or a specific ideal?
- **Guarantee Distance**: Metric to measure distance from Safety.

## Output Structure
1.  **Introduction**: Guarantee Space in the context of decision making.
2.  **Formal Definitions**: Lattice, States, Transitions.
3.  **Critical Guarantee Theory**: Definition of $G_{crit}$ and Essential Properties.
4.  **The Safety Sublattice**: Mathematical definition of the "Safe" region.
5.  **Structural Mapping**: Connecting code structure to lattice points.
6.  **Conclusion**: Summary for Risk Model (Task 2).

## Output File
`docs/60_decision/01_Guarantee_Decision_Space.md`
