# Glossary Directory Structure

`docs/90_glossary/` ディレクトリの構造と各ファイル・ディレクトリの役割について説明します。

## 📁 File Structure

```text
docs/90_glossary/
├── README.md                       # 用語集の概要とフォーマット定義
├── GlossaryStructure.md            # 本ファイル：ディレクトリ構造の説明
├── TermsAstIrCfgDfg.md             # 構文・構造解析層の用語定義 (AST, IR, CFG, DFG)
├── TermsGuaranteeSpace.md          # 保証空間・移行幾何学層の用語定義
│
├── 00_Reading_Guide.md             # 用語集の読み方ガイド
├── 01_Core_Concepts.md             # プロジェクトの中核概念定義
├── 02_Structural_Analysis_Layer.md # 構造解析レイヤーの用語
├── 03_Guarantee_Theory.md          # 保証理論の用語
├── 04_Guarantee_Space_Theory.md    # 保証空間理論の用語
├── 05_Geometry_of_Migration.md     # 移行幾何学の用語 (旧 05_GeometryOfMigration.md)
├── 06_Structural_Modeling.md       # 構造モデリングの用語
├── 07_Migration_Decision_Model.md  # 移行判断モデルの用語
├── 08_Control_Structure_Model.md   # 制御構造モデルの用語
├── 09_Data_Structure_Model.md      # データ構造モデルの用語
├── 10_Lattice_Order_Theory.md      # 束論・順序理論の用語
└── 11_Derived_Metrics.md           # 派生メトリクスの用語
```

## 📝 各ファイル・ディレクトリの説明

### 概要・ガイド
- **README.md**: 用語集全体のインデックスと、用語定義の記述フォーマット（Markdown Table形式）を定義しています。
- **GlossaryStructure.md**: このディレクトリの構成を解説したドキュメントです。
- **00_Reading_Guide.md**: 用語集の体系的な読み方、層（Layer）の概念について説明します。

### 集約定義ファイル (Aggregated Definitions)
特定の領域ごとの用語を一覧化したファイルです。
- **TermsAstIrCfgDfg.md**: Syntax/Structure層（AST, IR, CFG, DFGなど）に関する用語をまとめています。
- **TermsGuaranteeSpace.md**: Guarantee/Geometry層（保証空間、移行幾何学）に関する用語をまとめています。

### トピック別定義ファイル (Topic-based Definitions)
特定の理論トピックごとに詳細な定義を行うファイル群です。
- **01_Core_Concepts.md**: プロジェクト全体を貫く中核概念（Migration, Analysisなど）。
- **02_Structural_Analysis_Layer.md**: 静的解析、動的解析などの手法に関する用語。
- **03_Guarantee_Theory.md**: 「保証（Guarantee）」そのものの定義と性質。
- **04_Guarantee_Space_Theory.md**: 保証空間（Guarantee Space）の数学的構造。
- **05_Geometry_of_Migration.md**: 移行を幾何学的に捉えるための概念（距離、経路、コストなど）。
- **06_Structural_Modeling.md**: COBOLプログラムを構造化するためのモデリング概念。
- **07_Migration_Decision_Model.md**: 移行可否や戦略を決定するためのモデル。
- **08_Control_Structure_Model.md**: 制御フロー（Control Flow）に関連する詳細モデル。
- **09_Data_Structure_Model.md**: データフロー（Data Flow）に関連する詳細モデル。
- **10_Lattice_Order_Theory.md**: 保証レベルの半順序関係などを扱う数学的基盤。
- **11_Derived_Metrics.md**: 基礎概念から導出される定量的な指標。

---
※ 現在、ファイル名規則の統一（CamelCase vs Snake_Case）やディレクトリ構成の整理が進行中です。
