# 21. Migration State Model

**Phase 5: Migration Geometry Construction**  
**Document ID:** `docs/80_geometry/21_Migration_State_Model.md`  
**Date:** 2026-03-08

---

## 1. Introduction

A **Migration State** represents a snapshot of the system's guarantee levels at a specific point in time. In Migration Geometry, a state is a **point** within the Guarantee Space.

---

## 2. State Definition

A state $S$ is a vector in $GS$:

$$
S = (g_1, g_2, \dots, g_n) \in [0,1]^n
$$

### 2.1 Key Reference States

*   **Legacy State ($S_{legacy}$)**: The starting point of migration. Typically assumes high guarantees for existing behavior but may be structurally opaque.
    *   Example: $S_{legacy} = (1.0, 1.0, 1.0, 1.0, 1.0)$ relative to itself.
    *   *Note: Often we normalize the target relative to the legacy, or vice versa. Here, we define $1.0$ as the "Ideal" or "Target" requirement met.*

*   **Target State ($S_{target}$)**: The goal of the migration.
    *   Example: $S_{target} = (1.0, 1.0, 1.0, 1.0, 1.0)$ (Full equivalence + Modernization).

*   **Zero State ($S_{zero}$)**: Total loss of guarantees.
    *   $S_{zero} = (0, 0, 0, 0, 0)$.

### 2.2 Intermediate States

Migration involves passing through intermediate states $S_t$.

*   **Partial Migration**: $S_{partial} = (1.0, 0.8, 0.5, 1.0, 0.9)$
    *   *Interpretation*: Logic and Transaction are perfect, Data is acceptable, but State consistency is temporarily degraded (e.g., during dual-write implementation).

---

## 3. State Classification

States are classified based on their location relative to the Safe Region $\mathcal{S}$.

1.  **Admissible State**: $S \in \mathcal{S}$. The system is functional and safe.
2.  **Inadmissible State**: $S \in \mathcal{F}$. The system is broken or violates critical constraints (e.g., data corruption).
3.  **Boundary State**: $S \in \partial\mathcal{S}$. The system is on the edge of failure; zero margin for error.

---

## 4. State Transitions

A transition $T$ is a vector difference between two states:

$$
T_{a \to b} = S_b - S_a = \Delta S
$$

*   **Positive Transition**: $\Delta g_i > 0$ (Guarantee improvement / Recovery)
*   **Negative Transition**: $\Delta g_i < 0$ (Guarantee degradation / Risk acceptance)

---

## 5. Example: Strangler Pattern States

```mermaid
graph LR
    S0[Legacy S0] --> S1[Phase 1: Facade]
    S1 --> S2[Phase 2: Dual Write]
    S2 --> S3[Phase 3: Switch Read]
    S3 --> S4[Target S4]

    style S0 fill:#f9f,stroke:#333
    style S4 fill:#9f9,stroke:#333
```

*   $S_0$: All Legacy
*   $S_1$: Interface stable ($g_5=1$), internal logic opaque.
*   $S_2$: Data synched ($g_2 \approx 1$), but complexity high.
*   $S_3$: State moved ($g_3 \to 1$).

---

## 6. Conclusion

The Migration State Model allows us to precisely quantify the "health" of a system at any step of the migration using coordinates in the Guarantee Space.
