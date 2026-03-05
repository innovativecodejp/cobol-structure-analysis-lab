# 04 Migration Decision Boundary Prompt

## Research Context
**COBOL Structure Analysis Laboratory** - Phase 3
Goal: Establish the thresholds for "Go/No-Go" migration decisions.

Previous Output:
- `03_Migration_Feasibility.md`: Defined $IsMigratable(S, B)$.

## Task
Define **Decision Boundaries**.

We need to formalize the decision logic that categorizes a system into specific migration strategies (Direct, Refactor, Rewrite, Retire) based on the Risk and Feasibility values calculated in previous tasks.
This task introduces the element of **Business Tolerance**.

## Theoretical Focus (from Roadmap)
1.  **Risk Tolerance Function ($\tau(Context)$)**:
    - Not all organizations have the same risk appetite.
    - Define a tolerance threshold based on business context (Mission Critical vs. Internal Tool).
2.  **The Decision Inequality**:
    - $Risk(System) < \tau(Context)$ is the condition for "Go".
    - Formalize the trade-off: Higher Risk is acceptable only if Business Value is high?
3.  **Strategy Mapping**:
    - Map regions of the (Risk, Cost) plane to strategies.
    - **Direct Migration**: Low Risk, Low Cost.
    - **Refactor**: Medium Risk, Medium Cost.
    - **Rewrite**: High Risk, High Cost (but feasible).
    - **Retain/Retire**: Infeasible.

## Required Definitions
- **Decision Space**: $\mathbb{D} = Risk \times Cost$.
- **Strategy Function**: $Strategy(R, C) \to \{Direct, Refactor, Rewrite, Retain\}$.
- **Sensitivity**: $\frac{\partial Decision}{\partial Risk}$.

## Output Structure
1.  **Introduction**: From Feasibility to Strategy.
2.  **The Decision Space**: Visualizing Risk vs. Cost.
3.  **Risk Tolerance**: Context-dependent thresholds.
4.  **Strategy Classification**: The 4 Quadrants of Migration.
5.  **Decision Boundary Definition**: Mathematical boundaries.
6.  **Conclusion**: Summary for Case Study (Task 5).

## Output File
`docs/60_decision/04_Decision_Boundary.md`
