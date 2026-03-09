# Glossary 3. Guarantee Theory

This document defines the constituent elements of the Guarantee concept.

---

## Guarantee

**Layer**: Logic
**Status**: Defined

**Definition**:
システムのある性質が、変換や移行の後でも維持されていることの確証。

**Related Concepts**: Guarantee Unit, Invariant

---

## Guarantee Unit

**Layer**: Structure
**Status**: Defined

**Definition**:
保証を検証・維持する最小の機能単位。L1（文）からL5（業務機能）までの階層を持つ。

**Related Concepts**: Guarantee Layer

**Example**:
L2 Guarantee Unit: ひとつの `IF` ブロックの論理的等価性。

---

## Guarantee Composition

**Layer**: Theory
**Status**: Placeholder

**Definition**:
(定義待ち: 複数の小さな保証を組み合わせて、より大きな保証を構成する操作または理論)

**Related Concepts**: Guarantee Unit

---

## Guarantee Order

**Layer**: Theory
**Status**: Defined

**Definition**:
保証の強さや包含関係に基づく順序関係。「保証Aは保証Bよりも強い（A implies B）」などの関係。

**Formal Description**:
Partial order $\leq$ on Guarantee Space.

**Related Concepts**: Guarantee Lattice

---

## Guarantee Equivalence

**Layer**: Logic
**Status**: Placeholder

**Definition**:
(定義待ち: 2つのプログラム要素が、保証の観点で「等価」であるとみなされるための条件)

**Related Concepts**: Semantic Equivalence
