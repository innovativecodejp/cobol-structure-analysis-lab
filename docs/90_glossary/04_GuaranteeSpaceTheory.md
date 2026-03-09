# Glossary 4. Guarantee Space Theory

This document defines the mathematical spaces used to model guarantees.

---

## Guarantee Space

**Layer**: Theory
**Status**: Defined

**Definition**:
システムが取りうるすべての保証状態の集合。

**Formal Description**:
$\mathcal{G} \cong [0,1]^n$ (Continuous approx) or Lattice (Discrete).

**Related Concepts**: Migration Geometry

---

## Guarantee Dimension

**Layer**: Theory
**Status**: Defined

**Definition**:
保証空間を構成する独立した（または準独立した）評価軸。Control, Data, State, Transaction, Interface など。

**Related Concepts**: Guarantee Vector

**Example**:
$g_1$: Control Flow Preservation

---

## Dependent Guarantee Space

**Layer**: Theory
**Status**: Defined

**Definition**:
保証次元間の依存関係（例: Data保証なしにState保証は成立しない）を考慮し、到達不可能な状態を除外した空間。

**Formal Description**:
$\mathcal{G}_{dep} = \{ S \in \mathcal{G} \mid S \text{ satisfies dependencies} \}$

**Related Concepts**: Guarantee Space

---

## Weighted Guarantee Space

**Layer**: Theory
**Status**: Defined

**Definition**:
各保証次元に、その重要度や達成コストに基づく「重み」を付与した空間。

**Formal Description**:
$(\mathcal{G}, w)$ where $w: \text{Dimensions} \to \mathbb{R}$.

**Related Concepts**: Guarantee Metric

---

## Guarantee Metric

**Layer**: Theory
**Status**: Defined

**Definition**:
保証空間上の2点間の距離を定義する関数。

**Formal Description**:
$d(S_1, S_2) = \| S_1 - S_2 \|_w$

**Related Concepts**: Migration Distance
