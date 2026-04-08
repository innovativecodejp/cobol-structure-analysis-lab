# Glossary 4. Guarantee Space Theory

This document defines the mathematical spaces used to model guarantees.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Guarantee Space** | Geometry | システムが取りうるすべての保証状態の集合。連続近似としては $n$次元超立方体、離散的には束（Lattice）として扱われる。 | $GS = [0,1]^n$ (Continuous) or Lattice (Discrete) | [[Migration Geometry]], [[Guarantee Vector]] |
| **Guarantee Dimension** | Geometry | 保証空間を構成する独立した（または準独立した）評価軸。Control, Data, State, Transaction, Interface など。 | $g_i \in \{ g_{ctrl}, g_{data}, g_{state}, g_{txn}, g_{if} \}$ | [[Guarantee Vector]], [[Guarantee Axis]] |
| **Guarantee Vector** | Geometry | 保証空間内の特定の点を表すベクトル。各次元の保証レベルを成分とする。 | $\vec{g} = (g_1, g_2, \ldots, g_n) \in GS$ | [[Guarantee Space]], [[Guarantee Dimension]] |
| **Guarantee Axis** | Geometry | 保証空間の各次元を表す軸。特定の保証観点（制御、データ、状態など）に対応。 | $axis_i: \text{保証観点}_i$ | [[Guarantee Dimension]] |
| **Dependent Guarantee Space** | Geometry | 保証次元間の依存関係（例: Data保証なしにState保証は成立しない）を考慮し、到達不可能な状態を除外した空間。 | $\mathcal{G}_{dep} = \{ S \in \mathcal{G} \mid S \text{ satisfies dependencies} \}$ | [[Guarantee Space]], [[Structural Dependency]] |
| **Weighted Guarantee Space** | Geometry | 各保証次元に、その重要度や達成コストに基づく「重み」を付与した空間。 | $(GS, d_w)$ where $d_w$ uses weights $w_i$ | [[Guarantee Metric]] |
| **Guarantee Metric** | Geometry | 保証空間上の2点間の距離を定義する関数。 | $d(S_1, S_2) = \| S_1 - S_2 \|_w$, $d: GS \times GS \to \mathbb{R}_{\geq 0}$ | [[Migration Distance]], [[Weighted Guarantee Space]] |
| **Guarantee Lattice** | Geometry | 保証の包含関係による束構造。上限（join）と下限（meet）を持つ半順序集合。 | $(G, \leq, \vee, \wedge)$ | [[Guarantee Order]], [[Lattice Theory]] |
| **Guarantee Topology** | Geometry | 保証空間上の位相構造。近傍、開集合、閉集合などを定義。 | $(GS, \mathcal{T})$ where $\mathcal{T}$ is topology | [[Guarantee Space]] |