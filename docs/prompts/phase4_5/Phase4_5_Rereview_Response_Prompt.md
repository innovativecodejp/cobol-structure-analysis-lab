# Phase4.5 Re‑Review Response Prompt

COBOL構造解析研究室\
Migration Geometry -- Phase4.5 Re‑Review Fix Prompt

Date: 2026-03-05

------------------------------------------------------------------------

# 目的

このプロンプトは **Phase4.5 Geometry Formalization
文書群の再レビュー対応**を実施するための実行プロンプトです。

対象文書

09_Guarantee_Axis_Theory.md\
10_Guarantee_Metric_Space.md\
11_Guarantee_Topology.md\
12_Migration_Path_Geometry.md\
13_Discrete_Continuous_Relaxation.md\
14_Migration_Topology.md\
15_Migration_Geometry_Formalization.md\
16_Guarantee_Axis_Dependency.md\
17_Migration_Risk_Field.md

再レビューで指摘された **理論的一貫性の強化点**を反映し、 Migration
Geometry をより厳密な数学モデルとして整備する。

------------------------------------------------------------------------

# AIの役割

あなたは

**構造理論研究者AI**

として振る舞う。

重点

-   数学的一貫性
-   定義の厳密化
-   Geometry と Program Structure の対応維持
-   図式化

実装ではなく

**理論モデルの整合性**

を優先する。

------------------------------------------------------------------------

# 再レビュー対応タスク

以下の修正を実施する。

------------------------------------------------------------------------

# 1 Document Map 更新

15_Migration_Geometry_Formalization.md の Document Map に

    16_Guarantee_Axis_Dependency.md
    17_Migration_Risk_Field.md

を追加し、Phase4.5 の成果物として統合する。

------------------------------------------------------------------------

# 2 Metric--Topology 接続明示

10_Guarantee_Metric_Space.md に以下を追加する。

    The weighted Euclidean metric d_w induces the same topology
    as the standard Euclidean metric on R^n.
    Therefore the metric topology on GS is consistent
    with the subspace topology introduced in Guarantee Topology.

これにより

Metric Space → Topology

の理論接続を明確化する。

------------------------------------------------------------------------

# 3 Risk Field の一般性の明示

12_Migration_Path_Geometry.md と 17_Migration_Risk_Field.md
に以下を追加する。

    The cost function may be any non‑negative scalar field
    cost : GS → R≥0.

    In Phase4.5 we use

    cost(G) = d_w(G, Ideal)

    as a simple reference model.

これにより

Risk ≠ Distance

の一般性を保持する。

------------------------------------------------------------------------

# 4 Dependency Constraint の追加

16_Guarantee_Axis_Dependency.md に以下の説明を追加する。

    Dependency constraints restrict admissible migration paths.

    For example, if Data → State,
    migration operations affecting State should not violate
    Data guarantees.

また Path Optimization に

    Dependency constraints

が存在することを記述する。

------------------------------------------------------------------------

# 5 Gradient 定義の明示

17_Migration_Risk_Field.md に以下を追加する。

    Since GS ⊂ R^n,
    the gradient ∇cost is defined with respect to
    the coordinate system inherited from R^n.

------------------------------------------------------------------------

# 出力要求

以下の文書を **修正版として再生成する**

    10_Guarantee_Metric_Space.md
    12_Migration_Path_Geometry.md
    15_Migration_Geometry_Formalization.md
    16_Guarantee_Axis_Dependency.md
    17_Migration_Risk_Field.md

------------------------------------------------------------------------

# 図の使用

Mermaid 図で以下を可視化する

-   Axis Dependency
-   Risk Field
-   Migration Geometry structure

------------------------------------------------------------------------

# 最終ゴール

Phase4.5 を

    Metric Space
    +
    Topology
    +
    Risk Field
    +
    Dependency Structure

として統合し

**Migration Geometry の数学的基盤を完成させる。**
