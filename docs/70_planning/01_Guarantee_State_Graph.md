# 01. Guarantee State Graph

**Phase 3.5: Migration Planning Theory**  
**Document ID:** `docs/70_planning/01_Guarantee_State_Graph.md`  
**Date:** 2026-03-05

---

## 1. Introduction

Phase 3.5-0 defined **Semantic Guarantees** as invariants $I$ and the Valid Guarantee Space $\mathcal{G}_{dep}$. This document constructs the **Guarantee State Graph** $G_{state}$, which represents migration as a **state-transition system**. Migration planning becomes a **graph traversal problem**.

---

## 2. Formal Graph Definition

### 2.1 Definition

$$
G_{state} = (V, E)
$$

Where:
- **$V$**: Set of guarantee states (nodes).
- **$E$**: Set of valid migration transformations (edges).

### 2.2 Relation to Phase 2

$G_{state}$ is the **Guarantee Transition Graph** $G_{trans}$ from Phase 2, instantiated with semantic invariants $I$ instead of properties $\mathbb{P}$. The structure is identical; the interpretation is refined for planning.

---

## 3. Node Representation

### 3.1 Node as Guarantee Set

Each node $S \in V$ represents a **guarantee configuration**:

$$
S \subseteq I
$$

Where $I$ is the set of semantic invariants (Phase 3.5-0).

### 3.2 Dependency Closure Rule

Every node must be **dependency-closed** (an ideal of $(I, D)$):

$$
S \in V \iff S \in \mathcal{G}_{dep}
$$

$$
\mathcal{G}_{dep} = \{ S \subseteq I \mid \forall q \in S, \forall p \in I: (p,q) \in D \implies p \in S \}
$$

### 3.3 Example States

| State | Invariants | Interpretation |
| :--- | :--- | :--- |
| $S_0$ | $\{p_{scope}\}$ | Data is local to module. |
| $S_1$ | $\{p_{scope}, p_{no\_goto}\}$ | + Structured control flow. |
| $S_2$ | $\{p_{scope}, p_{no\_goto}, p_{call}\}$ | + Valid CALL interface. |
| $S_{target}$ | $G_{crit} \subseteq S_{target}$ | Safe state (in $\mathcal{S}$). |

---

## 4. Edge / Transformation Definition

### 4.1 Cover Relation

An edge exists from $S$ to $S'$ if and only if $S'$ is obtained by adding a **single** invariant $p$ such that the result remains dependency-closed:

$$
(S, S') \in E \iff S \lessdot S'
$$

$$
S \lessdot S' \iff S' = S \cup \{p\} \land p \notin S \land S' \in \mathcal{G}_{dep}
$$

### 4.2 Atomic Transformation

Each edge corresponds to an **atomic migration step**: one invariant is acquired (e.g., by refactoring, restructuring, or encapsulation).

### 4.3 Transformation Examples

| Transformation | Structural Change | Invariant Added |
| :--- | :--- | :--- |
| Control flow restructuring | Resolve GOTOs | $p_{no\_goto}$, $p_{reducible}$ |
| Module decomposition | Split procedure | $p_{scope}$, $p_{modular}$ |
| Data encapsulation | Introduce LINKAGE | $p_{immutable}$, $p_{call}$ |
| Interface extraction | Define COPYBOOK contract | $p_{copybook}$, $p_{io}$ |

### 4.4 Edge Constraints

1. **Dependency validity**: $S' = S \cup \{p\}$ must be in $\mathcal{G}_{dep}$.
2. **No invariant violation**: The transformation must not remove any $q \in S$ (edges only add invariants).

---

## 5. Graph Properties

### 5.1 DAG (Directed Acyclic Graph)

$G_{state}$ is a **DAG**.

*Proof*: For every edge $(S, S')$, $S \subset S'$ (strict inclusion). Thus $|S'| > |S|$. No cycle can return to a smaller set. $\square$

### 5.2 Reachability of Safety Region

The Safety Region $\mathcal{S} = \{ S \in \mathcal{G}_{dep} \mid G_{crit} \subseteq S \}$ is a **filter** (upward-closed). If $S \in \mathcal{S}$ and $S \subseteq T$, then $T \in \mathcal{S}$.

**Reachability condition**: $S_{target} \in \mathcal{S}$ is reachable from $S_{start}$ iff there exists a path $S_{start} \to \dots \to S_{target}$ in $G_{state}$.

### 5.3 No Cycles

By the DAG property, there are **no cycles** in the transformation space. Migration is inherently monotonic (invariants are only added).

### 5.4 Dead-End States

A state $S$ is a **dead end** if:
- $S \notin \mathcal{S}$ (unsafe), and
- No outgoing edge exists: $\nexists p$ such that $S \cup \{p\} \in \mathcal{G}_{dep}$.

This occurs when the dependency structure prevents further progress (e.g., a blocking structure from Phase 3 Task 3).

### 5.5 Minimal Transformation Paths

A path from $S_{start}$ to $S_{target} \in \mathcal{S}$ is **minimal** (in number of steps) if it has length $|S_{target} \setminus S_{start}|$. Each step adds exactly one invariant. Minimal paths exist when the dependency order allows a linear extension.

---

## 6. Migration Trajectory Interpretation

### 6.1 Trajectory Definition

A **migration trajectory** is a path in $G_{state}$:

$$
S_{start} \to S_1 \to S_2 \to \dots \to S_{target}
$$

Where $S_{target} \in \mathcal{S}$.

### 6.2 Planning Objective

**Migration planning** seeks trajectories that:
1. Reach $\mathcal{S}$ (feasibility).
2. Minimize total cost (optimality, P3.5-4).

### 6.3 Trajectory as Linear Extension

Each trajectory corresponds to a **linear extension** of the poset $(I \setminus S_{start}, \leq_D)$: an ordering of the invariants to be acquired that respects dependencies.

---

## 7. Connection to Program Structure

### 7.1 Initial State from Code

The mapping $\Phi$ from Phase 3.5-0 extracts the initial state:

$$
S_{start} = \Phi(AST, CFG, DFG)
$$

Each codebase maps to a unique node $S_{start} \in V$.

### 7.2 Code ↔ State Correspondence

| Code Change | Graph Interpretation |
| :--- | :--- |
| Refactor paragraph | $S \to S'$ where $S' = S \cup \{p_{no\_goto}\}$ |
| Extract module | $S \to S'$ where $S' = S \cup \{p_{scope}\}$ |
| Add interface | $S \to S'$ where $S' = S \cup \{p_{call}\}$ |

### 7.3 Structural Feasibility

If $S_{start}$ is in a dead-end state, no code transformation can reach $\mathcal{S}$ without first breaking the blocking structure (e.g., full rewrite). This aligns with Phase 3's **Structurally Infeasible** classification.

---

## 8. Conclusion

The Guarantee State Graph $G_{state}$:
1. Represents migration as a graph of dependency-closed invariant sets.
2. Uses cover relations as edges (atomic invariant acquisition).
3. Is a DAG with reachability, dead-ends, and minimal paths.
4. Connects code structure to nodes via $\Phi$.

This model is the foundation for:
- **P3.5-2**: Transformation Model (formalizing the edge semantics).
- **P3.5-3**: Migration Cost Model (weighting edges).
- **P3.5-4**: Optimal Migration Path (shortest path in $G_{state}$).
