# `20_ir`

Phase 8: IR の文書群です。

`20_ir` は、`10_ast` `50_guarantee` `60_scope` `60_decision` を前提として、  
**構文構造を移行判断に耐える構造作用単位へ再編成するための中間構造理論** を与えます。

IR は単なる実装中間形式ではなく、AST と CFG / DFG、および Guarantee / Scope / Decision のあいだを接続する **構造層** として位置づけられます。

## Documents

- `01_IR-Core-Definition.md`
- `02_IR-Design-Principles.md`
- `03_IR-Unit-Taxonomy.md`
- `04_AST-to-IR-Mapping.md`
- `05_IR-Control-Abstraction.md`
- `06_IR-Data-Operation-Model.md`
- `07_IR-Boundary-and-SideEffect-Model.md`
- `08_IR-Composition-and-Normalization.md`
- `09_IR-Connection-to-CFG-DFG.md`
- `10_IR-Connection-to-Guarantee-Scope-Decision.md`

## Structure

- `01` は IR の定義と位置づけを固定する。
- `02` は IR 設計原則を固定する。
- `03` は IR Unit の分類体系を与える。
- `04` は AST から IR への写像規則を与える。
- `05` `06` `07` は制御・データ・境界の主要作用領域を個別に定義する。
- `08` は合成規則と正規化規則を与え、比較可能性を支える。
- `09` は IR を CFG / DFG へ接続する。
- `10` は IR を Guarantee / Scope / Decision へ接続する。

## Notes

- IR は AST の単なる焼き直しではなく、**制御作用・データ作用・境界作用を型付きで扱う構造表現** である。
- `20_ir` は `30_cfg` `40_dfg` の前段であると同時に、`50_guarantee` `60_scope` `60_decision` を分断しないための中間層である。
- 各文書は、定義、必要性、境界、粒度、接続、リスク、可視化を揃える方針で構成されている。

## Next Connection

- `30_cfg`：IR 上の制御作用をグラフ構造へ展開する
- `40_dfg`：IR 上のデータ作用と副作用を依存構造へ展開する
- `50_guarantee`：Guarantee Unit と IR Unit の対応を精緻化する
- `60_scope`：IR 境界を Scope 境界候補として再評価する
- `60_decision`：IR 特徴量を移行判断材料として再編成する
