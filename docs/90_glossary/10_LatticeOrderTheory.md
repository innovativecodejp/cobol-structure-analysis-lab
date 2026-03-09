# Glossary 10. Lattice / Order Theory

This document defines mathematical concepts from order theory used in the research.

---

## Guarantee Lattice

**Layer**: Theory
**Status**: Defined

**Definition**:
Guarantee Space が形成する束（Lattice）構造。任意の2つの保証状態に対して、上限（Join）と下限（Meet）が存在する。

**Related Concepts**: Partial Order

---

## Partial Order

**Layer**: Theory
**Status**: Defined

**Definition**:
半順序関係。反射律、反対称律、推移律を満たす二項関係。保証の「強さ」を表すために用いられる。

**Formal Description**:
Relation $\leq$ s.t. reflexive, antisymmetric, transitive.

---

## Meet

**Layer**: Theory
**Status**: Defined

**Definition**:
2つの要素の最大下界（Greatest Lower Bound）。「共通する保証」を意味する。

**Formal Description**:
$a \land b$

---

## Join

**Layer**: Theory
**Status**: Defined

**Definition**:
2つの要素の最小上界（Least Upper Bound）。「合併した保証」を意味する。

**Formal Description**:
$a \lor b$
