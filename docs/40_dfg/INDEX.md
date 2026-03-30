# `40_dfg`

Phase 10: DFG の文書群です。

`40_dfg` は、`10_ast` `20_ir` `30_cfg` `50_guarantee` `60_scope` `70_cases` を前提として、  
**COBOL 資産におけるデータ依存構造を、移行判断・変更影響分析・保証評価に接続可能なモデルとして定義するフェーズ** を構成します。

DFG はコンパイラ最適化向けのデータフロー解析の写しではなく、**値の生成・伝播・参照・上書き・境界横断** を **構造として** 外在化する **データ依存層** として位置づけられます。CFG と独立ではなく、**制御経路とセット** で解釈されます。

## Documents

- `01_DFG-Core-Definition.md`
- `02_DFG-Node-and-Edge-Taxonomy.md`
- `03_Define-Use-and-Reaching-Definition-Model.md`
- `04_Statement-Level-DataFlow-Rules.md`
- `05_DFG-vs-CFG-Integration.md`
- `06_DFG-Boundary-and-Scope-Model.md`
- `07_Impact-Propagation-and-Closure-on-DFG.md`
- `08_DFG-Verification-Model.md`
- `09_DFG-Risk-Patterns-and-Migration-Implications.md`
- `10_DFG-Connection-to-AST-IR-CFG-Guarantee-Scope-Cases.md`

## Structure

- `01` は DFG の中核定義、目的、AST/IR/CFG/判断層との境界を固定する。
- `02` はノード／エッジの分類体系と粒度方針を固定する。
- `03` は define/use/kill/reach と CFG・Scope との接続を定義する。
- `04` は主要 COBOL 文の依存生成規則を整理する。
- `05` は DFG と CFG の統合（分岐・合流・ループ・非構造制御）を定義する。
- `06` はデータ境界・スコープ・境界横断と Scope／Guarantee との対応を整理する。
- `07` は影響伝播・依存閉包・逆閉包と移行判断への接続を定義する。
- `08` は DFG 妥当性の検証観点と受入条件を整理する。
- `09` は高リスク依存パターンと移行含意を整理する。
- `10` は AST / IR / CFG / Guarantee / Scope / Cases への接続マップで完結する。

## Notes

- DFG は **名前の同一性** と **値・意味の依存** を分離し、グループ・REDEFINES・COPY 由来の **意味境界** を重視する。
- **path-sensitive** と **path-insensitive** のトレードオフは、判断層の用途に応じて明示する。
- `30_cfg` は制御到達を与え、`40_dfg` はその経路上で **データ依存の成立条件** を説明する。

## Prior Connection

- `30_cfg`：制御経路・合流・ループ・非構造遷移（reach・merge の前提）

## Next Connection

- `50_guarantee`：データ前提・結果・保証単位の独立性
- `60_scope`：影響閉包・境界妥当性
- `60_decision`：依存リスクを移行可否判断へ
- `70_cases`：代表・高リスクケースでの照合と検証
