# 03. Migration Distance

**Phase 4: Migration Geometry**  
**Document ID:** `docs/80_geometry/03_Migration_Distance.md`  
**Date:** 2026-03-05

---

## 1. Introduction

**Migration Risk** is defined as the **distance** between the current guarantee vector and the ideal state. This document formalizes the distance metric.

---

## 2. Formal Definition

### 2.1 Risk as Distance

$$
Risk(T) = distance(G(T), Ideal)
$$

Where $Ideal = (1, 1, 1, \dots, 1)$.

### 2.2 Euclidean Distance

$$
d_{Eucl}(G, Ideal) = \sqrt{\sum_{i=1}^{n} (1 - g_i)^2}
$$

### 2.3 Manhattan Distance

$$
d_{Man}(G, Ideal) = \sum_{i=1}^{n} |1 - g_i|
$$

### 2.4 Weighted Distance (重み付き距離)

A **weighted metric** accounts for the relative importance of each guarantee dimension:

$$
d_w(G, Ideal) = \sqrt{\sum_{i=1}^{n} w_i (1 - g_i)^2}
$$

Where $w_i > 0$ is the **weight** (importance) of axis $i$. Example weights:

| Axis | Weight $w_i$ | Interpretation |
| :--- | :--- | :--- |
| Control | 1.0 | Baseline |
| Data | 1.2 | Data integrity critical |
| State | 1.5 | State transitions high impact |
| Transaction | 1.6 | Transaction boundary most critical |
| Interface | 0.8 | Interface often adaptable |

Weighted Manhattan:

$$
d_{w,Man}(G, Ideal) = \sum_{i=1}^{n} w_i |1 - g_i|
$$

---

## 3. Interpretation

- **Higher distance** → Higher migration risk
- **Distance 0** → $G = Ideal$ (perfect preservation)
- **Maximum distance** → $G = Origin$ (all guarantees destroyed)

---

## 4. Path Distance

For a migration path $P(t)$ from $t=0$ (Legacy) to $t=1$ (Target):

$$
Risk(P) = \int_0^1 distance(G(P(t)), Ideal) \, dt
$$

Or discretized:

$$
Risk(P) = \sum_{k} distance(G(P_k), Ideal)
$$

---

## 5. Conclusion

Migration Distance provides a **quantitative risk** measure. It is the foundation for Migration Optimization (minimize Risk) and the definition of Safe/Failure regions.
