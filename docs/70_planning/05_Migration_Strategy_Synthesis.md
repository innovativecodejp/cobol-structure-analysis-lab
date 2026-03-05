# 05. Migration Strategy Synthesis

**Phase 3.5: Migration Planning Theory**  
**Document ID:** `docs/70_planning/05_Migration_Strategy_Synthesis.md`  
**Date:** 2026-03-05

---

## 1. Introduction

This document synthesizes the outputs of Phase 3.5 (P3.5-0 through P3.5-4) into a **complete migration plan**. The plan specifies the sequence of transformations, estimated risk and cost, and verification checkpoints, integrating with the Phase 3 Verification Framework.

---

## 2. Planning Framework

### 2.1 Inputs

| Input | Source | Role |
| :--- | :--- | :--- |
| Guarantee State Graph | P3.5-1 | Defines possible states and transitions. |
| Transformation Model | P3.5-2 | Maps edges to concrete code changes. |
| Migration Cost Model | P3.5-3 | Provides edge weights. |
| Optimal Path | P3.5-4 | Yields the minimal-cost trajectory. |

### 2.2 Planning Structure

A **Migration Plan** $\mathcal{P}$ has four components:

1.  **Initial System Analysis**
2.  **Transformation Sequence**
3.  **Intermediate States**
4.  **Verification Gates**

---

## 3. Plan Components

### 3.1 Initial System Analysis

- **Extract structure**: $(AST, CFG, DFG)$ from the legacy codebase.
- **Compute initial state**: $S_0 = \Phi(AST, CFG, DFG)$.
- **Assess feasibility**: Check $S_0 \in \mathcal{G}_{dep}$ and $\mathcal{R}(S_0) \cap \mathcal{S} \neq \emptyset$ (Phase 3).
- **Compute metrics**: $D_{debt}(S_0)$, $R_{struct}(S_0)$, $C_{min}(S_0)$.

**Output**: Analysis report with $S_0$, risk/cost summary, and go/no-go decision.

### 3.2 Transformation Sequence

From the Optimal Path algorithm (P3.5-4), we obtain:

$$
path = (S_0, S_1, \dots, S_n)
$$

Where $S_n \in \mathcal{S}$.

For each step $i = 0, \dots, n-1$:
- **Invariant acquired**: $p_i = S_{i+1} \setminus S_i$ (singleton for atomic steps).
- **Transformation type**: From P3.5-2 taxonomy (control flow, module, data, interface, state).
- **Concrete action**: Refactoring or translation task (e.g., "Restructure PARA-X to remove GOTOs").

**Output**: Ordered list of transformations $T_1, T_2, \dots, T_n$.

### 3.3 Intermediate States

After each transformation $T_i$, the system is in state $S_i$.

| Step | State $S_i$ | Invariants Added | Cumulative Cost |
| :--- | :--- | :--- | :--- |
| 0 | $S_0$ | — | 0 |
| 1 | $S_1$ | $\{p_1\}$ | $Cost(S_0 \to S_1)$ |
| … | … | … | … |
| n | $S_n \in \mathcal{S}$ | $\{p_n\}$ | $Cost(path)$ |

**Output**: State trajectory table with cost roll-up.

### 3.4 Verification Gates

At each step $S_i \to S_{i+1}$, apply the Verification Framework (Phase 3 Task 6):

1.  **Pre-condition**: Verify $S_i$ matches expected state (or $\Delta < Threshold$).
2.  **Execute**: Apply transformation $T_i$.
3.  **Post-condition**: Verify $S_{i+1} = \Phi(AST', CFG', DFG')$ and $S_{i+1} \in \mathcal{G}_{dep}$.
4.  **Regression**: Run tests to ensure $G_{crit}$ (and existing invariants) are preserved.

If any gate fails, **Halt** and trigger the Correction Protocol (re-plan or fix deviation).

**Output**: Verification checklist per step.

---

## 4. Plan Output Schema

### 4.1 Migration Plan Document

```
Migration Plan: [System Name]
Date: [Date]
Initial State: S_0 = { ... }
Target State: S_n ∈ S (Safety Region)

--- Transformation Sequence ---
Step 1: [Transformation Type] — Acquire p_1
  Action: [Concrete task]
  Estimated Cost: [Value]
  Verification: [Checklist]

Step 2: ...
...

--- Summary ---
Total Steps: n
Total Estimated Cost: Cost(path)
Total Estimated Risk: [Aggregate]
Verification Gates: n
```

### 4.2 Risk and Cost Summary

- **Estimated cost**: $Cost(path) = \sum_{i=0}^{n-1} Cost(S_i \to S_{i+1})$.
- **Estimated risk**: Peak $R_{struct}(S_i)$ along the path, or aggregate $P_{fail}$.
- **Contingency**: Recommend $(1 + \epsilon) \times Cost(path)$ for budget (e.g., $\epsilon = 0.2$).

---

## 5. Example Migration Plan

### 5.1 Scenario: Spaghetti Code → Direct Migration

**Initial analysis**:
- $S_0 = \{p_{scope}\}$ (data is local; control flow is unstructured).
- $G_{crit} = \{p_{scope}, p_{no\_goto}, p_{call}\}$.
- $D_{debt}(S_0) = w(p_{no\_goto}) + w(p_{call}) = 7$.

**Transformation sequence**:

| Step | Transformation | Invariant | Action | Cost |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Control flow restructuring | $p_{no\_goto}$ | Resolve GOTOs in PARA-A, PARA-B | 46 |
| 2 | Interface extraction | $p_{call}$ | Define CALL interface for subprogram | 8 |
| — | **Total** | — | — | **54** |

**Verification gates**:
- After Step 1: Run CFG analysis; confirm $p_{no\_goto} \in \Phi(CFG)$.
- After Step 2: Run interface tests; confirm $p_{call} \in \Phi(Structure)$.
- Final: $S_2 \in \mathcal{S}$, regression tests pass.

---

## 6. Integration with Verification Framework

The Migration Plan feeds directly into the Phase 3 Verification Framework:

1.  **Traceability**: Each step links to $(L, M, E, C)$ — the rule, metric, structural element, and code artifact.
2.  **Continuous verification**: $\Delta(t) = d_w(S_{plan}(t), S_{actual}(t))$ is monitored at each gate.
3.  **Post-migration validation**: $Verify(S_{final}) \iff G_{crit} \subseteq S_{final}$.
4.  **Feedback**: If $P_{fail}$ is observed higher than estimated, update cost model parameters (Bayesian refinement).

---

## 7. Conclusion

The Migration Strategy Synthesis:
1. Combines Guarantee State Graph, Transformation Model, Cost Model, and Optimal Path into a single plan.
2. Produces a transformation sequence with cost, risk, and verification gates.
3. Integrates with the Verification Framework for correctness assurance.
4. Provides a template for executable migration projects.

Phase 3.5 thus completes the **Migration Planning Framework**: from "Can we migrate?" (Phase 3) to "How do we migrate optimally?" (Phase 3.5).
