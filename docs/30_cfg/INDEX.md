# `30_cfg`

Phase 9: CFG の文書群です。

`30_cfg` は、`10_ast` `20_ir` `50_guarantee` `60_scope` `60_decision` を前提として、  
**COBOL の制御構造を、移行判断・保証境界・影響分析に接続可能な制御到達モデルとして定義するフェーズ** を構成します。

CFG は単なる実行順序図ではなく、分岐・合流・反復・非構造遷移・到達可能性・閉包性を、判断可能な構造として外在化する **制御構造層** として位置づけられます。

## Documents

- `01_CFG-Core-Definition.md`
- `02_CFG-Node-and-Edge-Taxonomy.md`
- `03_Basic-Block-and-Control-Region.md`
- `04_CFG-Mapping-from-AST-and-IR.md`
- `05_Branch-Merge-and-Path-Structure.md`
- `06_Loop-and-Iteration-Model.md`
- `07_NonStructured-Control-and-GOTO.md`
- `08_Dominance-Reachability-and-Closure.md`
- `09_CFG-to-Scope-Guarantee-Decision.md`
- `10_CFG-Risk-Patterns-and-Migration-Readiness.md`

## Structure

- `01` は CFG の定義、役割、責務境界を固定する。
- `02` はノードと辺の分類体系を固定する。
- `03` は基本ブロックと制御領域を定義し、解析単位を与える。
- `04` は AST / IR から CFG への写像規則を整理する。
- `05` は分岐・合流・経路構造を定義する。
- `06` は反復とループ構造を定義する。
- `07` は GO TO を含む非構造制御を独立論点として扱う。
- `08` は到達性・支配性・閉包性を導入する。
- `09` は CFG を Scope / Guarantee / Decision に接続する。
- `10` は高リスク制御構造と移行準備度へ接続する。

## Notes

- CFG は **構文層（AST）** と **構造作用層（IR）** の後に置かれる、制御到達と経路閉包の構造層である。
- paragraph / section は保守上の自然単位だが、CFG 上の最小解析単位は basic block であり、両者のズレを明示的に扱う。
- `30_cfg` は `40_dfg` の前段であると同時に、`50_guarantee` `60_scope` `60_decision` を接続するための制御根拠層である。
- 非構造制御は例外ではなく、移行リスクを説明するための第一級の分析対象として扱う。

## Next Connection

- `40_dfg`：制御経路上で生じる def-use / 伝播をデータ依存構造へ展開する
- `50_guarantee`：経路保証・領域保証・保証不能経路を精緻化する
- `60_scope`：CFG の制御閉包を Scope 境界候補として再評価する
- `60_decision`：CFG リスクパターンを移行可否判断へ昇格する
- `70_cases`：高リスク制御構造を事例単位で検証する
