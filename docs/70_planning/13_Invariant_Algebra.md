# 13. Invariant Algebra

**Phase 3.5: Migration Planning Theory (Strengthening)**  
**Document ID:** `docs/70_planning/13_Invariant_Algebra.md`  
**Date:** 2026-03-05

---

## 1. Introduction

This document defines the **algebraic structure** of invariants: a lattice, a dependency poset, join/meet operations, and a distance metric. These structures support migration planning (e.g., comparing states, measuring progress).

---

## 2. Invariant Lattice $(I, \leq)$

### 2.1 Partial Order

We define a partial order $\leq$ on the **invariant set** $I$ (not on states). For $p, q \in I$:

$$
p \leq q \iff q \text{ implies } p \text{ (or } p \text{ is a weakening of } q)
$$

**Interpretation**: $p \leq q$ means $q$ is **stronger** than $p$. If a system satisfies $q$, it satisfies $p$.

**Example**: $p_{scope}$ (variable is local) $\leq$ $p_{modular}$ (module has clear interface). Modularity implies scope.

### 2.2 Lattice Structure

$(I, \leq)$ forms a **lattice** when join $\vee$ and meet $\wedge$ are defined:

- **Join** $p \vee q$: The weakest invariant implied by both $p$ and $q$.
- **Meet** $p \wedge q$: The strongest invariant that implies both $p$ and $q$.

For migration, the **state lattice** $\mathcal{G} = \mathcal{P}(I)$ (with $\subseteq$) is more directly used; $(I, \leq)$ provides structure within each invariant.

---

## 3. Dependency Poset

### 3.1 Dependency Relation $D$

$$
D \subseteq I \times I
$$

$(p, q) \in D$ means $q$ **depends on** $p$: $q$ cannot hold unless $p$ holds.

### 3.2 Poset $(I, \leq_D)$

The reflexive-transitive closure of $D$ defines a partial order $\leq_D$:

$$
p \leq_D q \iff (p, q) \in D^* \quad \text{(transitive closure)}
$$

$(I, \leq_D)$ is a **poset** (partially ordered set). It may have cycles only if $D$ is ill-formed (we assume $D$ is acyclic).

### 3.3 Ideals and $\mathcal{G}_{dep}$

The **ideals** (downward-closed sets) of $(I, \leq_D)$ are exactly the dependency-closed subsets:

$$
\mathcal{G}_{dep} = Idl(I, \leq_D)
$$

---

## 4. Join and Meet Operations

### 4.1 On States (Guarantee Sets)

For states $S_1, S_2 \subseteq I$:

- **Join** (in $\mathcal{G}$): $S_1 \vee S_2 = S_1 \cup S_2$ (union). The strongest state implied by both (contains all invariants from both).
- **Meet** (in $\mathcal{G}$): $S_1 \wedge S_2 = S_1 \cap S_2$ (intersection). The weakest state that implies both.

### 4.2 In $\mathcal{G}_{dep}$

For $S_1, S_2 \in \mathcal{G}_{dep}$:
- $S_1 \vee S_2 = Cl_D(S_1 \cup S_2)$ (dependency closure of union).
- $S_1 \wedge S_2 = S_1 \cap S_2$ (intersection of ideals is an ideal).

$\mathcal{G}_{dep}$ is a **distributive lattice** with these operations.

### 4.3 Interpretation for Planning

- **Join**: Combining two migration paths (e.g., parallel work on different modules) yields the union of acquired invariants (with closure).
- **Meet**: The common invariants of two states represent the "shared progress" of two alternative paths.

---

## 5. Invariant Distance Metric

### 5.1 Symmetric Difference Metric

For states $S_1, S_2 \subseteq I$:

$$
d(S_1, S_2) = |S_1 \triangle S_2| = |(S_1 \setminus S_2) \cup (S_2 \setminus S_1)|
$$

This is the **Hamming distance** (number of invariants that differ).

### 5.2 Weighted Distance

$$
d_w(S_1, S_2) = \sum_{p \in S_1 \triangle S_2} w(p)
$$

This is the **weighted Hamming metric** from Phase 2. It accounts for invariant importance.

### 5.3 Directed Distance (Migration Debt)

For planning, we often care about **distance to safety**:

$$
d_{safety}(S) = d_w(G_{crit} \setminus S, \emptyset) = \sum_{p \in G_{crit} \setminus S} w(p)
$$

This is the Migration Debt (Phase 3 Task 2).

### 5.4 Metric Axioms

$d_w$ satisfies:
1. $d_w(S_1, S_2) \ge 0$
2. $d_w(S_1, S_2) = 0 \iff S_1 = S_2$
3. $d_w(S_1, S_2) = d_w(S_2, S_1)$
4. $d_w(S_1, S_3) \le d_w(S_1, S_2) + d_w(S_2, S_3)$ (triangle inequality)

---

## 6. Implications for Migration Planning

1. **State comparison**: $d_w(S_1, S_2)$ measures how "far" two migration states are. Useful for clustering, equivalence (Task 11), and progress tracking.

2. **A* heuristic**: $h(S) = d_{safety}(S)$ is admissible for shortest-path search (Task 4).

3. **Lattice structure**: Join/meet support combining parallel migration efforts and comparing alternative paths.

4. **Dependency poset**: $(I, \leq_D)$ determines valid state sequences (linear extensions) and enables topological algorithms.

---

## 7. Conclusion

The Invariant Algebra:
1. Defines $(I, \leq)$ and $(I, \leq_D)$ as lattice and poset.
2. Defines join and meet on states ($\mathcal{G}_{dep}$).
3. Defines distance metrics ($d$, $d_w$, $d_{safety}$).
4. Connects to migration planning (heuristics, state comparison, path synthesis).
