# Phase4.5 Review Response Prompt

COBOL構造解析研究室\
Migration Geometry -- Phase4.5 Review Fix Execution Prompt

Date: 2026-03-05

------------------------------------------------------------------------

# 目的

このプロンプトは **Phase4.5 Geometry Formalization
文書群のレビュー指摘対応**を実施するための実行プロンプトです。

対象文書

09_Guarantee_Axis_Theory.md\
10_Guarantee_Metric_Space.md\
11_Guarantee_Topology.md\
12_Migration_Path_Geometry.md\
13_Discrete_Continuous_Relaxation.md\
14_Migration_Topology.md\
15_Migration_Geometry_Formalization.md

レビューで指摘された理論強化ポイントを反映し、 Migration Geometry を
**より厳密な数学理論として整備**してください。

------------------------------------------------------------------------

# AIの役割

あなたは

**構造理論研究者AI**

として振る舞います。

目的

Migration Geometry を

**数学的移行理論 (Migration Theory)**

として完成度を高めることです。

実装ではなく

-   理論整合性
-   数学構造
-   構造抽象
-   定義の明確化

を優先してください。

------------------------------------------------------------------------

# 修正事項

以下の3つのレビュー対応を必ず実施してください。

------------------------------------------------------------------------

# 1 Guarantee Space のトポロジー明示

Guarantee Space

    GS = [0,1]^n

は

    R^n の部分集合

であるため

**Euclidean Topology を継承する**ことを明示してください。

追加内容例

    GS inherits the Euclidean topology from R^n.

追加対象

    11_Guarantee_Topology.md

------------------------------------------------------------------------

# 2 Risk Density / Cost Field の導入

Migration Path のリスクを

    Risk(P) = ∫ d_w(P(t), Ideal) dt

としているが、これを

**Risk Density (Cost Field)**

として説明を追加してください。

追加概念

  Concept        Meaning
  -------------- --------------------
  Risk Density   局所的移行リスク
  Cost Field     空間上のリスク分布
  Gradient       リスク増加方向

例

    Risk(P) = ∫ cost(P(t)) dt

追加対象

    12_Migration_Path_Geometry.md

------------------------------------------------------------------------

# 3 Axis Dependency の追加

Guarantee Axis は完全独立ではない。

例

  Dependency            Explanation
  --------------------- ------------------------------
  State → Data          状態はデータに依存
  Transaction → State   トランザクションは状態に依存

これを

**Axis Dependency Graph**

として記述してください。

Mermaid 例

    flowchart TD
    Data --> State
    State --> Transaction
    Control --> State
    Interface --> Transaction

追加対象

    09_Guarantee_Axis_Theory.md

------------------------------------------------------------------------

# 出力要求

以下を生成してください

修正済み文書

    09_Guarantee_Axis_Theory.md
    11_Guarantee_Topology.md
    12_Migration_Path_Geometry.md

追加文書

    16_Guarantee_Axis_Dependency.md
    17_Migration_Risk_Field.md

------------------------------------------------------------------------

# 図の使用

Mermaid 図を使用して

-   Axis Dependency
-   Risk Field
-   Geometry Structure

を可視化してください。

------------------------------------------------------------------------

# 最終ゴール

Migration Geometry を

    Migration Design
    →
    Migration Geometry
    →
    Migration Theory

として完成させる。
