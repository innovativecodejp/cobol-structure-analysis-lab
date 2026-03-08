
# research-log Mermaid Concept Image 追加タスク（27ログ対応完全版）

目的
既存の research-log に Mermaid による Concept Image を追加する。
既存の研究内容は変更せず、各ログの理論構造を可視化する。

重要：
この作業は「研究ログの可視化」であり、研究内容の変更ではない。

---

# 絶対ルール

以下を厳守すること。

1. 既存文章は一切変更しない
2. 見出し構造を変更しない
3. 既存のMermaid図がある場合は変更しない
4. Concept Image セクションのみ追加する
5. 図は Mermaid のみ使用する
6. 外部画像は使用しない

---

# 挿入位置

Concept Image セクションが無い場合

ファイルの末尾に以下を追加する

## Concept Image

```mermaid
(ここに指定されたMermaid図)
```

---

# Mermaid図仕様

各ログのテーマに応じて以下の図を使用する。

---------------------------------------
AST研究ログ
---------------------------------------

対象
2026-02-19_AST_ScopeDefinition.md
2026-02-19_AST_ScopeFormalization.md

```mermaid
flowchart LR
    Source[COBOL Source]
    Source --> CST[CST]
    CST --> AST[AST: Syntax Layer]
    AST --> IR[IR: Semantic Layer]
    IR --> CFG[CFG]
    IR --> DFG[DFG]
```

---------------------------------------
AST Node構造
---------------------------------------

対象
2026-02-20_AST_NodeTaxonomy.md

```mermaid
flowchart TB
    Program --> Division
    Division --> DataDivision
    Division --> ProcedureDivision
    DataDivision --> DataItem
    ProcedureDivision --> Section
    ProcedureDivision --> Paragraph
    Paragraph --> Statement
```

---------------------------------------
AST 粒度ポリシー
---------------------------------------

対象
2026-02-21_AST_GranularityPolicy.md

```mermaid
flowchart TB
    Statement --> Assign
    Statement --> Compute
    Statement --> Branch
    Statement --> Loop
    Statement --> IO
    Statement --> Call

    Assign -.Lowering.-> IR
    Compute -.Lowering.-> IR
```

---------------------------------------
Guarantee Unit
---------------------------------------

対象
2026-03-01_01_GuaranteeUnitDefinition.md

```mermaid
flowchart TD
    L1[Statement]
    L2[Control Block]
    L3[Routine]
    L4[File IO]
    L5[Business Function]

    L1 --> L2 --> L3 --> L4 --> L5
```

---------------------------------------
Formal Guarantee
---------------------------------------

対象
2026-03-02_01_FormalGuaranteeFormalization.md

```mermaid
flowchart LR
    AST --> Guarantee
    CFG --> Guarantee
    DFG --> Guarantee

    Guarantee --> VerifiedTransformation
```

---------------------------------------
Guarantee Space
---------------------------------------

対象
2026-03-03_01_GuaranteeSpaceFormalization.md
2026-03-04_01_DependentGuaranteeSpaceFormalization.md
2026-03-04_02_WeightedGuaranteeSpaceTheory.md

```mermaid
graph TD
    G1[Guarantee A]
    G2[Guarantee B]
    G3[Guarantee C]

    G1 --> G2
    G2 --> G3
```

---------------------------------------
Metric / Geometry
---------------------------------------

対象
2026-03-04_03_GuaranteeMetricTheory.md
2026-03-04_04_GuaranteeSpaceGeometryTheory.md
2026-03-04_06_GuaranteeSpaceGeometryRevision.md
2026-03-04_07_GuaranteeSpaceGeometryPart2.md

```mermaid
graph LR
    G1((State1))
    G2((State2))
    G3((State3))

    G1 --- G2
    G2 --- G3
```

---------------------------------------
Lattice
---------------------------------------

対象
2026-03-04_08_LatticeStructure.md
2026-03-04_08_LatticeStructureRefinement.md

```mermaid
graph TD
    Bottom((⊥))
    A((A))
    B((B))
    Top((⊤))

    Bottom --> A
    Bottom --> B
    A --> Top
    B --> Top
```

---------------------------------------
Transition Graph
---------------------------------------

対象
2026-03-04_09_GuaranteeTransitionGraph.md
2026-03-04_09_GuaranteeTransitionGraphRefinement.md

```mermaid
flowchart LR
    S[State0]
    G1[Guarantee1]
    G2[Guarantee2]
    T[Target]

    S --> G1 --> G2 --> T
```

---------------------------------------
Migration Path
---------------------------------------

対象
2026-03-04_10_MigrationPathLinearExtension.md
2026-03-04_10_MigrationPathTheory.md
2026-03-04_10_MigrationPathTheoryRefinement.md

```mermaid
flowchart LR
    Start --> Step1
    Step1 --> Step2
    Step2 --> Target
```

---------------------------------------
Migration Complexity
---------------------------------------

対象
2026-03-05_11_MigrationComplexity.md
2026-03-05_11_MigrationComplexityRevision.md

```mermaid
flowchart TD
    Guarantees --> Dependencies
    Dependencies --> Complexity
```

---------------------------------------
Guarantee Dynamics
---------------------------------------

対象
2026-03-05_12_GuaranteeDynamics.md
2026-03-05_12_GuaranteeDynamicsRevision.md

```mermaid
flowchart TD
    State1 --> State2
    State2 --> State3
    State3 --> StableState
```

---------------------------------------
Optimization Landscape
---------------------------------------

対象
2026-03-05_13_OptimizationLandscape.md
2026-03-05_13_OptimizationLandscapeRevision.md

```mermaid
flowchart LR
    StateA --> StateB
    StateB --> StateC
    StateC --> Optimal
```

---------------------------------------
Migration Geometry
---------------------------------------

対象
2026-03-08_01_MigrationGeometryConstruction.md

```mermaid
graph TD
    GS[Guarantee Space]
    Metric[Distance]
    Safe[Safe Region]

    GS --> Metric
    GS --> Safe
```

---

# 対象ファイル（27件）

2026-02-19_AST_ScopeDefinition.md
2026-02-19_AST_ScopeFormalization.md
2026-02-20_AST_NodeTaxonomy.md
2026-02-21_AST_GranularityPolicy.md
2026-03-01_01_GuaranteeUnitDefinition.md
2026-03-02_01_FormalGuaranteeFormalization.md
2026-03-03_01_GuaranteeSpaceFormalization.md
2026-03-04_01_DependentGuaranteeSpaceFormalization.md
2026-03-04_02_WeightedGuaranteeSpaceTheory.md
2026-03-04_03_GuaranteeMetricTheory.md
2026-03-04_04_GuaranteeSpaceGeometryTheory.md
2026-03-04_06_GuaranteeSpaceGeometryRevision.md
2026-03-04_07_GuaranteeSpaceGeometryPart2.md
2026-03-04_08_LatticeStructure.md
2026-03-04_08_LatticeStructureRefinement.md
2026-03-04_09_GuaranteeTransitionGraph.md
2026-03-04_09_GuaranteeTransitionGraphRefinement.md
2026-03-04_10_MigrationPathLinearExtension.md
2026-03-04_10_MigrationPathTheory.md
2026-03-04_10_MigrationPathTheoryRefinement.md
2026-03-05_11_MigrationComplexity.md
2026-03-05_11_MigrationComplexityRevision.md
2026-03-05_12_GuaranteeDynamics.md
2026-03-05_12_GuaranteeDynamicsRevision.md
2026-03-05_13_OptimizationLandscape.md
2026-03-05_13_OptimizationLandscapeRevision.md
2026-03-08_01_MigrationGeometryConstruction.md

---

# 出力ルール

作業完了後は

変更したファイル一覧

のみ表示する。
