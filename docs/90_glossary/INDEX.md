# `90_glossary`

COBOL構造解析研究室の用語定義集です。

本研究において「用語」は、単なるラベルではなく、理論モデルの構成要素（Component of Theory）として厳密に定義されます。

## Documents

### 概要・ガイド
- `README.md` — 用語集の概要、読み方ガイド、フォーマット定義
- `GlossaryStructure.md` — ディレクトリ構造の説明

### 集約定義ファイル
- `TermsAstIrCfgDfg.md` — 構文・構造解析層（AST, IR, CFG, DFG）の用語
- `TermsGuaranteeSpace.md` — 保証空間・移行幾何学層の用語

### トピック別定義ファイル
- `01_CoreConcepts.md` — 中核概念（Migration, Guarantee, Structural Analysis）
- `02_StructuralAnalysisLayer.md` — 構造解析層（AST, IR, CFG, DFG の概要）
- `03_GuaranteeTheory.md` — 保証理論（Guarantee, Guarantee Unit, Composition）
- `04_GuaranteeSpaceTheory.md` — 保証空間理論（Guarantee Space, Dimension, Metric）
- `05_GeometryOfMigration.md` — 移行幾何学（Path, Distance, Region）
- `06_StructuralModeling.md` — 構造モデリング（Scope, Boundary, Granularity）
- `07_MigrationDecisionModel.md` — 移行判断モデル（Decision, Feasibility, Risk）
- `08_ControlStructureModel.md` — 制御構造モデル（CFG, Basic Block, Dominance, Loop）
- `09_DataStructureModel.md` — データ構造モデル（DFG, Define/Use, Reach, Closure）
- `10_LatticeOrderTheory.md` — 束論・順序理論（Lattice, Order, Join/Meet）
- `11_DerivedMetrics.md` — 派生メトリクス（複雑度、密度、結合度）

## Layer Structure

用語は以下の抽象層（Layer）に分類されます。

| Layer | 内容 | 主要概念 |
|-------|------|----------|
| **Syntax** | 構文要素 | AST, Token, Parse Tree |
| **Structure** | 構造解析 | IR, CFG, DFG, Basic Block, Define/Use |
| **Guarantee** | 保証・不変条件 | Guarantee Unit, Composition, Equivalence |
| **Geometry** | 幾何学的モデル・空間 | Guarantee Space, Migration Path, Distance |
| **Decision** | 判断・リスク | Migration Decision, Feasibility, Risk Pattern |

## Connection to Research Phases

| Phase | ディレクトリ | 主要用語 |
|-------|-------------|----------|
| Phase 1–7 | `10_ast`, `50_guarantee`, `60_scope`, `60_decision`, `70_cases` | AST, Guarantee, Scope, Decision, Cases |
| Phase 8 | `20_ir` | IR, IR Unit, Control/Data/Boundary Abstraction |
| Phase 9 | `30_cfg` | CFG, Basic Block, Dominance, Reachability, Loop |
| Phase 10 | `40_dfg` | DFG, Define/Use, Reaching Definition, Impact Closure |

## Term Format

用語は以下の Markdown Table 形式で定義されます。

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Term Name** | Syntax / Structure / Guarantee / Geometry / Decision | 明確な定義文 | 数式（任意） | [[RelatedTerm]] |

## Status

- `Defined` — 定義済み
- `Draft` — 草案
- `Placeholder` — 定義待ち（構造のみ存在）
