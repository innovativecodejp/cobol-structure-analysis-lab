# DFG Node and Edge Taxonomy

## 1. Purpose

DFG を比較・検証・説明可能にするため、**ノード種別** と **エッジ種別** を体系化する。分類は AST ノードの焼き直しではなく、**データ依存という構造** を記述するための語彙である。

## 2. Design Principles

- **移行分析に効く粒度**：最適化のための過細分解は必須としない。
- **意味境界を尊重**：グループ／従属／REDEFINES は「名前」ではなく **論理データ要素** として扱う。
- **CFG との併記**：エッジは可能なら **制御敏感** であることを前提に分類する。
- **Scope / Guarantee への影響**：境界横断・保証単位の独立性を損ねるエッジを区別する。

## 3. Node Taxonomy

### 3.1 上位分類

| 区分 | 説明 | 例 |
|------|------|-----|
| **Data Item Node** | プログラムが参照する論理データ要素 | 基本項目、グループ、従属、INDEX 付き要素 |
| **Literal / Constant Node** | ソース上の定数・図式定数 | 数値リテラル、ZERO、SPACE、定数領域 |
| **Expression Result Node** | 式評価の中間・最終結果 | COMPUTE 右辺の部分式（必要に応じて） |
| **Statement Result Node** | 文の実行結果としてのまとまり | 文レベルで集約する「文結果」 |
| **Input Source Node** | 外部からの入力の起点 | ファイルレコード、ACCEPT バッファ、CALL 入力 |
| **Output Sink Node** | 外部への出力の終点 | DISPLAY、WRITE、CALL 出力、レポート行 |
| **File Record Node** | ファイルセクション・レコードの論理単位 | FD 配下のレコード構造 |
| **Condition-related Data Node** | 条件式に現れるデータ | IF / EVALUATE / UNTIL の判定に使う項目 |
| **Temporary / Implicit Value Node** | 暗黙の中間・一時領域 | STRING 作業域、暗黙の再定義対象 |
| **Aggregate / Group Node** | 集約単位 | グループ全体を一つの塊として扱う場合 |
| **Subfield / Element Node** | 部分項目・配列要素 | OCCURS の要素、下位の数値項目 |

### 3.2 粒度方針

- **変数単位** だけでは足りない：**項目階層** と **物理配置の共有** を考慮する。
- **フィールド単位** は、移行時に型・桁が独立に変わりうる場合に採用する。
- **配列要素** は、添字が静的に分岐する場合と動的な場合で **到達の不確実性** が変わる。
- **グループ単位** と **下位単位** は、MOVE や REDEFINES の **同時更新** を説明するために両方を持ちうる。

## 4. Edge Taxonomy

各エッジについて **意味・発生条件・始点終点・CFG との関係・Scope/Guarantee への影響** を一貫して記述する。

| エッジ種別 | 意味 | 発生条件（概要） | 始点→終点 | CFG / 判断層 |
|------------|------|------------------|-----------|----------------|
| **define** | 終点が新たな値を持つ | 代入、算術格納、READ 等 | 値の源 → 定義先 | 到達経路で kill が変わる |
| **use** | 終点の計算・判定に始点が必要 | 右辺、条件、出力 | 参照元 → 使用箇所 | 条件 use は経路で有効域が変わる |
| **overwrite / redefine** | 同一領域の上書き・再解釈 | 同一ストレージ上の別名・別下位 | 上書き元 → 上書き先 | REDEFINES は意味衝突リスク |
| **propagation** | 値の流れの総称 | define-use の連鎖 | 任意 | reach の素材 |
| **derived-from** | 派生（計算・変換） | COMPUTE、算術文 | オペランド → 結果 | 多入力→一出力 |
| **aggregation** | 複数から一つへ | 複数項目の結合、グループ MOVE | 複数 → 一つ | 閉包が膨らむ |
| **decomposition** | 一つから複数へ | UNSTRING、部分参照 | 一つ → 複数 | 検証単位が増える |
| **input-origin** | 外部入力からの定義 | READ、ACCEPT | 入力源 → データ項目 | 境界外依存 |
| **output-consumption** | 外部への利用 | WRITE、DISPLAY | データ → シンク | 仕様変更の影響 |
| **condition-dependency** | 条件の真偽にデータが関与 | IF / UNTIL | データ → 条件付き文 | 経路分岐と連動 |
| **cross-scope transfer** | スコープ・境界をまたぐ | CALL USING、グローバル、ファイル | 境界片側 → 片側 | 保証・Scope の不一致 |

## 5. Connection Constraints

- **define の無い use** は、初期値・外部入力・未初期化の可能性として **検証対象** に残す。
- **Output Sink** から **Data Item** への「逆方向の define」は通常しない（外部入力は Input Source 経由）。
- **Literal** は define のソースとしてのみ接続し、通常は **overwrite されない**（定数領域の例外は別扱い）。
- **Condition-related** と **値 use** は同じ項目でも **エッジ種別を分けて** よい（移行時のテスト観点が異なるため）。

## 6. Granularity Policy

| 判断 | 採用 |
|------|------|
| 移行で項目単位の変更が見込まれる | 下位項目までノード化 |
| グループ全体の一括移行 | Aggregate を主とし下位は省略可 |
| 条件分岐がデータ依存に強く効く | condition-dependency を明示 |
| ファイルが境界 | File Record と I/O エッジを明示 |

## 7. Migration Analysis Value

- **高密度依存**（多数のエッジが同一ノードに集中）は、変更影響が広い **警告材料**。
- **cross-scope transfer** が多いほど、**単体テスト・保証の切り出し** が難しくなる。
- **overwrite / redefine** が多い領域は、**意味の衝突** と **デバッグ困難** の温床。

## 8. Open Questions

- 式の中間結果を **どこまでノード化するか** はツール負荷と判断の解像度のトレードオフ。
- **動的配列・ポインタ** をどの程度 DFG に含めるかは、対象 COBOL のサブセット次第。

## 9. Summary

ノードは **データと外部端点と条件** をカバーし、エッジは **define/use・派生・集約・境界・条件** を区別する。  
この分類は `03` の define/use/reach、`04` の文単位規則の **語彙** として用いる。
