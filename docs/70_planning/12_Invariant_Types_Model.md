# 12. Invariant Types Model (Hard / Soft Invariants)

**Phase 3.5: Migration Planning Theory (Strengthening)**  
**Document ID:** `docs/70_planning/12_Invariant_Types_Model.md`  
**Date:** 2026-03-05

---

## 1. Introduction

Not all invariants are equally critical. Some **must** be preserved (Hard); others **may** be relaxed or traded for migration benefits (Soft). This document defines the **Hard / Soft Invariant Model** and its effect on migration planning.

---

## 2. Invariant Categories

### 2.1 Hard Invariants ($I_{hard}$)

**Definition**: Invariants that **must** be preserved. Violation implies migration failure.

$$
I_{hard} \subseteq I
$$

**Examples**:
- Correctness of business logic (e.g., interest calculation formula).
- Data integrity (e.g., no loss of critical records).
- Regulatory compliance (e.g., audit trail).

**Preservation rule**: $\forall p \in I_{hard}: p \in S_{start} \implies p \in S_{target}$.

### 2.2 Soft Invariants ($I_{soft}$)

**Definition**: Invariants that **may** change during migration if justified. Relaxation can reduce cost or enable otherwise blocked transformations.

$$
I_{soft} = I \setminus I_{hard}
$$

**Examples**:
- Performance characteristics (e.g., response time may change).
- Code structure (e.g., modularity can improve).
- Implementation detail (e.g., file format may change if interface is preserved).

**Preservation rule**: Optional. May be relaxed with explicit justification.

---

## 3. Preservation Rules

### 3.1 Hard Invariant Preservation

For any migration path $S_0 \to \dots \to S_n$:

$$
\forall p \in I_{hard} \cap S_0: p \in S_i \quad \forall i \in \{0, \dots, n\}
$$

Hard invariants are **monotonic**: once present, they must never be removed.

### 3.2 Soft Invariant Relaxation

A transformation $T: S \mapsto S'$ may **relax** a soft invariant $p \in I_{soft}$ if:
1. $p \in S$ and $p \notin S'$ (invariant is dropped).
2. There exists a **justification** (e.g., "Replaced with equivalent $p'$" or "Acceptable trade-off for cost reduction").
3. No hard invariant depends on $p$ (i.e., $(p, q) \in D$ and $q \in I_{hard}$ implies $p$ cannot be relaxed).

### 3.3 Critical Set Alignment

$G_{crit}$ (Phase 3) is typically a subset of $I_{hard}$:
$$
G_{crit} \subseteq I_{hard}
$$

Reaching $\mathcal{S}$ requires $G_{crit} \subseteq S_{target}$; all critical invariants are hard.

### 3.4 Relaxation Decision Model

We introduce a **relaxation function** $\rho: I \to \{0, 1\}$:

- $\rho(p) = 1$: Preserve invariant $p$ during migration.
- $\rho(p) = 0$: Relax invariant $p$ (allow it to change or be dropped).

**Constraint**: Hard invariants must always be preserved:
$$
\forall p \in I_{hard}: \rho(p) = 1
$$

**Migration planning** becomes an optimization problem:

**Minimize**:
$$
MigrationCost + RiskPenalty(\rho)
$$

**Subject to**:
$$
\forall p \in I_{hard}: \rho(p) = 1
$$

Where $RiskPenalty(\rho)$ quantifies the risk of relaxing soft invariants (e.g., $\sum_{p \in I_{soft}, \rho(p)=0} risk(p)$). The planner trades off migration cost against the risk of relaxing soft invariants.

---

## 4. Allowed Invariant Relaxation

### 4.1 Relaxation Conditions

Soft invariant $p$ may be relaxed if:
1. **Replacement**: $p$ is replaced by an equivalent or stronger invariant $p'$ (e.g., $p$ = "sequential file access", $p'$ = "indexed file access" with same logical behavior).
2. **Explicit acceptance**: Stakeholder accepts the loss of $p$ (e.g., "Performance may degrade 10%").
3. **Dependency safety**: No hard invariant depends on $p$.

### 4.2 Relaxation Cost

Relaxing $p$ may reduce migration cost (fewer transformations needed) but incurs **risk** or **technical debt**. We can model this as a negative cost (savings) with an associated risk penalty.

---

## 5. Effect on Planning Graph

### 5.1 Extended State Space

With soft invariants, the state space allows **backward edges** (invariant removal) for soft invariants only:

$$
(S, S') \in E \iff S' = S \cup \{p\} \lor (S' = S \setminus \{p\} \land p \in I_{soft})
$$

**Caveat**: This may introduce cycles. Planning becomes more complex; dominance pruning must account for possible relaxation.

### 5.2 Simplified Model (Recommended)

**Alternative**: Keep the graph monotonic (only add invariants). Model soft invariant relaxation as a **separate decision** at each step: "For transformation $T$, we accept relaxing $p$." The state still only adds invariants; relaxation is an annotation, not a graph edge.

This preserves DAG structure and simplifies optimal path algorithms.

### 5.3 Planning Implications

- **Hard invariants**: Define the Safety Region. $S \in \mathcal{S} \iff G_{crit} \subseteq S$ and $G_{crit} \subseteq I_{hard}$.
- **Soft invariants**: Influence cost (acquiring them may be optional) and path selection (paths that preserve more soft invariants may be preferred if cost is similar).

---

## 6. Examples for Legacy Migration

### 6.1 COBOL Batch → Modern Batch

| Invariant | Type | Rationale |
| :--- | :--- | :--- |
| Calculation correctness | Hard | Business requirement. |
| File record format | Hard | Downstream systems depend on it. |
| Execution order (paragraph sequence) | Soft | May reorder if logic preserved. |
| GOTO structure | Soft | Will be removed (restructured). |
| Response time | Soft | May change with new platform. |

### 6.2 COBOL → Microservices

| Invariant | Type | Rationale |
| :--- | :--- | :--- |
| Business logic | Hard | Core value. |
| Transaction atomicity | Hard | Data integrity. |
| Monolithic deployment | Soft | Explicitly changing to distributed. |
| Shared COPYBOOK | Soft | Replaced by API contracts. |

---

## 7. Conclusion

The Invariant Types Model:
1. Distinguishes Hard (must preserve) vs. Soft (may relax) invariants.
2. Defines preservation rules and allowed relaxation conditions.
3. Explains effect on planning graph (simplified: keep DAG, annotate relaxation).
4. Provides examples for legacy migration scenarios.
