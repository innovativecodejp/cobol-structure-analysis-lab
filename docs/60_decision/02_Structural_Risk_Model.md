# 02. Structural Risk Model

**Phase 3: Migration Decision Model**  
**Document ID:** `docs/60_decision/02_Structural_Risk_Model.md`  
**Date:** 2026-03-05

---

## 1. Introduction

The **Structural Risk Model** quantifies the likelihood that a legacy system migration will fail to reach the **Safety Region ($\mathcal{S}$)** defined in `01_Guarantee_Decision_Space.md`.

While the Guarantee Space provides the *topological* map of safe states, the Risk Model introduces the *probabilistic* and *metric* dimensions: **How hard** is it to traverse the path to safety, and **what is the probability** of failure?

---

## 2. Migration Debt Model

We define **Migration Debt ($D_{debt}$)** as the structural distance between the current system state $S_{current}$ and the nearest safe state in the Safety Region $\mathcal{S}$.

### 2.1 Distance to Safety

Given the weighted Hamming metric $d_w(S_1, S_2) = \sum_{p \in S_1 \triangle S_2} w(p)$ from Phase 2, the Migration Debt is the minimum cost to acquire all missing critical guarantees:

$$
D_{debt}(S) = \min_{T \in \mathcal{S}} d_w(S, T)
$$

Since $\mathcal{S}$ is defined by the critical guarantee set $G_{crit}$, and any safe state must contain $G_{crit}$, this simplifies to:

$$
D_{debt}(S) = \sum_{p \in G_{crit} \setminus S} w(p)
$$

This represents the **minimum theoretical effort** required to reach a safe state.

### 2.2 Debt Density

To normalize across systems of different sizes, we define **Debt Density ($\rho_{debt}$)**:

$$
\rho_{debt}(S) = \frac{D_{debt}(S)}{\sum_{p \in G_{crit}} w(p)}
$$

$\rho_{debt} \in [0, 1]$, where 0 implies the system is already safe, and 1 implies total absence of critical guarantees.

---

## 3. The Structural Risk Function

Migration Debt measures *what* needs to be done. Structural Risk measures the *difficulty* and *uncertainty* of doing it.
We propose that the risk of a migration step $S \to S'$ is a function of the code's structural complexity.

### 3.1 Probability of Transition Failure

Let $T: S \to S'$ be a migration transformation (e.g., refactoring a module).
We define $P_{fail}(T)$ as the probability that the resulting state $S'$ does not preserve the intended guarantees (i.e., $S' \notin \mathcal{G}_{dep}$ or $S'$ loses properties from $S$).

We hypothesize that $P_{fail}$ is correlated with standard complexity metrics:

$$
P_{fail}(T) \approx 1 - e^{- k \cdot C(T)}
$$

Where:
*   $C(T)$ is the **Structural Complexity** of the code being transformed.
*   $k$ is a process capability constant (lower for manual migration, higher for automated tools).

### 3.2 Complexity Factors ($C(T)$)

The complexity $C(T)$ is a composite metric derived from the AST, CFG, and DFG:

1.  **Control Flow Complexity ($C_{cfg}$)**:
    *   Cyclomatic Complexity ($CC$).
    *   Unstructuredness (Knot Count or number of GOTOs).
    *   *High $C_{cfg}$ increases the risk of logic errors.*

2.  **Data Flow Complexity ($C_{dfg}$)**:
    *   Halstead Volume ($V$).
    *   Data Coupling (number of shared variables).
    *   *High $C_{dfg}$ increases the risk of side-effects.*

3.  **Dependency Depth ($C_{dep}$)**:
    *   Depth in the dependency graph $D$.
    *   Fan-in / Fan-out of the module.
    *   *High $C_{dep}$ increases the risk of cascading failures.*

$$
C(T) = \alpha \cdot C_{cfg} + \beta \cdot C_{dfg} + \gamma \cdot C_{dep}
$$

### 3.3 The Risk Equation

The total **Structural Risk ($R_{struct}$)** of a system $S$ is the product of its Migration Debt and its Structural Complexity:

$$
R_{struct}(S) = D_{debt}(S) \times (1 + C(S))
$$

Alternatively, in a probabilistic formulation:

$$
R_{struct}(S) = D_{debt}(S) \times \frac{1}{1 - P_{fail}(S)}
$$

This formulation implies that:
*   If Debt is 0 (System is Safe), Risk is 0.
*   If Complexity is high, Risk is amplified (effectively increasing the "distance").
*   If Complexity is infinite (unmaintainable code), Risk approaches infinity.

---

## 4. Risk Classification

Based on $R_{struct}$, we classify systems into four zones:

| Risk Level | Range ($R_{struct}$) | Interpretation | Recommended Strategy |
| :--- | :--- | :--- | :--- |
| **Low** | $0 \le R < 10$ | Safe to Migrate | **Direct Migration** (Rehost/Automated Refactor) |
| **Medium** | $10 \le R < 50$ | Manageable Risk | **Refactor then Migrate** (Resolve complexity first) |
| **High** | $50 \le R < 100$ | Significant Danger | **Partial Rewrite** (Isolate high-risk modules) |
| **Critical** | $R \ge 100$ | Feasibility Unproven | **Full Redesign** (Migration is likely to fail) |

*(Note: Threshold values 10, 50, 100 are illustrative and must be calibrated in Task 5).*

---

## 5. Conclusion

The Structural Risk Model provides a calculated value $R_{struct}$ derived from:
1.  **Missing Guarantees** ($G_{crit} \setminus S$)
2.  **Code Complexity** ($CC$, Halstead, Coupling)

This model quantitatively explains why "spaghetti code" is risky to migrate: not just because it's hard to read, but because its high $C_{cfg}$ amplifies the probability of transition failure ($P_{fail}$), making the effective distance to the Safety Region insurmountable.

This output feeds directly into the **Migration Feasibility Model** (Task 3), which will determine if a path exists to reduce $R_{struct}$ to an acceptable level.
