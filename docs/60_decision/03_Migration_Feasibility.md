# 03. Migration Feasibility Model

**Phase 3: Migration Decision Model**  
**Document ID:** `docs/60_decision/03_Migration_Feasibility.md`  
**Date:** 2026-03-05

---

## 1. Introduction

The **Migration Feasibility Model** determines whether a valid migration path exists from the current system state $S_{start}$ to the Safety Region $\mathcal{S}$ within given resource constraints.

While the **Risk Model** (Task 2) quantifies the *difficulty* and *probability of failure*, the **Feasibility Model** addresses the binary question of *possibility*: **Can we get there from here?**

This involves two distinct checks:
1.  **Theoretical Reachability**: Does the dependency structure allow a sequence of valid transformations to reach a safe state?
2.  **Resource Feasibility**: Can this sequence be executed within the project's budget (time, cost, effort)?

---

## 2. Reachability Theory

We analyze reachability within the **Guarantee Transition Graph** $G_{trans} = (\mathcal{G}_{dep}, E)$ defined in Phase 2.

### 2.1 The Reachable Set ($\mathcal{R}$)

The set of all states reachable from the initial state $S_{start}$ is defined as the transitive closure of the transition relation:

$$
\mathcal{R}(S_{start}) = \{ S \in \mathcal{G}_{dep} \mid \exists \text{ path } S_{start} \to \dots \to S \}
$$

### 2.2 Theoretical Feasibility Condition

Migration is **Theoretically Feasible** if and only if the reachable set intersects with the Safety Region:

$$
Feasible_{theory}(S_{start}) \iff \mathcal{R}(S_{start}) \cap \mathcal{S} \neq \emptyset
$$

If this intersection is empty, the system is in a **Dead End** or **Trap State** relative to the required safety criteria. This occurs when the dependency structure inherently prevents the simultaneous satisfaction of all critical guarantees ($G_{crit}$).

---

## 3. Resource Feasibility

Even if a path exists, it may be too costly. We introduce a cost function to the edges of $G_{trans}$.

### 3.1 Migration Cost Function ($Cost$)

Let $path = (S_0, S_1, \dots, S_n)$ be a migration trajectory where $S_0 = S_{start}$ and $S_n \in \mathcal{S}$.
The cost of this path is the sum of the costs of individual transitions (atomic migration steps):

$$
Cost(path) = \sum_{i=0}^{n-1} cost(S_i \to S_{i+1})
$$

Where $cost(S \to S')$ is derived from the **Structural Risk** of the component being transformed:
$$
cost(S \to S') \approx Effort_{base} \times (1 + R_{struct}(S \to S'))
$$
High-risk transformations require exponentially more effort (testing, manual verification).

### 3.2 Minimum Migration Cost ($C_{min}$)

The minimum cost to reach safety is the shortest path distance in the weighted graph:

$$
C_{min}(S_{start}) = \min \{ Cost(path) \mid path \text{ starts at } S_{start}, \text{ ends in } \mathcal{S} \}
$$

### 3.3 Resource Feasibility Condition

Let $B$ be the project budget (resource constraint).
Migration is **Resource Feasible** if and only if:

$$
Feasible_{resource}(S_{start}) \iff C_{min}(S_{start}) \le B
$$

---

## 4. Blocking Structures

Certain structural patterns act as barriers that make $Cost(S \to S') \to \infty$ or make $\mathcal{R}(S_{start}) \cap \mathcal{S} = \emptyset$. We call these **Blocking Structures**.

### 4.1 Irreducible Control Flow (The "GOTO Knot")

*   **Definition**: A subgraph of the CFG that cannot be reduced to structured constructs (sequence, selection, iteration) without code duplication or boolean flag variables.
*   **Impact**: Prevents the decomposition of a monolithic module into smaller, testable units.
*   **Feasibility Consequence**: To resolve this, one must rewrite the logic, which effectively resets the local guarantee state to $\emptyset$ (high risk). If the rewrite cost exceeds $B$, it is a blocking structure.

### 4.2 Data Coupling Cycles (The "God Data")

*   **Definition**: A set of modules $\{M_1, \dots, M_k\}$ that are mutually dependent on a shared global state $D_{global}$ (e.g., a massive COPYBOOK), forming a cycle in the dependency graph.
*   **Impact**: $M_i$ cannot be migrated independently. The entire cluster must be migrated atomically.
*   **Feasibility Consequence**: The "atomic step" size becomes the size of the entire cluster.
    If $Size(Cluster) > Capacity(Team)$, then $Cost \to \infty$.

### 4.3 Missing Source / Legacy Binary

*   **Definition**: Parts of the system where source code is lost or written in an unsupported language (Assembler macros), but behavior must be preserved.
*   **Impact**: $G_{crit}$ cannot be verified.
*   **Feasibility Consequence**: $\mathcal{R}(S_{start}) \cap \mathcal{S} = \emptyset$ unless reverse engineering is performed (which adds massive cost).

---

## 5. The Feasibility Decision Logic

We combine the theoretical and resource conditions into a single decision logic.

### 5.1 The Feasibility Predicate

$$
IsMigratable(S_{start}, B) = \begin{cases} 
\text{True} & \text{if } C_{min}(S_{start}) \le B \\
\text{False} & \text{otherwise}
\end{cases}
$$

### 5.2 Feasibility Classification

Based on this, we classify the system:

1.  **Feasible**:
    *   Path exists, Cost $\le B$.
    *   **Action**: Proceed to planning.

2.  **Resource Infeasible**:
    *   Path exists, but Cost $> B$.
    *   **Action**: Descope (reduce $G_{crit}$), Increase Budget, or Accept Technical Debt.

3.  **Structurally Infeasible (Blocked)**:
    *   No path exists to $\mathcal{S}$ (due to Blocking Structures).
    *   **Action**: Re-architecture (Rewrite) required before migration. The "Migration" paradigm is invalid here.

---

## 6. Conclusion

The Migration Feasibility Model provides the "Go/No-Go" test.
It highlights that **feasibility is not just about code quality, but about the relationship between Structural Risk and Resource Constraints.**

*   A high-risk system *can* be migrated if the budget is infinite.
*   A low-risk system *cannot* be migrated if blocking structures prevent the preservation of critical guarantees.

This output feeds into the **Decision Boundary Model** (Task 4), which will define the specific thresholds for these decisions in a business context.
