# Project Directory Structure (AI Research Optimized)

## Overview
本書は、現在のリポジトリ構造を基礎として、AI研究向けに再整理した **Cursor研究ディレクトリ構造の完全版** を定義する。

対象とする研究領域:

- AST / IR / CFG / DFG の構造研究
- Migration Guarantee Theory
- Guarantee Space
- Migration Geometry
- 研究ログ駆動の理論深化
- Mermaid 図を用いた構造可視化
- Prompt 駆動の AI 研究ワークフロー

---

# 1. Current Structure (As of 2026-03-10)

現在のディレクトリ構造は以下の通りである。

```text
D:\DEV\COBOL-STRUCTURE-ANALYSIS-LAB
│  .gitignore
│  README.md
│
├─.vscode/
│      tasks.json
│
├─config/                           # コンポーネントカタログなどの設定ファイル
│      component-catalog.json
│      README.md
│
├─diagrams/                         # ダイアグラム定義ファイル置き場
│  └─mermaid/
│          .gitkeep
│
├─docs/                             # ドキュメント体系のルート
│  ├─00_project/                    # プロジェクト管理・全体方針文書
│  │      CursorResearchDirectoryStructure.md
│  │      ProjectCharter.md
│  │      Roadmap.md
│  │      GlossaryStructurePlan.md
│  │      CursorAIResearchArchitecture.md
│  │
│  ├─10_ast/                        # AST (抽象構文木) 関連の理論・設計
│  │      01_AST-Scope-Definition.md
│  │      02_AST-Granularity-Policy.md
│  │      03_AST-Node-Taxonomy.md
│  │
│  ├─20_ir/                         # IR (中間表現) 関連（プレースホルダー）
│  │      .gitkeep
│  │
│  ├─30_cfg/                        # CFG (制御フローグラフ) 関連（プレースホルダー）
│  │      .gitkeep
│  │
│  ├─40_dfg/                        # DFG (データフローグラフ) 関連（プレースホルダー）
│  │      .gitkeep
│  │
│  ├─50_guarantee/                  # 保証理論 (Guarantee Theory)
│  │      01_Guarantee-Unit-Definition.md
│  │      02_Formal-Definition-of-Guarantee.md
│  │      ... (その他保証理論関連文書)
│  │
│  ├─60_decision/                   # 意思決定モデル（プレースホルダー）
│  │      .gitkeep
│  │
│  ├─60_scope/                      # 移行スコープ定義
│  │      README.md
│  │
│  ├─70_cases/                      # ケーススタディ
│  │      README.md
│  │
│  ├─70_planning/                   # 計画文書（プレースホルダー）
│  │      .gitkeep
│  │
│  ├─80_geometry/                   # 移行幾何学 (Migration Geometry)
│  │      09_Guarantee_Axis_Theory.md
│  │      10_Guarantee_Metric_Space.md
│  │      ... (その他幾何学関連文書)
│  │
│  ├─80_reviews/                    # レビュー記録
│  │      README.md
│  │
│  ├─90_glossary/                   # 用語集
│  │      00_Reading_Guide.md
│  │      01_Core_Concepts.md
│  │      ... (その他用語定義ファイル)
│  │      GlossaryStructure.md
│  │      README.md
│  │      TermsAstIrCfgDfg.md
│  │      TermsGuaranteeSpace.md
│  │
│  └─prompts/                       # AIプロンプト資産
│      ├─phase4_5/
│      ├─phase5/
│      └─research/
│
├─experiments/                      # 実験的なコードやプロトタイプ
│      README.md
│
├─log/                              # ログディレクトリ
│  ├─research-log/                  # 研究ログ（意思決定、理論構築の経緯）
│  │      2026-02-19_AST_ScopeDefinition.md
│  │      ... (日次ログ)
│  │      TEMPLATE.md
│  │
│  ├─review-log/                    # レビューログ
│  │      README.md
│  │      TEMPLATE.md
│  │
│  └─working-log/                   # 作業ログ（日々の作業メモ）
│          2026-02-18_01_ProjectStructureInitialization.md
│          ... (日次ログ)
│          TEMPLATE.md
│
├─outputs/                          # 外部公開用アウトプット
│      README.md
│
├─samples/                          # サンプルコード
│  └─cobol/
│          .gitkeep
│
├─temp/                             # 一時ファイル置き場
│      CobolStructureAnalysys.md
│      ...
│
└─tools/                            # ツール類
        .gitkeep
```

---

# 2. Recommended Complete Structure (Target)

推奨する完全版構造は以下である。現状との差分を含めて記述する。

```text
project-root
│
├─ README.md
├─ LICENSE
│
├─ docs/
│   ├─ 00_project/              # プロジェクト管理
│   │   ├─ ProjectCharter.md
│   │   ├─ ResearchRoadmap.md
│   │   ├─ PhasePlan.md
│   │   └─ Positioning.md
│   │
│   ├─ 10_ast/                  # AST (抽象構文木)
│   │   ├─ AstOverview.md
│   │   ├─ AstNodeDesign.md
│   │   ├─ AstNormalizationRules.md
│   │   └─ AstOpenIssues.md
│   │
│   ├─ 20_ir/                   # IR (中間表現)
│   │   ├─ IrOverview.md
│   │   ├─ IrSchema.md
│   │   ├─ IrMappingRules.md
│   │   └─ IrOpenIssues.md
│   │
│   ├─ 30_cfg/                  # CFG (制御フローグラフ)
│   │   ├─ CfgOverview.md
│   │   ├─ CfgConstructionRules.md
│   │   ├─ CfgPatterns.md
│   │   └─ CfgOpenIssues.md
│   │
│   ├─ 40_dfg/                  # DFG (データフローグラフ)
│   │   ├─ DfgOverview.md
│   │   ├─ DfgConstructionRules.md
│   │   ├─ DfgPatterns.md
│   │   └─ DfgOpenIssues.md
│   │
│   ├─ 50_guarantee/            # 保証理論 (Guarantee Theory)
│   │   ├─ GuaranteeTheoryOverview.md
│   │   ├─ GuaranteeSpace.md
│   │   ├─ GuaranteeOrder.md
│   │   ├─ GuaranteeEquivalence.md
│   │   ├─ MigrationGeometry.md
│   │   └─ GuaranteeOpenIssues.md
│   │
│   ├─ 60_scope/                # 移行スコープ定義
│   │   ├─ MigrationScopeDefinition.md
│   │   ├─ BoundaryDesign.md
│   │   ├─ ResponsibilityDecomposition.md
│   │   └─ StateTransitionRelation.md
│   │
│   ├─ 70_cases/                # ケーススタディ
│   │   ├─ CaseStudyIndex.md
│   │   ├─ VirtualProjectCases.md
│   │   ├─ FailurePatterns.md
│   │   └─ ComparisonNotes.md
│   │
│   ├─ 80_reviews/              # AIレビューログ・記録
│   │   ├─ ReviewPolicy.md
│   │   ├─ ResearchReviewLog.md
│   │   ├─ OpenQuestions.md
│   │   └─ DecisionRecords.md
│   │
│   ├─ 90_glossary/             # 用語集
│   │   ├─ Glossary.md
│   │   ├─ TermsAstIrCfgDfg.md
│   │   └─ TermsGuaranteeSpace.md
│   │
│   └─ prompts/                 # プロンプト資産
│       ├─ research/
│       │   ├─ exec/
│       │   ├─ review/
│       │   └─ refine/
│       ├─ diagrams/
│       ├─ publishing/
│       └─ templates/
│
├─ diagrams/
│   ├─ mermaid/                 # Mermaid図ソース
│   │   ├─ ast/
│   │   ├─ ir/
│   │   ├─ cfg/
│   │   ├─ dfg/
│   │   ├─ guarantee/
│   │   └─ scope/
│   ├─ exported/                # エクスポートされた画像
│   └─ assets/                  # その他のアセット
│
├─ log/
│   ├─ research-log/            # 研究ログ（決定事項・理論）
│   │   ├─ TEMPLATE.md
│   │   ├─ Governance.md
│   │   └─ 2026/
│   │       ├─ 2026-03-01.md
│   │       └─ 2026-03-02.md
│   │
│   ├─ working-log/             # 作業ログ（日次メモ）
│   │   ├─ TEMPLATE.md
│   │   ├─ Governance.md
│   │   └─ 2026/
│   │       ├─ 2026-03-01.md
│   │       └─ 2026-03-02.md
│   │
│   └─ review-log/              # レビュー結果ログ
│       ├─ TEMPLATE.md
│       └─ 2026/
│
├─ samples/                     # サンプルデータ
│   ├─ cobol/
│   ├─ ir/
│   ├─ cfg/
│   └─ dfg/
│
├─ experiments/                 # 実験・プロトタイプ
│   ├─ ast-prototypes/
│   ├─ ir-prototypes/
│   ├─ cfg-prototypes/
│   ├─ dfg-prototypes/
│   └─ guarantee-models/
│
├─ outputs/                     # 外部向けアウトプット
│   ├─ x-posts/
│   ├─ wordpress/
│   ├─ qiita/
│   └─ reports/
│
├─ tools/                       # 支援ツール
│   ├─ analyzers/
│   ├─ generators/
│   ├─ converters/
│   ├─ validators/
│   └─ scripts/
│
└─ .cursor/                     # Cursor設定
    └─ rules/
```

---

# 3. Design Intent by Directory

## docs/
理論と設計の正本を置く領域。研究成果の中心を担う。

### 00_project
プロジェクトの憲章、ロードマップ、研究段階、ポジショニングを管理する。

### 10_ast ～ 40_dfg
構造解析の中核。
AST / IR / CFG / DFG をそれぞれ独立した理論単位として整理する。

### 50_guarantee
この研究の中核理論。
Guarantee Space、Guarantee Order、Equivalence、Migration Geometry を明示的に配置する。

### 60_scope
移行設計責任の実務接続領域。
境界、責任分解、状態遷移との関係を扱う。

### 70_cases
理論をケースへ接続する領域。
失敗パターン、比較、仮想案件、具体例を集約する。

### 80_reviews
AIレビューと研究判断を蓄積する領域。
レビューの痕跡を残し、思考の変遷を追えるようにする。

### 90_glossary
用語統制。
理論発展時の定義ぶれを防ぐ。

### prompts/
研究・レビュー・図生成・発信を一体管理する。

---

## diagrams/
Mermaid 原本と書き出し成果物を分ける。

### mermaid/
編集可能な構造図の正本。

### exported/
PNG / SVG 等のエクスポート成果物。

### assets/
発信用に利用する画像素材。

---

## log/
研究の時系列的痕跡を保存する。

### research-log/
研究判断・理論更新・仮説形成を記録する。

### working-log/
日々の作業メモ、試行錯誤、実施内容を記録する。

### review-log/
Gemini / Sonnet / ChatGPT Codes 等によるレビュー結果を記録する。

---

## samples/
入力サンプルと中間成果物のサンプルを管理する。

COBOLだけでなく、IR / CFG / DFG のサンプルを分けることで変換と検証の比較がしやすくなる。

---

## experiments/
仮説検証の実験場。
正本の理論とは分離し、失敗も含めて自由に試せる領域とする。

---

## outputs/
発信・公開用の成果物を集約する。

- X投稿草稿
- WordPress記事草稿
- Qiita原稿
- レポート

研究 → 発信の導線を明確化するために有効。

---

## tools/
研究補助のプログラムを置く。

### analyzers
入力解析

### generators
Mermaid生成やテンプレ生成

### converters
形式変換

### validators
理論・構文・整合性検証

### scripts
単発運用スクリプト

---

# 4. Why This Structure Fits the Current Project

現在の構造の良さを残しながら、以下を強化している。

1. **理論の層構造を明示**
2. **レビューを独立資産化**
3. **実験と正本を分離**
4. **発信導線を outputs/ に明示**
5. **Guarantee Space / Migration Geometry を正式領域化**

特にあなたの研究では、

- 単なるコード実装
- 単なるメモ保存

ではなく、

**理論形成 → 検証 → 図解 → 発信**

が一つの流れになっている。

そのため、この構造は非常に相性がよい。

---

# 5. Minimum Migration Plan

現状から一気に全面移行する必要はない。
次の順で段階的に拡張するとよい。

## Step 1 (完了)
現状維持のまま以下を追加する。

```text
docs/60_scope/
docs/70_cases/
docs/80_reviews/
log/review-log/
outputs/
experiments/
```

## Step 2 (進行中)
`docs/90_glossary/` の体系化を行う。

## Step 3
docs/50_guarantee/ の中に以下を正式配置する。

- GuaranteeSpace.md
- GuaranteeOrder.md
- GuaranteeEquivalence.md
- MigrationGeometry.md

## Step 4
diagrams/mermaid/ を分野別に再編する。

```text
diagrams/mermaid/ast/
diagrams/mermaid/ir/
diagrams/mermaid/cfg/
diagrams/mermaid/dfg/
diagrams/mermaid/guarantee/
```

## Step 5
prompts を役割別に再編する。

```text
docs/prompts/research/exec/
docs/prompts/research/review/
docs/prompts/research/refine/
docs/prompts/diagrams/
docs/prompts/publishing/
docs/prompts/templates/
```

---

# 6. Conclusion

この完全版構造は、
現在の優れた骨格を壊さずに、
AI研究・理論形成・レビュー・発信を
長期的に回せる構造へ拡張する提案である。

とくに本研究のように

- AST / IR / CFG / DFG
- Guarantee Space
- Migration Geometry
- 移行設計責任
- 発信資産化

を一体で扱う場合、
**構造そのものが研究速度を左右する。**

したがって、このディレクトリ設計は
単なる整理ではなく、
研究推進の基盤設計として位置づける。

---
Project Directory Structure
Version 1.1 (Updated 2026-03-10)
