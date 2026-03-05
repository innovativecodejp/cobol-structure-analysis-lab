# 04. Safe Region

**Phase 4: Migration Geometry**  
**Document ID:** `docs/80_geometry/04_Safe_Region.md`  
**Date:** 2026-03-05

---

## 1. Introduction

The **Safe Region** is the subset of the Guarantee Space where migration is considered acceptable. A transformation $T$ is **Safe** if and only if $G(T)$ lies in this region.

---

## 2. Formal Definition

### 2.1 Safe Region

$$
\mathcal{S} = \{ (g_1, \dots, g_n) \in GS \mid g_i \ge \tau_i \quad \forall i \}
$$

Where $\tau_i$ is the **threshold** for dimension $i$.

### 2.2 Example Thresholds

| Dimension | Threshold $\tau_i$ | Interpretation |
| :--- | :--- | :--- |
| Data Flow | 0.95 | Data must be 95% preserved |
| State | 0.90 | State transitions 90% preserved |
| Transaction | 0.85 | Transaction boundaries 85% preserved |

### 2.3 Safe Migration

$$
T \text{ is Safe Migration} \iff G(T) \in \mathcal{S}
$$

---

## 3. Geometric Interpretation

The Safe Region is a **hyper-rectangle** (or orthant) in $GS$:

$$
\mathcal{S} = [\tau_1, 1] \times [\tau_2, 1] \times \dots \times [\tau_n, 1]
$$

---

## 4. Relation to Phase 3

Phase 3 defined Safe Region as $G_{crit} \subseteq S$ (discrete). Phase 4 extends this with **continuous thresholds**:

- Phase 3: Binary (Safe/Unsafe)
- Phase 4: Graduated (degree of safety)

---

## 5. Conclusion

The Safe Region $\mathcal{S}$ defines the **acceptable migration zone**. Migration paths must remain within or reach $\mathcal{S}$ to be considered successful.
