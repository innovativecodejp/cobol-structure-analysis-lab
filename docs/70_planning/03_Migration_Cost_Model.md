# 03. Migration Cost Model

**Phase 3.5: Migration Planning Theory**  
**Document ID:** `docs/70_planning/03_Migration_Cost_Model.md`  
**Date:** 2026-03-05

---

## 1. Introduction

The Guarantee State Graph (P3.5-1) and Transformation Model (P3.5-2) define *what* transitions are possible. This document defines the **Migration Cost Model**, which quantifies the cost of each transition $S \to S'$. Migration planning becomes a **weighted shortest-path problem**.

---

## 2. Cost Function Definition

### 2.1 Per-Transition Cost

$$
Cost(S \to S') = E_{base}(S \to S') \times R_{factor}(S \to S')
$$

Where:
- **$E_{base}$**: Base engineering effort (person-days, story points, or abstract units).
- **$R_{factor}$**: Risk amplification factor ($\ge 1$), reflecting structural complexity.

### 2.2 Base Effort

For an atomic transition $S' = S \cup \{p\}$:

$$
E_{base}(S \to S') = w(p)
$$

The guarantee weight $w(p)$ from Phase 3.5-0 represents the intrinsic effort to acquire invariant $p$ (verification difficulty, business criticality).

### 2.3 Risk Factor

$$
R_{factor}(S \to S') = 1 + C(T)
$$

Where $C(T)$ is the **Structural Complexity** of the code being transformed (Phase 3, Structural Risk Model):

$$
C(T) = \alpha \cdot C_{cfg} + \beta \cdot C_{dfg} + \gamma \cdot C_{dep}
$$

---

## 3. Risk Amplification Model

### 3.1 Complexity Factors

| Factor | Source | Interpretation |
| :--- | :--- | :--- |
| $C_{cfg}$ | CFG | Cyclomatic complexity, GOTO count, reducibility. |
| $C_{dfg}$ | DFG | Halstead volume, data coupling, shared variables. |
| $C_{dep}$ | Dependency graph | Depth, fan-in/fan-out. |
| Module size | LOC, nodes | Larger modules → higher effort. |

### 3.2 State-Dependent Cost

Cost may depend on the *current* state $S$ (e.g., refactoring in a clean codebase is easier):

$$
Cost(S \to S') = w(p) \times (1 + C(T \mid S))
$$

Where $C(T \mid S)$ is complexity conditioned on $S$.

### 3.3 Probability of Failure

From Phase 3:

$$
P_{fail}(T) \approx 1 - e^{-k \cdot C(T)}
$$

Expected cost can incorporate rework:

$$
Cost_{expected}(S \to S') = \frac{Cost(S \to S')}{1 - P_{fail}(T)}
$$

---

## 4. Cost Aggregation

### 4.1 Path Cost

For a migration path $path = (S_0, S_1, \dots, S_n)$:

$$
Cost(path) = \sum_{i=0}^{n-1} Cost(S_i \to S_{i+1})
$$

### 4.2 Minimum Migration Cost

$$
C_{min}(S_{start}) = \min \{ Cost(path) \mid path \text{ from } S_{start} \text{ to } \mathcal{S} \}
$$

This is the objective of the Optimal Migration Path (P3.5-4).

---

## 5. Example Cost Calculations

### 5.1 Scenario: Add $p_{no\_goto}$ to Spaghetti Code

- $w(p_{no\_goto}) = 5$ (moderate verification difficulty).
- $C_{cfg} = 15$ (high GOTO count), $C_{dfg} = 2$, $C_{dep} = 1$.
- $C(T) = 0.5 \times 15 + 0.3 \times 2 + 0.2 \times 1 = 8.3$.
- $R_{factor} = 1 + 8.3 = 9.3$.
- $Cost = 5 \times 9.3 = 46.5$ units.

### 5.2 Scenario: Add $p_{scope}$ to Modular Code

- $w(p_{scope}) = 2$.
- $C(T) = 0.5$ (low complexity).
- $R_{factor} = 1.5$.
- $Cost = 2 \times 1.5 = 3$ units.

### 5.3 Interpretation

The same invariant ($p_{no\_goto}$) costs far more in spaghetti code than in structured code. This justifies **Refactor First** strategies: reduce $C(T)$ before acquiring critical invariants.

---

## 6. Implications for Planning

1. **Path selection**: Optimal paths favor low-complexity regions of the graph.
2. **Ordering**: Acquiring invariants in "easy" code first reduces total cost.
3. **Budget**: $Cost(path) \le Budget$ is the resource feasibility condition (Phase 3 Task 3).
4. **Sensitivity**: High $C(T)$ makes cost estimates volatile; add contingency.

---

## 7. Conclusion

The Migration Cost Model:
1. Defines $Cost(S \to S') = E_{base} \times R_{factor}$.
2. Derives $R_{factor}$ from structural complexity ($C_{cfg}$, $C_{dfg}$, $C_{dep}$).
3. Aggregates path cost for planning.
4. Supports the Optimal Migration Path algorithm (P3.5-4).
