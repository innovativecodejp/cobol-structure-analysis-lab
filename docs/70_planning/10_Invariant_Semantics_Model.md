# 10. Invariant Semantics Model

**Phase 3.5: Migration Planning Theory (Strengthening)**  
**Document ID:** `docs/70_planning/10_Invariant_Semantics_Model.md`  
**Date:** 2026-03-05

---

## 1. Introduction

This document defines the formal relationship between **program semantics** and **semantic invariants**. It grounds the invariant concept (Phase 3.5-0) in observable behavior, and explains how structural representations (AST, CFG, DFG) approximate semantics.

---

## 2. Program Semantics Representation

### 2.1 Definition

Let $C$ be a program (code artifact). We define **Program Semantics** as a formal representation of its observable behavior:

$$
Semantics(C) = \langle \mathcal{B}, \mathcal{T}, \mathcal{O} \rangle
$$

Where:
- **$\mathcal{B}$**: Set of possible behaviors (execution traces, state sequences).
- **$\mathcal{T}$**: Set of traces (finite or infinite sequences of states/events).
- **$\mathcal{O}$**: Observable interface (inputs, outputs, side effects).

### 2.2 Behavioral Semantics

A behavior $b \in \mathcal{B}$ is a predicate or trace that describes what the program can do. For migration, we care about:
- **Control flow semantics**: Which paths are executable.
- **Data flow semantics**: How values propagate.
- **State transition semantics**: How internal state evolves.
- **I/O semantics**: What inputs produce what outputs.

---

## 3. Invariant Extraction

### 3.1 Extraction Function

$$
I = invariants(Semantics(C))
$$

The invariant set $I$ is derived from the semantics of $C$. Each invariant $p \in I$ is a predicate on $\mathcal{B}$:

$$
p: \mathcal{B} \to \{true, false\}
$$

### 3.2 Invariant as Predicate

An invariant $p$ holds for program $C$ iff:

$$
\forall b \in \mathcal{B}(C): p(b) = true
$$

i.e., every possible behavior of $C$ satisfies $p$.

---

## 4. Invariant Predicate Structure

### 4.1 Predicate Structure

$$
p: Behavior \to \{true, false\}
$$

Each invariant $p$ is a **predicate** on program behavior. Examples:

| Invariant | Predicate | Interpretation |
| :--- | :--- | :--- |
| $p_{seq}$ | $\forall$ traces $t$: statements in $t$ are ordered | Control flow is sequential. |
| $p_{no\_goto}$ | $\forall$ traces $t$: no GOTO crosses procedure boundary | Structured control flow. |
| $p_{scope}$ | $\forall$ traces $t$: variable $V$ is only accessed in scope $S$ | Data locality. |
| $p_{immutable}$ | $\forall$ traces $t$: input param $P$ is never written | No input mutation. |

### 4.2 Observable Behavior

Invariants must be **observable** (or statically inferable). We cannot define invariants on unobservable internal state unless we have instrumentation.

---

## 5. Connection to Observable Behavior

### 5.1 Control Flow Semantics

- **Semantics**: The set of execution paths (paths in the CFG).

- **Invariants**: $p_{reducible}$ (CFG is reducible), $p_{loop}$ (loops have single entry/exit), $p_{no\_goto}$ (no unstructured jumps).

- **Connection**: CFG structure constrains paths. Reducibility implies paths can be described by structured constructs.

### 5.2 Data Flow Semantics

- **Semantics**: Def-use chains, value propagation, aliasing.

- **Invariants**: $p_{scope}$, $p_{immutable}$, $p_{no\_alias}$.

- **Connection**: DFG def-use structure determines whether variables are local, immutable, or aliased.

### 5.3 State Transition Semantics

- **Semantics**: State machine (file status, transaction state, session state).

- **Invariants**: $p_{tx}$, $p_{file}$, $p_{order}$.

- **Connection**: State variables and transitions define valid sequences; invariants assert constraints (e.g., atomicity).

### 5.4 I/O Semantics

- **Semantics**: Input-output relation (input → output mapping).

- **Invariants**: $p_{call}$, $p_{copybook}$, $p_{io}$ (deterministic I/O for given input).

- **Connection**: Interface contracts define observable behavior at boundaries.

---

## 6. AST / CFG / DFG as Approximations

### 6.1 Static Approximation

We do not have full $Semantics(C)$ at analysis time. We approximate it with **structural representations**:

- **AST**: Syntactic structure. Approximates *what* the program does (statements, expressions).
- **CFG**: Control flow. Approximates *which paths* are possible.
- **DFG**: Data flow. Approximates *how values* move.

### 6.2 Extraction Mapping

$$
\Phi: (AST, CFG, DFG) \to \mathcal{P}(I)
$$

$\Phi$ extracts invariants from structure. It is **sound** if:
$$
\Phi(C) \subseteq invariants(Semantics(C))
$$
(i.e., we only claim invariants that truly hold).

It may be **incomplete**: some invariants in $invariants(Semantics(C))$ may not be derivable from structure alone (e.g., require theorem proving or runtime verification).

### 6.3 Approximation Limits

| Structure | Approximates | Limitation |
| :--- | :--- | :--- |
| AST | Syntax | No semantics of expressions. |
| CFG | Paths | May over-approximate (infeasible paths). |
| DFG | Data flow | May miss dynamic aliasing. |

---

## 7. Conclusion

The Invariant Semantics Model:
1. Defines $Semantics(C)$ as behavioral representation.
2. Defines $invariants(Semantics(C))$ as predicates on behavior.
3. Connects invariants to control, data, state, and I/O semantics.
4. Explains AST/CFG/DFG as static approximations of semantics for invariant extraction.

This grounds the Phase 3.5 planning model in program semantics.
