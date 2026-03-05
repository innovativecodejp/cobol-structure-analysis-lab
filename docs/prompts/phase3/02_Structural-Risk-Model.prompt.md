# 02 Structural Risk Model Prompt

## Research Context
**COBOL Structure Analysis Laboratory** - Phase 3
Goal: Quantify the risk associated with migrating specific code structures.

Previous Output: `docs/60_decision/01_Guarantee_Decision_Space.md` established the **Safety Region** $\mathcal{S}$ and **Critical Guarantees** $G_{crit}$.

## Task
Construct the **Structural Risk Model**.

We need to define a mathematical function that maps a program's structure (AST, CFG, DFG) to a scalar "Risk Value" or a "Risk Probability" of failing to reach the Safety Region.

## Theoretical Focus (from Roadmap)
1.  **Migration Debt ($D_{debt}$)**:
    - Quantify the distance between the current state $S_{current}$ and the safety region $\mathcal{S}$.
    - $D_{debt}(S) = \min_{T \in \mathcal{S}} d(S, T)$ ?
2.  **Complexity Risk ($R_{cplx}$)**:
    - How does Cyclomatic Complexity and Halstead Volume correlate with the *probability* of losing guarantees during transformation?
    - Hypothesis: High complexity increases the variance of the transition function.
3.  **Dependency Risk ($R_{dep}$)**:
    - Risk propagation through the dependency graph $D$.
    - If a foundational guarantee is shaky, how does that affect dependent guarantees?

## Required Definitions
- **Risk Function $Risk(Structure)$**: The primary output.
- **Probability of Failure $P_{fail}(Transition)$**: The likelihood that a migration step $S \to S'$ fails to preserve intended properties.
- **Risk Topology**: Identifying high-risk clusters in the code.

## Output Structure
1.  **Introduction**: From Guarantee Space to Risk Quantification.
2.  **Migration Debt Model**: Formalizing the "Distance to Safety".
3.  **The Structural Risk Function**: Combining Debt, Complexity, and Dependency.
4.  **Probabilistic View**: Risk as $P(S_{target} \notin \mathcal{S})$.
5.  **Risk Classification**: Low, Medium, High, Critical.
6.  **Conclusion**: Input for Feasibility Model (Task 3).

## Output File
`docs/60_decision/02_Structural_Risk_Model.md`
