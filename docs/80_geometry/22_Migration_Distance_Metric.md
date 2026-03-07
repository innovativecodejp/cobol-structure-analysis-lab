# 22. Migration Distance Metric

**Phase 5: Migration Geometry Construction**  
**Document ID:** `docs/80_geometry/22_Migration_Distance_Metric.md`  
**Date:** 2026-03-08

---

## 1. Introduction

**Migration Distance** quantifies the geometric displacement between two states.
Crucially, **Distance $\neq$ Cost**.

*   **Distance ($d$)**: Geometric difference in guarantee levels. "How different is the system?"
*   **Cost ($J$)**: Operational effort to traverse a path. "How hard is the work?"
*   **Risk ($R$)**: Exposure to failure. "How dangerous is the position?"

This document defines the **Distance Metric ($d$)**.

---

## 2. Metric Definition

We define a **Weighted Euclidean Metric** (L2) as the standard geometric measure.

### 2.1 Weighted L2 Metric (Displacement)

$$
d_w(A, B) = \sqrt{ \sum_{i=1}^{n} w_i (b_i - a_i)^2 }
$$

*   $d_w$ measures **geometric proximity** in the Guarantee Space.
*   It serves as a **proxy** for the magnitude of change required.

### 2.2 Weighted L1 Metric (Manhattan)

$$
d_{L1}(A, B) = \sum_{i=1}^{n} w_i |b_i - a_i|
$$

*   Represents the sum of changes across dimensions, assuming independence.

---

## 3. Weighting Strategy ($w_i$)

Weights reflect the **structural rigidity** or **impact factor** of a dimension. High weight means a unit change on that axis represents a "larger" structural shift.

| Dimension | Weight ($w_i$) | Geometric Interpretation |
| :--- | :--- | :--- |
| **Data ($g_2$)** | **2.0** | Space is "stretched" along the Data axis; small data changes imply large distance. |
| **Transaction ($g_4$)** | **1.8** | Transaction changes cover large geometric ground. |
| **State ($g_3$)** | **1.5** | Medium expansion. |
| **Control ($g_1$)** | **1.2** | Closer to standard Euclidean. |
| **Interface ($g_5$)** | **1.0** | Baseline scale. |

---

## 4. Distance Interpretation

1.  **Geometric Displacement**: $d(S_{current}, S_{target})$
    *   Purely spatial. "How far are we from the goal?"
2.  **Safety Margin**: $\min_{B \in \partial\mathcal{S}} d(S_{current}, B)$
    *   Geometric clearance from the failure boundary.

*Note: Cost is derived from Distance but includes path-dependent factors (velocity, friction). See 25_Migration_Optimization_Model.*

---

## 5. Geometry of Metrics

Visually, states equidistant from the Target form **Metric Hyperspheres**.

*   In a non-weighted space, these are spheres.
*   In our weighted space, they are **Ellipsoids** stretched along the Data and Transaction axes.
*   This means "short" moves in Data space are geometrically equivalent to "long" moves in Interface space.

---

## 6. Conclusion

The Migration Distance Metric maps abstract "change magnitude" to a concrete scalar value. It forms the basis for Cost calculation but is distinct from Cost and Risk.
