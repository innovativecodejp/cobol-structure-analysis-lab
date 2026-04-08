# 研究フェーズ対応表 (Research Phase Mapping)

各**研究フェーズ**の成果物と**用語集**の対応関係を詳細に示します。

## フェーズ概要

| Phase | ディレクトリ | 主要テーマ | 期間（推定） | 主要成果物 |
|-------|-------------|------------|-------------|-----------|
| **Phase 1-7** | `10_ast`, `50_guarantee`, `60_scope`, `60_decision`, `70_cases` | 基礎理論構築 | 初期 | AST, Guarantee, Scope, Decision, Cases |
| **Phase 8** | `20_ir` | 中間表現理論 | 中期 | IR, 構造作用理論 |
| **Phase 9** | `30_cfg` | 制御フロー理論 | 中期 | CFG, 制御構造理論 |
| **Phase 10** | `40_dfg` | データフロー理論 | 中期 | DFG, データ依存理論 |
| **Extension** | `80_geometry`, `80_reviews` | 幾何学拡張 | 継続 | Migration Geometry |

## Phase別用語対応

### Phase 1-7: 基礎理論構築

**主要ディレクトリ**: `10_ast`, `50_guarantee`, `60_scope`, `60_decision`, `70_cases`

| 用語 | 用語集ファイル | 研究での役割 |
|------|----------------|-------------|
| **AST (Abstract Syntax Tree)** | `02_StructuralAnalysisLayer.md` | 構文観測の基底層 |
| **Guarantee** | `03_GuaranteeTheory.md` | 正しさの基本単位 |
| **Guarantee Unit** | `03_GuaranteeTheory.md` | 保証の最小単位 |
| **Guarantee Space** | `04_GuaranteeSpaceTheory.md` | 保証状態の数理空間 |
| **Scope** | `06_StructuralModeling.md` | 解析・移行の範囲 |
| **Scope Boundary** | `06_StructuralModeling.md` | 範囲の境界定義 |
| **Migration Decision** | `07_MigrationDecisionModel.md` | 移行判断の形式化 |
| **Migration Feasibility** | `07_MigrationDecisionModel.md` | 実行可能性評価 |
| **Case Study Analysis** | `07_MigrationDecisionModel.md` | 事例による検証 |

### Phase 8: 中間表現理論

**ディレクトリ**: `20_ir`  
**用語集への反映**: `02_StructuralAnalysisLayer.md`, `TermsAstIrCfgDfg.md`

| 用語 | 定義概要 | Phase 8 での確立内容 |
|------|----------|---------------------|
| **IR (Intermediate Representation)** | 構造作用の中間層 | AST と CFG/DFG をつなぐ統一表現 |
| **Layer Architecture** | 階層構造の設計原則 | 構文層・構造層・判断層の分担 |
| **Structural Layer Stack** | 層の積み上げ構造 | AST → IR → CFG/DFG の流れ |

**成果**: AST の構文情報を構造的判断に接続する中間抽象化

### Phase 9: 制御フロー理論

**ディレクトリ**: `30_cfg`  
**用語集への反映**: `08_ControlStructureModel.md`, `TermsAstIrCfgDfg.md`

| 用語 | Phase 9 での重要性 | 移行判断への貢献 |
|------|-------------------|------------------|
| **CFG (Control Flow Graph)** | 制御到達と経路閉包の中核 | 経路依存性の可視化 |
| **Basic Block** | CFG の最小解析単位 | 保証境界の候補 |
| **Dominance** / **Post-Dominance** | 支配関係の定義 | 依存構造の分析 |
| **Reachability** / **Path Closure** | 到達可能性の形式化 | 影響範囲の特定 |
| **Loop Structure** / **Back Edge** | 反復構造の解析 | ループリスクの評価 |
| **Non-Structured Control** | GO TO 等の非構造制御 | 移行リスクの特定 |
| **Path Structure** | 経路パターンの分類 | テスト設計の基礎 |
| **Control Risk Pattern** | 高リスク制御の特定 | 移行困難度の予測 |

**成果**: COBOL の制御構造を移行判断可能な形で抽象化

### Phase 10: データフロー理論

**ディレクトリ**: `40_dfg`  
**用語集への反映**: `09_DataStructureModel.md`, `TermsAstIrCfgDfg.md`

| 用語 | Phase 10 での重要性 | CFG との統合 |
|------|-------------------|--------------|
| **DFG (Data Flow Graph)** | データ依存の中核モデル | CFG と制御敏感で統合 |
| **Define** / **Use** / **Kill** | データフローの基本要素 | CFG 経路との対応 |
| **Reaching Definition** | 到達定義の形式化 | 制御経路に依存 |
| **Define-Use Chain** / **Use-Define Chain** | 依存関係の双方向表現 | 影響分析の基礎 |
| **Impact Closure** / **Reverse Closure** | 影響伝播の閉包 | 変更影響の範囲特定 |
| **Cross-Scope Transfer** | 境界横断データ依存 | 統合リスクの要因 |
| **Aggregation/Decomposition Edge** | 集約・分解の依存 | COBOL 特有の構造 |
| **Data Risk Pattern** | データ依存のリスク | 移行困難度の予測 |

**成果**: データ依存を移行判断・影響分析に接続する理論基盤

## フェーズ間の理論発展

### Phase 8 → Phase 9
```
IR の構造作用 → CFG の制御構造
```
- IR で定義した制御作用を CFG のノード・エッジに展開
- 構造の抽象化から制御の可視化へ

### Phase 9 → Phase 10  
```
CFG の制御経路 → DFG のデータ依存
```
- CFG で定義した経路上でのデータ依存の成立条件
- 制御とデータの統合モデル

### Phase 8-10 → 判断層
```
IR + CFG + DFG → Migration Decision
```
- 3つの構造層を総合した移行判断材料の生成
- 構造的根拠から判断への橋渡し

## 今後の発展（予想）

### Phase 11+: 統合応用
- **実案件適用**: `70_cases` の具体化
- **ツール化**: 解析の自動化
- **検証**: 理論の実証

### 長期展開
- **他言語拡張**: COBOL 以外への理論適用
- **産業応用**: 実際の移行プロジェクトでの検証
- **理論深化**: 数学的厳密化

---

*研究フェーズの積み上げにより、構文観測から移行判断まで一貫した理論体系が構築されています。*