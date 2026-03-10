# 12. 移行経路幾何学 (Migration Path Geometry)

**Phase 4.5: Geometry Formalization**  
**Document ID:** `docs/80_geometry/12_Migration_Path_Geometry.md`  
**Date:** 2026-03-05

---

## 1. はじめに

移行経路は、保証空間内の幾何学的な曲線として形式化される。

---

## 2. 経路定義

$$
P: [0,1] \to GS, \quad P(0)=G(Legacy), \quad P(1)=G(Target)
$$

## 3. 経路リスク

### 3.1 リスク密度 (コスト場)

移行リスクは、**リスク密度**（コスト場）上の積分として表現される。

**一般形**: コスト関数は任意の非負スカラー場であり得る
$$
cost: GS \to \mathbb{R}_{\ge 0}
$$

**Phase4.5 参照モデル**:
$$
cost(G) = d_w(G, Ideal)
$$

これは、**リスク ≠ 距離** という一般性を保持する。距離は1つの可能なコストモデルに過ぎない。

- **Risk Density**: 局所的移行リスク（各点 $G \in GS$ におけるリスク）
- **Cost Field**: 空間上のリスク分布
- **Gradient**: リスク増加方向 $\nabla cost$

### 3.2 経路リスク積分

$$
Risk(P) = \int_0^1 cost(P(t)) \, dt = \int_0^1 d_w(P(t), Ideal) \, dt
$$

## 4. 最適化

$$
\min_P Risk(P) \quad \text{s.t. } P(t) \in \mathcal{S} \quad \forall t
$$

**依存関係制約**（16_Guarantee_Axis_Dependency.md 参照）は許容可能な移行経路を制限し、経路最適化において尊重されなければならない。

---

## 5. 結論

移行経路幾何学は、移行を距離空間内の曲線として扱う。
