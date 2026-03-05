# 11. Reachable State Space

**Phase 3.5: Migration Planning Theory (Strengthening)**  
**Document ID:** `docs/70_planning/11_Reachable_State_Space.md`  
**Date:** 2026-03-05

---

## 1. Introduction

The Guarantee State Graph $G_{state}$ can have up to $2^{|I|}$ nodes, leading to **state explosion** for large invariant sets. This document defines the **Reachable State Space** $V_{reachable}$ and **pruning rules** to keep the graph tractable for migration planning.

---

## 2. Reachable States

### 2.1 Definition

$$
V_{reachable} \subseteq \mathcal{G}_{dep}
$$

$V_{reachable}$ is the set of guarantee states that are **reachable** from the initial state $S_{start}$ via valid transformations.

### 2.2 Transition Closure

$$
V_{reachable} = closure(S_{start}, Transformations)
$$

Where $closure$ is the reflexive-transitive closure of the transition relation:

$$
closure(S, T) = \{ S' \mid \exists n \ge 0, \exists path: S \to S_1 \to \dots \to S_n = S' \}
$$

$V_{reachable}$ is the smallest set containing $S_{start}$ and closed under applying transformations from the Transformation Model (P3.5-2).

---

## 3. Pruning Rules

### 3.1 Dependency Pruning

**Rule**: If $S \cup \{p\} \notin \mathcal{G}_{dep}$ (i.e., adding $p$ violates dependency closure), do not explore $S \cup \{p\}$.

**Effect**: Only dependency-closed states are considered. This is already enforced by $G_{state}$; dependency pruning is implicit in the edge definition.

### 3.2 Dominance Pruning

**Rule**: If $S_1 \subseteq S_2$ and $Cost(path_{S_1}) \ge Cost(path_{S_2})$, then $S_1$ is **dominated** by $S_2$. Prune $S_1$ from further expansion when searching for optimal paths.

**Rationale**: Reaching $S_2$ is strictly better than $S_1$ (more invariants, lower or equal cost). No optimal path goes through $S_1$ if $S_2$ is reachable.

**Caveat**: Dominance requires consistent cost structure (monotonicity). If costs can decrease with more invariants (e.g., economies of scale), dominance may not hold.

### 3.3 Equivalent State Merging

**Rule**: If $S_1$ and $S_2$ are **equivalent** for planning purposes (e.g., same $G_{crit} \cap S$, same distance to $\mathcal{S}$), merge them into a single representative state.

**Definition of equivalence**:
$$
S_1 \equiv S_2 \iff (G_{crit} \setminus S_1) = (G_{crit} \setminus S_2) \land \text{same structural complexity}
$$

**Effect**: Reduces state count when multiple paths lead to "equivalent" configurations.

### 3.4 Budget Pruning

**Rule**: If $Cost(path to S) > Budget$, prune $S$ and all descendants.

**Effect**: Enforces resource feasibility early; avoids exploring infeasible regions.

---

## 4. Complexity Bounds

### 4.1 Worst Case

Without pruning: $|V_{reachable}| \le |\mathcal{G}_{dep}| \le 2^{|I|}$.

### 4.2 With Pruning

- **Dependency pruning**: Reduces to $|\mathcal{G}_{dep}|$, which can be much smaller than $2^{|I|}$ for structured dependency graphs.
- **Dominance pruning**: Can reduce explored states by 50% or more in practice.
- **Equivalent state merging**: Reduces by a factor depending on equivalence granularity.
- **Budget pruning**: Eliminates states beyond cost threshold.

### 4.3 Practical Bound

For typical COBOL migration with $|I| \approx 20$–50 and strong dependencies:
$$
|V_{reachable}| \approx O(|I|^d)
$$
Where $d$ is the dependency depth. Often $d \ll |I|$.

---

## 5. Relationship to Migration Feasibility

### 5.1 Feasibility as Reachability

Migration is **feasible** iff:
$$
V_{reachable} \cap \mathcal{S} \neq \emptyset
$$

i.e., at least one safe state is reachable from $S_{start}$.

### 5.2 Pruning and Feasibility

- Pruning must **preserve feasibility**: If $S \in \mathcal{S}$ is reachable, it must not be pruned.
- **Dominance pruning** is safe: dominated states are suboptimal, not feasibility-relevant.
- **Equivalent state merging** is safe if equivalence preserves "can reach $\mathcal{S}$."
- **Budget pruning** may hide feasible but expensive paths; use only when budget is a hard constraint.

### 5.3 Dead-End Detection

A state $S$ is a **dead end** if $S \notin \mathcal{S}$ and no outgoing edges exist. Dead ends can be pruned from future expansion (they will never reach $\mathcal{S}$).

---

## 6. Conclusion

The Reachable State Space:
1. Defines $V_{reachable}$ as the closure of $S_{start}$ under transformations.
2. Introduces pruning rules (dependency, dominance, equivalence, budget) to control state explosion.
3. Provides complexity bounds for practical planning.
4. Connects to migration feasibility (Phase 3 Task 3).
