# 05 Case Study Mapping Prompt

## Research Context
**COBOL Structure Analysis Laboratory** - Phase 3
Goal: Validate the Migration Decision Model against representative COBOL patterns.

Previous Outputs:
- Task 1: Safety Region $\mathcal{S}$
- Task 2: Structural Risk $R_{struct}$
- Task 3: Feasibility $C_{min} \le B$
- Task 4: Decision Boundaries (Direct, Refactor, Rewrite, Retire)

## Task
Map the theoretical decision model to concrete COBOL program structures.

We need to demonstrate how the abstract mathematical concepts (Lattice, Risk, Boundary) apply to real-world legacy code scenarios.

## Theoretical Focus (from Roadmap)
1.  **Case A: The "God Class" (Monolithic Batch)**:
    - Structure: High coupling, massive shared state (COPYBOOK).
    - Analysis: Show how $R_{struct}$ is high due to Data Complexity ($C_{dfg}$), pushing it into the **Refactor** or **Rewrite** quadrant.
2.  **Case B: "Spaghetti Code" (Unstructured Logic)**:
    - Structure: High Cyclomatic Complexity, irreducible CFG (GOTOs).
    - Analysis: Show how $P_{fail}$ is high, increasing $Cost(S \to S')$, potentially making it **Infeasible** (Blocking Structure).
3.  **Case C: Well-Structured Module**:
    - Structure: Functional cohesion, clear interfaces.
    - Analysis: Show low Risk and Cost, mapping to **Direct Migration**.

## Required Analysis Steps for Each Case
1.  **Structural Description**: AST/CFG/DFG characteristics.
2.  **Metric Calculation**: Estimate $D_{debt}$ and $C(S)$.
3.  **Risk & Feasibility Evaluation**: Compute $R_{struct}$ and $C_{min}$.
4.  **Decision**: Map to the $\mathbb{D}$ space and select a strategy.

## Output Structure
1.  **Introduction**: Methodology of application.
2.  **Case Study A**: Monolith Analysis.
3.  **Case Study B**: Spaghetti Code Analysis.
4.  **Case Study C**: Clean Code Analysis.
5.  **Comparative Summary**: Table of Risk/Cost/Decision.
6.  **Conclusion**: Validation of the model's discriminatory power.

## Output File
`docs/60_decision/05_Case_Study_Analysis.md`
