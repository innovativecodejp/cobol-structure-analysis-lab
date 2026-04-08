# Glossary 10. Lattice Order Theory

This document defines mathematical concepts related to lattice structures and partial orders.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Lattice** | Geometry | 半順序集合において、任意の二つの要素に対して上限（join）と下限（meet）が存在する構造。保証の包含関係を表現するのに用いる。 | $(L, \leq, \vee, \wedge)$ where $\vee$ is join, $\wedge$ is meet | [[Partial Order]], [[Guarantee Lattice]] |
| **Partial Order** | Geometry | 反射的、推移的、反対称的な二項関係。保証の強弱関係などを表現。 | $(S, \leq)$ where $\leq$ is reflexive, transitive, antisymmetric | [[Lattice]], [[Total Order]] |
| **Join Operation** | Geometry | 束における上限演算。二つの要素の最小上界を求める。 | $a \vee b = \sup\{a, b\}$ | [[Lattice]], [[Meet Operation]] |
| **Meet Operation** | Geometry | 束における下限演算。二つの要素の最大下界を求める。 | $a \wedge b = \inf\{a, b\}$ | [[Lattice]], [[Join Operation]] |
| **Complete Lattice** | Geometry | 任意の部分集合に対して上限と下限が存在する束。無限集合にも適用可能。 | $(L, \leq)$ where $\forall S \subseteq L, \exists \sup S, \inf S$ | [[Lattice]] |
| **Distributive Lattice** | Geometry | join と meet が分配法則を満たす束。論理演算との対応がある。 | $a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge c)$ | [[Lattice]], [[Boolean Algebra]] |
| **Boolean Algebra** | Geometry | 補元を持つ分配束。論理演算の代数構造を提供。 | $(B, \vee, \wedge, \neg, 0, 1)$ | [[Distributive Lattice]] |
| **Galois Connection** | Geometry | 二つの半順序集合間の特別な対応関係。抽象化と具象化の関係を表現。 | $(f, g): P \leftrightarrows Q$ where $f \dashv g$ | [[Partial Order]] |
| **Fixed Point** | Geometry | 関数における不動点。束上の単調関数の最小不動点などに用いる。 | $x = f(x)$ | [[Lattice]], [[Monotonic Function]] |
| **Monotonic Function** | Geometry | 順序を保存する関数。束の構造を維持しながら変換を行う。 | $f: L_1 \to L_2$ where $x \leq y \implies f(x) \leq f(y)$ | [[Partial Order]], [[Fixed Point]] |
| **Chain** | Geometry | 全順序を持つ部分集合。要素が一列に並ぶ構造。 | $C \subseteq L$ where $\forall x, y \in C, x \leq y \lor y \leq x$ | [[Total Order]] |
| **Antichain** | Geometry | 比較不能な要素のみからなる部分集合。独立な要素の集合。 | $A \subseteq L$ where $\forall x, y \in A, x \neq y \implies x \not\leq y \land y \not\leq x$ | [[Partial Order]] |