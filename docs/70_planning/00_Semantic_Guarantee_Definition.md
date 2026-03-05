# 00. Semantic Guarantee Definition

**Phase 3.5: Migration Planning Theory**  
**Document ID:** `docs/70_planning/00_Semantic_Guarantee_Definition.md`  
**Date:** 2026-03-05

---

## 1. Introduction

Phase 3 established the **Migration Decision Model** using a Guarantee Space $\mathcal{G}$ built from preservation properties $\mathbb{P}$. Phase 3.5 extends this into **Migration Planning Theory**, which requires a more precise foundation: guarantees must be defined as **semantic invariants** rather than abstract properties.

This document formalizes the **Semantic Guarantee Model**, connecting program structure to migration trajectories.

---

## 2. Semantic Invariant Definition

### 2.1 Formal Definition

A **Guarantee** $p$ is a **semantic invariant preserved during system migration**.

$$
p \in I \iff p \text{ is a predicate on program behavior that must hold before and after migration}
$$

Let $I$ be the finite set of all semantic invariants relevant to migration analysis.

$$
I = \{ p \mid p \text{ is a semantic invariant} \}
$$

### 2.2 Invariant vs. Property

The Phase 3 Guarantee Space used $\mathbb{P}$ (preservation properties). The relation is:

$$
\mathbb{P} \subseteq I \quad \text{or} \quad I \text{ refines } \mathbb{P}
$$

Each invariant $p \in I$ corresponds to a **verifiable behavioral constraint** (e.g., "Variable X is never modified in this scope"), whereas $\mathbb{P}$ may include coarser categories (e.g., $P_{flow}$, $P_{data}$).

### 2.3 Guarantee Space (Revisited)

$$
\mathcal{G} = \mathcal{P}(I)
$$

The Guarantee Space is the power set of invariants. A state $S \subseteq I$ represents the set of invariants currently satisfied by the system.

---

## 3. Guarantee Taxonomy

We classify invariants into four categories, each with distinct structural indicators and migration relevance.

### 3.1 Control Flow Invariants ($I_{flow}$)

| Aspect | Description |
| :--- | :--- |
| **Formal** | Predicates on execution paths: "Path P is reachable," "Loop L terminates," "Branch B is deterministic." |
| **Structural** | CFG reducibility, absence of irreducible loops, bounded nesting depth. |
| **Extraction** | CFG analysis: detect GOTOs, ALTER, PERFORM THRU; compute cyclomatic complexity. |
| **Migration** | High relevance. Unstructured control flow blocks automated translation. |

**Examples:**
- $p_{seq}$: "Statements execute in sequential order."
- $p_{loop}$: "Loop has single entry and exit."
- $p_{no\_goto}$: "No GOTO crosses procedure boundary."

### 3.2 Data Integrity Invariants ($I_{data}$)

| Aspect | Description |
| :--- | :--- |
| **Formal** | Predicates on data: "Variable V is read-only in scope S," "No aliasing between X and Y." |
| **Structural** | DFG: def-use chains, shared variables, COPYBOOK usage. |
| **Extraction** | DFG analysis: identify global state, coupling, data dependencies. |
| **Migration** | Critical for data isolation. Shared state blocks modularization. |

**Examples:**
- $p_{scope}$: "Variable is local to module."
- $p_{immutable}$: "Input parameters are not modified."
- $p_{no\_alias}$: "No overlapping storage (REDEFINES) in critical path."

### 3.3 State Transition Invariants ($I_{state}$)

| Aspect | Description |
| :--- | :--- |
| **Formal** | Predicates on state machine: "State S is reachable only after event E," "No invalid state transitions." |
| **Structural** | State variables, file status, transaction boundaries. |
| **Extraction** | Trace state variables through CFG; identify COMMIT/ROLLBACK points. |
| **Migration** | Relevant for transactional systems. |

**Examples:**
- $p_{tx}$: "Transaction is atomic."
- $p_{file}$: "File is opened before read."
- $p_{order}$: "State transitions follow valid sequence."

### 3.4 Interface / I/O Invariants ($I_{io}$)

| Aspect | Description |
| :--- | :--- |
| **Formal** | Predicates on interfaces: "Input format F is respected," "Output O is produced for input I." |
| **Structural** | CALL interface, COPYBOOK layout, file record structure. |
| **Extraction** | Parse PROCEDURE DIVISION USING; analyze LINKAGE SECTION; trace I/O operations. |
| **Migration** | Defines contract boundaries. Essential for incremental migration. |

**Examples:**
- $p_{call}$: "CALL parameters match callee signature."
- $p_{copybook}$: "COPYBOOK layout is stable."
- $p_{io}$: "I/O operations are deterministic for given input."

---

## 4. Structural Extraction Model

### 4.1 Mapping Function $\Phi$

We define the extraction function:

$$
\Phi: (AST, CFG, DFG) \to \mathcal{P}(I)
$$

$$
S = \Phi(CodeStructure)
$$

Where $S \subseteq I$ is the set of invariants satisfied by the current code.

### 4.2 Extraction Rules (Pattern-Based)

| Invariant Type | Structural Pattern | Detection Method |
| :--- | :--- | :--- |
| $p_{no\_goto}$ | No GOTO/ALTER in CFG | CFG: count GOTO edges |
| $p_{reducible}$ | CFG is reducible | CFG: apply reducibility test |
| $p_{scope}$ | Variable only in LOCAL-STORAGE | DFG: scope analysis |
| $p_{immutable}$ | Parameter in LINKAGE, no MOVE to it | DFG: def-use on parameters |
| $p_{call}$ | CALL matches COPYBOOK | AST: compare CALL args to PROCEDURE USING |
| $p_{tx}$ | COMMIT/ROLLBACK bracket operations | CFG: trace control flow |

### 4.3 Partial Extraction

Extraction may be **partial**: some invariants are undecidable from static analysis. We denote:

$$
S = \Phi(C) \cup S_{unknown}
$$

Where $S_{unknown}$ represents invariants that require runtime verification or manual annotation.

---

## 5. Guarantee Dependency Model

### 5.1 Dependency Relation $D$

$$
D \subseteq I \times I
$$

$(p, q) \in D$ means: **$q$ depends on $p$** (i.e., $q$ cannot hold unless $p$ holds).

### 5.2 Dependency-Closed Sets

A set $S \subseteq I$ is **dependency-closed** (an ideal) if:

$$
\forall q \in S, \forall p \in I: (p, q) \in D \implies p \in S
$$

### 5.3 Valid Guarantee Space $\mathcal{G}_{dep}$

$$
\mathcal{G}_{dep} = \{ S \subseteq I \mid S \text{ is dependency-closed} \}
$$

$\mathcal{G}_{dep}$ is a **Distributive Sublattice** of $\mathcal{G} = \mathcal{P}(I)$. This aligns with Phase 3's definition.

### 5.4 Example Dependencies

- $p_{no\_goto}$ depends on $p_{reducible}$ (reducibility implies structured flow).
- $p_{tx}$ depends on $p_{file}$ (transaction implies file handling).
- $p_{call}$ depends on $p_{copybook}$ (interface depends on data layout).

---

## 6. Guarantee Weighting Model

### 6.1 Weight Function

$$
w: I \to \mathbb{R}^+
$$

Weights represent:
- **Business criticality**: Higher for core business logic.
- **Verification difficulty**: Higher for invariants hard to test.
- **Migration impact**: Higher for invariants that block transformations.

### 6.2 Composite Weight

For a state $S \subseteq I$:

$$
\mu(S) = \sum_{p \in S} w(p)
$$

This is the **Guarantee Measure** from Phase 2.

### 6.3 Influence on Planning

| Concept | Role of $w$ |
| :--- | :--- |
| **Migration Debt** | $D_{debt}(S) = \sum_{p \in G_{crit} \setminus S} w(p)$ |
| **Risk Amplification** | High $w(p)$ for missing $p$ increases $R_{struct}$ |
| **Migration Cost** | $Cost(S \to S')$ scales with $w$ of newly acquired invariants |

---

## 7. Implications for Migration Planning

1. **Trajectory Definition**: A migration path $S_0 \to S_1 \to \dots \to S_n$ is a sequence of dependency-closed invariant sets. Each step adds invariants (or preserves them).

2. **Safety Region**: $S_{target} \in \mathcal{S}$ iff $G_{crit} \subseteq S_{target}$, where $G_{crit} \subseteq I$ is the critical invariant set.

3. **Extraction as Initialization**: $\Phi(AST, CFG, DFG)$ provides $S_0$, the starting state for planning.

4. **Foundation for P3.5-1**: The Guarantee State Graph $G_{state} = (V, E)$ will use $V = \mathcal{G}_{dep}$ and $E$ as valid transformations between states.

This document establishes the semantic foundation for Phase 3.5 Migration Planning Theory.
