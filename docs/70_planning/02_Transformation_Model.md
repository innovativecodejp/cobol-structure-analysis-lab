# 02. Transformation Model

**Phase 3.5: Migration Planning Theory**  
**Document ID:** `docs/70_planning/02_Transformation_Model.md`  
**Date:** 2026-03-05

---

## 1. Introduction

The Guarantee State Graph (P3.5-1) defines edges as state transitions $S \to S'$. This document formalizes the **Transformation Model** that maps concrete program modifications to those transitions. Each transformation is a structural change to the code that acquires one or more semantic invariants.

---

## 2. Formal Definition

### 2.1 Transformation

A **Transformation** $T$ is a mapping:

$$
T: S \mapsto S'
$$

Where:
- $S \subseteq I$: Initial guarantee set (pre-condition).
- $S' \subseteq I$: Resulting guarantee set (post-condition).

### 2.2 Atomic vs. Composite

- **Atomic transformation**: $S' = S \cup \{p\}$ for a single $p \in I \setminus S$. Corresponds to one edge in $G_{state}$.
- **Composite transformation**: A sequence of atomic transformations. Corresponds to a path in $G_{state}$.

---

## 3. Transformation Taxonomy

### 3.1 Control Flow Restructuring

| Aspect | Description |
| :--- | :--- |
| **Structural change** | Replace GOTOs with structured constructs (IF/ELSE, PERFORM/UNTIL). Apply reducibility algorithms (e.g., node splitting). |
| **Affected guarantees** | Adds $p_{no\_goto}$, $p_{reducible}$, $p_{loop}$. |
| **Risks** | Logic errors if restructuring is incorrect; possible performance change. |

### 3.2 Module Decomposition

| Aspect | Description |
| :--- | :--- |
| **Structural change** | Split a large paragraph/procedure into smaller units. Extract cohesive logic into separate programs. |
| **Affected guarantees** | Adds $p_{scope}$, $p_{modular}$, $p_{call}$. |
| **Risks** | Interface mismatches; increased CALL overhead; shared state may block decomposition. |

### 3.3 Data Encapsulation

| Aspect | Description |
| :--- | :--- |
| **Structural change** | Move global WORKING-STORAGE into LOCAL-STORAGE or LINKAGE. Introduce parameter passing instead of shared COPYBOOKs. |
| **Affected guarantees** | Adds $p_{scope}$, $p_{immutable}$, $p_{no\_alias}$. |
| **Risks** | Data flow errors; performance impact from parameter copying. |

### 3.4 Interface Extraction

| Aspect | Description |
| :--- | :--- |
| **Structural change** | Define explicit CALL interface (PROCEDURE USING). Standardize COPYBOOK layout. Document I/O contracts. |
| **Affected guarantees** | Adds $p_{call}$, $p_{copybook}$, $p_{io}$. |
| **Risks** | Contract violations if callers are not updated; versioning issues. |

### 3.5 State Isolation

| Aspect | Description |
| :--- | :--- |
| **Structural change** | Isolate file state, transaction state, or session state into dedicated modules. Reduce global mutable state. |
| **Affected guarantees** | Adds $p_{tx}$, $p_{file}$, $p_{order}$. |
| **Risks** | Transaction boundaries may be hard to preserve; concurrency issues. |

---

## 4. Validity Constraints

### 4.1 Dependency Rules

A transformation $T: S \mapsto S'$ is **dependency-valid** if:

$$
S' \in \mathcal{G}_{dep}
$$

i.e., $S'$ is dependency-closed. Acquiring $q$ requires that all $p$ with $(p,q) \in D$ are already in $S$.

### 4.2 No Invariant Violation

$$
S \subseteq S'
$$

A valid transformation **never removes** invariants. Migration is monotonic.

### 4.3 Reachability Preservation

If $S \notin \mathcal{S}$, then $T$ must not create a dead-end. Formally: there must exist some path from $S'$ to $\mathcal{S}$ in $G_{state}$. (This is automatically satisfied for atomic transformations that add a single invariant, unless $S'$ is maximal and still unsafe.)

---

## 5. Mapping from Code

### 5.1 Chain

$$
\text{Code change} \to \text{AST/CFG/DFG modification} \to \text{Guarantee update}
$$

### 5.2 Example: Control Flow Restructuring

1. **Code change**: Replace `GOTO PARA-X` with `PERFORM PARA-X UNTIL exit-flag`.
2. **CFG modification**: Remove back-edge; add loop structure.
3. **Guarantee update**: $\Phi(CFG_{new})$ now includes $p_{no\_goto}$, $p_{reducible}$.

### 5.3 Example: Module Decomposition

1. **Code change**: Extract paragraphs 100–200 into a new program `SUBPROG`.
2. **AST/DFG modification**: New program node; LINKAGE SECTION for parameters.
3. **Guarantee update**: $\Phi(Structure_{new})$ includes $p_{scope}$, $p_{call}$.

---

## 6. Structural Interpretation

| Transformation | AST | CFG | DFG |
| :--- | :--- | :--- | :--- |
| Control flow restructuring | Minor (replace nodes) | Major (topology change) | Minor |
| Module decomposition | New program nodes | New entry/exit | New def-use boundaries |
| Data encapsulation | DATA DIVISION change | Minor | Major (scope change) |
| Interface extraction | PROCEDURE USING change | Minor | Parameter flow |
| State isolation | New modules | New control paths | State variable scoping |

---

## 7. Conclusion

The Transformation Model:
1. Maps code modifications to state transitions $S \to S'$.
2. Classifies transformations by type (control, module, data, interface, state).
3. Enforces validity (dependency, monotonicity, reachability).
4. Connects to structural analysis (AST, CFG, DFG).

This model provides the semantic basis for weighting transformations in the Migration Cost Model (P3.5-3).
