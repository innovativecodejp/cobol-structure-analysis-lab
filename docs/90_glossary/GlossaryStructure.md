# Glossary Directory Structure

`docs/90_glossary/` ディレクトリの構造と各ファイル・ディレクトリの役割について説明します。

## 📁 File Structure

```text
docs/90_glossary/
├── README.md                       # 用語集の概要とフォーマット定義
├── INDEX.md                        # ディレクトリ全体の索引と構造説明
├── GlossaryStructure.md            # 本ファイル：ディレクトリ構造の説明
├── TermsAstIrCfgDfg.md             # 構文・構造解析層の用語定義 (AST, IR, CFG, DFG)
├── TermsGuaranteeSpace.md          # 保証空間・移行幾何学層の用語定義
│
├── 01_CoreConcepts.md              # プロジェクトの中核概念定義
├── 02_StructuralAnalysisLayer.md   # 構造解析レイヤーの用語
├── 03_GuaranteeTheory.md           # 保証理論の用語
├── 04_GuaranteeSpaceTheory.md      # 保証空間理論の用語
├── 05_GeometryOfMigration.md       # 移行幾何学の用語
├── 06_StructuralModeling.md        # 構造モデリングの用語
├── 07_MigrationDecisionModel.md    # 移行判断モデルの用語
├── 08_ControlStructureModel.md     # 制御構造モデルの用語
├── 09_DataStructureModel.md        # データ構造モデルの用語
├── 10_LatticeOrderTheory.md        # 束論・順序理論の用語
└── 11_DerivedMetrics.md            # 派生メトリクスの用語
```

## 📝 各ファイル・ディレクトリの説明

### 概要・ガイド
- **README.md**: 用語集全体のインデックスと、用語定義の記述フォーマット（Markdown Table形式）を定義しています。
- **INDEX.md**: ディレクトリ全体の索引、抽象層の説明、研究フェーズとの対応を提供します。
- **GlossaryStructure.md**: このディレクトリの構成を解説したドキュメントです。

### 集約定義ファイル (Aggregated Definitions)
特定の領域ごとの用語を一覧化したファイルです。
- **TermsAstIrCfgDfg.md**: Syntax/Structure層（AST, IR, CFG, DFGなど）に関する用語をまとめています。
- **TermsGuaranteeSpace.md**: Guarantee/Geometry層（保証空間、移行幾何学）に関する用語をまとめています。

### トピック別定義ファイル (Topic-based Definitions)
特定の理論トピックごとに詳細な定義を行うファイル群です。
- **01_CoreConcepts.md**: プロジェクト全体を貫く中核概念（Migration, Analysis, Legacy Systemなど）。
- **02_StructuralAnalysisLayer.md**: 静的解析の手法とレイヤー構造に関する用語。
- **03_GuaranteeTheory.md**: 「保証（Guarantee）」そのものの定義と性質。
- **04_GuaranteeSpaceTheory.md**: 保証空間（Guarantee Space）の数学的構造。
- **05_GeometryOfMigration.md**: 移行を幾何学的に捉えるための概念（距離、経路、コストなど）。
- **06_StructuralModeling.md**: COBOLプログラムを構造化するためのモデリング概念。
- **07_MigrationDecisionModel.md**: 移行可否や戦略を決定するためのモデル。
- **08_ControlStructureModel.md**: 制御フロー（Control Flow）に関連する詳細モデル。
- **09_DataStructureModel.md**: データフロー（Data Flow）に関連する詳細モデル。
- **10_LatticeOrderTheory.md**: 保証レベルの半順序関係などを扱う数学的基盤。
- **11_DerivedMetrics.md**: 基礎概念から導出される定量的な指標。

## 📊 Layer Classification

用語は以下の抽象層（Layer）で分類されます：

| Layer | 説明 | 主要ファイル |
|-------|------|-------------|
| **Syntax** | 構文要素 | 02_StructuralAnalysisLayer.md, TermsAstIrCfgDfg.md |
| **Structure** | 構造解析 | 02, 06, 08, 09_*.md |
| **Guarantee** | 保証・不変条件 | 03, 04_*.md |
| **Geometry** | 幾何学的モデル・空間 | 04, 05_*.md, TermsGuaranteeSpace.md |
| **Decision** | 判断・リスク | 07, 11_*.md |

## 🔗 Research Phase Mapping

| Research Phase | 対応ファイル | 主要概念 |
|---------------|-------------|----------|
| **Phase 1-7** | 01, 03, 06, 07_*.md | Core concepts, Guarantee, Scope, Decision |
| **Phase 8 (IR)** | 02_*, TermsAstIrCfgDfg.md | IR, IR Unit, Abstraction |
| **Phase 9 (CFG)** | 08_*, TermsAstIrCfgDfg.md | CFG, Basic Block, Control Flow |
| **Phase 10 (DFG)** | 09_*, TermsAstIrCfgDfg.md | DFG, Define-Use, Data Flow |
| **Geometry Extension** | 04, 05_*, TermsGuaranteeSpace.md | Migration Geometry, Safe Region |

## 📋 Term Format Standard

すべての用語は統一された Markdown Table 形式で定義されます：

```markdown
| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Term Name** | Layer | 明確な定義文 | 数式（任意） | [[RelatedTerm]] |
```

### Column Details
- **Term**: 用語名（太字で表記）
- **Layer**: 抽象レイヤの分類
- **Definition**: 明確で簡潔な定義文
- **Formal Description**: 数学的または形式的記述（該当する場合）
- **Related Concepts**: 関連用語への内部リンク

## 🚀 Usage Guidelines

1. **用語検索**: `INDEX.md` から適切なファイルを特定
2. **層別参照**: Layer で分類して関連用語を探索
3. **相互参照**: Related Concepts で概念間の関係を追跡
4. **フェーズ対応**: 研究フェーズに対応するファイルで詳細確認

---

*本用語集は COBOL Structure Analysis Lab の研究成果を理論的に整理・体系化するためのリファレンスです。*