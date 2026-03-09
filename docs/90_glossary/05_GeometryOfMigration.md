# Glossary 5. Geometry of Migration

This document defines geometric concepts applied to migration planning.

---

## Migration Geometry

**Layer**: Geometry
**Status**: Defined

**Definition**:
移行プロセスを幾何空間上の移動としてモデル化する枠組み。

**Related Concepts**: Guarantee Space

---

## Migration Distance

**Layer**: Geometry
**Status**: Defined

**Definition**:
現状システムと目標システムの間の幾何学的距離。移行の「大きさ」を表す。

**Formal Description**:
$d(Legacy, Target)$

**Related Concepts**: Migration Cost

---

## Migration Path

**Layer**: Geometry
**Status**: Defined

**Definition**:
Guarantee Space 上での、Legacy状態からTarget状態への軌跡（一連の状態遷移）。

**Formal Description**:
Sequence $S_0, S_1, \dots, S_n$ where $S_0=Legacy, S_n=Target$.

**Related Concepts**: Migration Strategy

---

## Shortest Migration Path

**Layer**: Geometry
**Status**: Placeholder

**Definition**:
(定義待ち: Migration CostまたはDistanceを最小化する経路)

**Related Concepts**: Migration Optimization

---

## Migration Cost

**Layer**: Decision
**Status**: Defined

**Definition**:
Migration Path を移動するために必要な総労力。距離だけでなく、経路上のリスクや摩擦係数を含む。

**Formal Description**:
$Cost(P) = \int_{P} (Effort + Risk) dt$

**Related Concepts**: Migration Distance
