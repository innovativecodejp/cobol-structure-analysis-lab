# Glossary (Terminology Definitions)

COBOL構造解析・移行プロジェクト（COBOL Structure Analysis Lab）の用語定義集。
本研究において「用語」は、単なるラベルではなく、理論モデルの構成要素（Component of Theory）として厳密に定義される。

## 📁 File Structure

この用語集ディレクトリの構成ファイルは以下の通り。

- `README.md`: 本ファイル（用語集の概要と読み方ガイド）。
- `INDEX.md`: ディレクトリ全体の索引と構造説明。
- `GlossaryStructure.md`: ディレクトリ構造の詳細説明。
- `TermsAstIrCfgDfg.md`: 構文・構造解析層（AST, IR, CFG, DFG）の用語。
- `TermsGuaranteeSpace.md`: 保証空間・移行幾何学層（Guarantee Space, Geometry）の用語。

**トピック別用語ファイル:**
- `01_CoreConcepts.md`: プロジェクトの中核概念。
- `02_StructuralAnalysisLayer.md`: 構造解析層の概念。
- `03_GuaranteeTheory.md`: 保証理論。
- `04_GuaranteeSpaceTheory.md`: 保証空間理論。
- `05_GeometryOfMigration.md`: 移行幾何学。
- `06_StructuralModeling.md`: 構造モデリング。
- `07_MigrationDecisionModel.md`: 移行判断モデル。
- `08_ControlStructureModel.md`: 制御構造モデル。
- `09_DataStructureModel.md`: データ構造モデル。
- `10_LatticeOrderTheory.md`: 束論・順序理論。
- `11_DerivedMetrics.md`: 派生メトリクス。

## 📖 Reading Guide

用語集は以下のカテゴリ（Layer）に分類される。

1. **Syntax**: 構文要素。
2. **Structure**: 構造解析。
3. **Guarantee**: 保証・不変条件。
4. **Geometry**: 幾何学的モデル・空間。
5. **Decision**: 判断・リスク。

## 📝 Term Format

用語は以下の Markdown Table 形式で定義される。

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Term Name** | Syntax / Structure / Guarantee / Geometry / Decision | A clear, concise definition. | Formula (optional) | [[RelatedTerm]] |

### Columns
- **Term**: 用語名。
- **Layer**: 抽象レイヤ。
- **Definition**: 明確な定義文。
- **Formal Description**: 数学的または形式的な定義（該当する場合）。
- **Related Concepts**: 関連する用語へのリンク。

## Status

各用語定義の状態。

- `Defined`: 定義済み
- `Draft`: 草案
- `Placeholder`: 定義待ち（構造のみ存在）