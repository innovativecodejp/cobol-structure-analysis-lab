# 24. Migration Strategy Space

**Phase 5: Migration Geometry Construction**  
**Document ID:** `docs/80_geometry/24_Migration_Strategy_Space.md`  
**Date:** 2026-03-08

---

## 1. Introduction

The **Strategy Space** organizes different migration approaches (patterns) based on their geometric characteristics in the Guarantee Space.

---

## 2. Strategy Definition

A **Migration Strategy** $\Sigma$ is a **family of paths** (homotopy class) sharing topological or geometric properties.

$$
\Sigma = \{ P \mid P \text{ satisfies condition } C_\Sigma \}
$$

Strategies are distinguished by:
1.  **Topology**: Do they stay in $\mathcal{S}$?
2.  **Step Granularity**: Continuous vs. Discrete chunks.
3.  **Support**: Do they rely on parallel systems ($S_{legacy}$)?

---

## 3. Strategy Families

### 3.1 The "Big Bang" Strategy ($\Sigma_{BB}$)

*   **Definition**: A path with a single step $S_0 \to S_{target}$, or a path that exits $\mathcal{S}$ for a significant duration.
*   **Geometry**: Geodesic (straight line) in unconstrained space.
*   **Pros**: Minimal intermediate overhead.
*   **Cons**: High risk of catastrophic failure (landing in $\mathcal{F}$).

### 3.2 The "Strangler Fig" Strategy ($\Sigma_{SF}$)

*   **Definition**: A path composed of many small steps, keeping the legacy system live while incrementally replacing functionality.
*   **Geometry**: A discrete path $S_0 \to S_1 \to \dots \to S_k$ where every $S_i$ is close to $S_{i-1}$ and $S_i \in \mathcal{S}$.
*   **Pros**: High safety, verifiable steps.
*   **Cons**: Higher total distance (cost of adapters, dual maintenance).

### 3.3 The "Parallel Run" Strategy ($\Sigma_{PR}$)

*   **Definition**: A path where the system state is effectively duplicated, $S_{new}$ and $S_{old}$ run simultaneously, and the "effective state" is a weighted average.
*   **Geometry**: Maintains a position in high-guarantee space by using the legacy system as a fallback (safety net).

---

## 4. Strategy Map

We can map strategies on axes of **Step Size** vs. **Safety Margin**.

| Strategy | Step Size ($\Delta S$) | Safety Margin | Cost Overhead |
| :--- | :--- | :--- | :--- |
| **Big Bang** | Large (1.0) | Low / Negative | Low |
| **Phased** | Medium (0.3) | Medium | Medium |
| **Strangler** | Small (0.05) | High | High |

---

## 5. Geometric Selection Criteria

How to choose a strategy based on geometry:

1.  If **Legacy is near Boundary** ($\mathcal{S}$ is narrow):
    *   $\implies$ Use **Strangler** (Small steps required to avoid falling into $\mathcal{F}$).
2.  If **Legacy is deep in Safe Region** ($\mathcal{S}$ is wide):
    *   $\implies$ **Phased** or **Big Bang** might be acceptable risks for speed.
3.  If **Target is far** (large $d$):
    *   $\implies$ **Strangler** preferred to manage accumulated error.

---

## 5. Conclusion

Migration Strategies are **families of geometric paths**.
*   **Big Bang**: Geodesic, ignoring constraints.
*   **Strangler**: Boundary-hugging, fine-grained.
*   **Phased**: Waypoint-based, coarse-grained.

Selecting a strategy is selecting a **region of path space** to explore.
