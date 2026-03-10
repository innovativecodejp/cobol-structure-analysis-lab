# Glossary 4. Guarantee Space Theory

This document defines the mathematical spaces used to model guarantees.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Guarantee Space** | Theory / Geometry | システムが取りうるすべての保証状態の集合。連続近似としては $n$次元超立方体、離散的には束（Lattice）として扱われる。 | $GS = [0,1]^n$ (Continuous)<br>or Lattice (Discrete) | [[Migration Geometry]] |
| **Guarantee Dimension** | Theory / Geometry | 保証空間を構成する独立した（または準独立した）評価軸。Control, Data, State, Transaction, Interface など。 | $g_i \in \{ g_{ctrl}, g_{data}, \dots \}$ | [[Guarantee Vector]] |
| **Dependent Guarantee Space** | Theory / Geometry | 保証次元間の依存関係（例: Data保証なしにState保証は成立しない）を考慮し、到達不可能な状態を除外した空間。 | $\mathcal{G}_{dep} = \{ S \in \mathcal{G} \mid S \text{ satisfies dependencies} \}$ | [[Guarantee Space]], [[Structural Dependency]] |
| **Weighted Guarantee Space** | Theory / Geometry | 各保証次元に、その重要度や達成コストに基づく「重み」を付与した空間。 | $(GS, d_w)$ where $d_w$ uses weights $w_i$ | [[Guarantee Metric]] |
| **Guarantee Metric** | Theory / Geometry | 保証空間上の2点間の距離を定義する関数。 | $d(S_1, S_2) = \| S_1 - S_2 \|_w$<br>$d: GS \times GS \to \mathbb{R}_{\ge 0}$ | [[Migration Distance]] |
