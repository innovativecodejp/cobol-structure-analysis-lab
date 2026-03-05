# Phase4 Review Response Prompt

COBOL構造解析研究室\
Migration Geometry -- Review Fix Execution Prompt

------------------------------------------------------------------------

# 目的

このプロンプトは **Phase4 Migration Geometry
文書群のレビュー指摘対応**を行うためのものです。

対象文書

01_Guarantee_Vector.md\
02_Guarantee_Space.md\
03_Migration_Distance.md\
04_Safe_Region.md\
05_Migration_Path.md\
06_Migration_Optimization.md\
07_Migration_Geometry.md\
08_Failure_Geometry.md

レビューで指摘された以下の重要改善を反映してください。

------------------------------------------------------------------------

# AIの役割

あなたは

**構造理論研究者AI**

として振る舞います。

目的

Migration Geometry 理論を

**より厳密な数学構造**

として強化することです。

実装コードではなく

**理論整合性・数学構造・研究完成度**

を最優先してください。

------------------------------------------------------------------------

# 改善事項

以下の3つを必ず実施してください。

------------------------------------------------------------------------

# 1 Guarantee Axis Theory の追加

Guarantee Vector の各次元に対して

**構造起源 (Structural Origin)**

を明示してください。

例

  Axis          Meaning                         Structural Origin
  ------------- ------------------------------- -------------------
  Control       Control Flow Preservation       CFG
  Data          Data Flow Preservation          DFG
  State         State Transition Preservation   State Machine
  Transaction   Transaction Boundary            Transaction Model
  Interface     External Interface              I/O Boundary

この内容を

    01_Guarantee_Vector.md

に追加してください。

------------------------------------------------------------------------

# 2 Weighted Distance の導入

Migration Distance に

**重み付き距離 (Weighted Metric)**

を追加してください。

例

Euclidean

$$
d(G,Ideal)=\sqrt{\sum (1-g_i)^2}
$$

Weighted

$$
d_w(G,Ideal)=\sqrt{\sum w_i(1-g_i)^2}
$$

ここで

    w_i

は保証の重要度を表す。

例

  Axis          Weight
  ------------- --------
  Control       1.0
  Data          1.2
  State         1.5
  Transaction   1.6
  Interface     0.8

この説明を

    03_Migration_Distance.md

に追加してください。

------------------------------------------------------------------------

# 3 Discrete → Continuous 理論の明確化

Phase2 / Phase3 と Phase4 の関係を

**離散 → 連続緩和 (continuous relaxation)**

として説明してください。

例

Phase2

    Guarantee Lattice

Phase3

    Dependency Constrained Ideals

Phase4

    Continuous Guarantee Space
    GS = [0,1]^n

これは

    Discrete Structure
    →
    Continuous Geometry

である。

この節を

    02_Guarantee_Space.md

に追加してください。

------------------------------------------------------------------------

# 出力要求

以下を生成してください

1 修正済み文書

    01_Guarantee_Vector.md
    02_Guarantee_Space.md
    03_Migration_Distance.md

2 追加文書

    09_Guarantee_Axis_Theory.md

------------------------------------------------------------------------

# 図の使用

Mermaid 図を使用して

Guarantee Axis と Geometry 構造を可視化してください。

例

    flowchart TD
    CFG --> ControlAxis
    DFG --> DataAxis
    StateMachine --> StateAxis
    TransactionModel --> TransactionAxis
    IOBoundary --> InterfaceAxis

------------------------------------------------------------------------

# 最終ゴール

Migration Geometry を

**数学的移行理論**

として強化する。

    Migration Design
    →
    Migration Geometry
    →
    Migration Theory
