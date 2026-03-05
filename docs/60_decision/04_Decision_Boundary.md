# 04. Decision Boundary Model

**Phase 3: Migration Decision Model**  
**Document ID:** `docs/60_decision/04_Decision_Boundary.md`  
**Date:** 2026-03-05

---

## 1. Introduction

The **Decision Boundary Model** formalizes the logic for categorizing a legacy system into a specific migration strategy. It synthesizes the outputs of previous tasks:
*   **Guarantee Decision Space** (Task 1): Is the target state safe?
*   **Structural Risk** (Task 2): What is the probability of failure? ($R_{struct}$)
*   **Migration Feasibility** (Task 3): What is the minimum cost? ($C_{min}$)

This model introduces **Business Context** as a variable, defining thresholds for "Go/No-Go" decisions based on risk tolerance and budget.

---

## 2. The Decision Space

We define the **Migration Decision Space ($\mathbb{D}$)** as a 2-dimensional plane defined by Structural Risk and Migration Cost:

$$
\mathbb{D} = \{ (r, c) \in \mathbb{R}_{\ge 0} \times \mathbb{R}_{\ge 0} \}
$$

Where:
*   $r = R_{struct}(S)$: The quantified structural risk (from Task 2).
*   $c = C_{min}(S)$: The minimum estimated migration cost (from Task 3).

Every legacy system maps to a single point $P(S) = (R_{struct}(S), C_{min}(S))$ in this space.

---

## 3. Risk Tolerance and Context

A raw risk value of "50" means nothing without context. A mission-critical banking core has a much lower risk tolerance than an internal cafeteria menu system.

We define a **Context Vector ($\vec{K}$)** representing business constraints:
*   $K_{budget}$: Maximum allowable cost.
*   $K_{risk}$: Maximum acceptable risk (probability of failure).
*   $K_{time}$: Maximum duration.

The **Feasible Region** $\mathcal{F}$ is the rectangular area defined by these constraints:

$$
\mathcal{F}(\vec{K}) = \{ (r, c) \in \mathbb{D} \mid r \le K_{risk} \land c \le K_{budget} \}
$$

If $P(S) \notin \mathcal{F}(\vec{K})$, the migration is infeasible under current constraints.

---

## 4. Strategy Classification (The 4 Quadrants)

Within the decision space, we identify four primary strategic regions. Let $R_{low}, R_{high}$ and $C_{low}, C_{high}$ be thresholds derived from standard industry benchmarks or organizational capability.

### 4.1 Strategy Function

$$
Strategy(r, c) = \begin{cases} 
\textbf{Direct Migration} & \text{if } r < R_{low} \land c < C_{low} \\
\textbf{Refactor First} & \text{if } R_{low} \le r < R_{high} \land c < C_{high} \\
\textbf{Rewrite / Rebuild} & \text{if } r \ge R_{high} \land c < K_{budget} \\
\textbf{Retain / Retire} & \text{if } c \ge K_{budget} \lor r > K_{risk}
\end{cases}
$$

### 4.2 Detailed Strategy Definitions

1.  **Direct Migration (Rehost / Automated Conversion)**
    *   **Context**: Low Risk, Low Cost.
    *   **Structure**: Well-structured code, standard dependencies.
    *   **Action**: Use automated tools to translate code 1-to-1.

2.  **Refactor First (Phased Migration)**
    *   **Context**: Medium Risk, Medium Cost.
    *   **Structure**: Technical debt exists (e.g., some spaghetti code) but is localized.
    *   **Action**:
        1.  Refactor within legacy environment to reduce $R_{struct}$ below $R_{low}$.
        2.  Perform Direct Migration.

3.  **Rewrite / Rebuild (Re-architecture)**
    *   **Context**: High Risk, High Cost (but within budget).
    *   **Structure**: Blocking structures present (e.g., deep entanglement, irreducible control flow).
    *   **Action**: Abandon the code structure. Extract business logic specs ($G_{crit}$) and build a new system that satisfies $G_{crit}$.

4.  **Retain / Retire (Do Nothing)**
    *   **Context**: Cost exceeds budget OR Risk exceeds tolerance.
    *   **Structure**: "Nuclear waste" code—too risky to touch, too expensive to fix.
    *   **Action**: Encapsulate (wrap) the legacy system or decommission it.

---

## 5. Decision Boundary Definition

The boundaries between these strategies are not rigid lines but **decision curves**.

### 5.1 The Value-Risk Trade-off

Often, higher risk is acceptable if the business value is high.
Let $V(S)$ be the Business Value of the system.
The effective Risk Threshold $K_{risk}$ is a function of Value:

$$
K_{risk}(S) = BaseTolerance + \gamma \cdot V(S)
$$

### 5.2 The Iso-Utility Curve

We can define a utility function $U(r, c)$ representing the "net benefit" of migration.
The decision boundary is the level set where $U(r, c) = 0$.

$$
U(r, c) = V(S) - (c + \lambda \cdot r)
$$
Where $\lambda$ is the "cost of risk" (e.g., potential cost of failure).

If $U(r, c) > 0$, migration is rational.

---

## 6. Conclusion

The Decision Boundary Model provides a rigorous classification mechanism.
Instead of a vague "it depends," we can now state:

> "System X falls into the **Rewrite** quadrant because its Structural Risk ($R=85$) exceeds the Refactoring Threshold ($R=50$), but its Business Value justifies the High Cost ($C=\$2M < B=\$3M$)."

This concludes the theoretical framework of the Migration Decision Model.
Task 5 will apply this entire framework (Tasks 1-4) to representative Case Studies to validate the model's predictive power.
