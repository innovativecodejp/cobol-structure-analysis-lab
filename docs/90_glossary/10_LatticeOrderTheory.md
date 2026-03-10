# Glossary 10. Lattice / Order Theory

This document defines mathematical concepts from order theory used in the research.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Guarantee Lattice** | Theory | Guarantee Space が形成する束（Lattice）構造。任意の2つの保証状態に対して、上限（Join）と下限（Meet）が存在する半順序集合。 | - | [[Guarantee Order]] |
| **Partial Order** | Theory | 反射律、反対称律、推移律を満たす二項関係。保証の「強さ」を比較するために用いられる。 | $\le$ | [[Guarantee Lattice]] |
| **Meet** | Theory | 2つの要素の最大下界（Greatest Lower Bound）。論理積（AND）や共通部分に相当。「共通する保証」。 | $\land$ | [[Guarantee Lattice]] |
| **Join** | Theory | 2つの要素の最小上界（Least Upper Bound）。論理和（OR）や合併に相当。「合併した保証」。 | $\lor$ | [[Guarantee Lattice]] |
