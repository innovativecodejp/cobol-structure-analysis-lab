# Statement-Level Data Flow Rules

## 1. Purpose

主要 COBOL 文ごとに **define / use / 暗黙ノード / エッジ種別 / CFG 上の注意 / Scope・Guarantee / 移行リスク** を揃え、文単位の DFG 生成規則を固定する。実装コードではなく **抽象規則** として記述する。

## 2. Rule Design Policy

- 文の **データ効果** に焦点を当てる（制御効果は CFG と連携）。
- **グループ・部分項目** は境界モデル（`06`）と整合する前提で、ここでは **典型** を示す。
- 丸め・サイズ超過などの **実行時例外** は、DFG の必須要素とはせず **注記** とする。

## 3. Rules by Statement

### 3.1 MOVE

| 項目 | 内容 |
|------|------|
| 役割 | 値の複製・編集付き移動 |
| define | 受信側（グループなら対応する下位を含む） |
| use | 送信側、編集文字列・変換指定に関与する項目 |
| 暗黙ノード | 編集が複雑な場合、中間イメージ（任意） |
| エッジ | define, use, derived-from（計算付きの場合） |
| CFG | 文は通常1基本ブロック内 |
| Scope / Guarantee | 大きなグループ MOVE は **影響面が広い** |
| リスク | グループ対応ミス、異なる型・桁の暗黙変換 |

### 3.2 COMPUTE

| 項目 | 内容 |
|------|------|
| define | 左辺項目 |
| use | 右辺の全オペランド |
| 暗黙ノード | 式が複雑な場合、部分式ノード（任意） |
| エッジ | derived-from, use, define |
| CFG | 例外条件（SIZE ERROR 等）がある場合は **分岐** とリンク |
| リスク | 丸め順序、中間精度は仕様依存 |

### 3.3 ADD / SUBTRACT / MULTIPLY / DIVIDE

| 項目 | 内容 |
|------|------|
| define | 格納先（GIVING 含む） |
| use | オペランド全て |
| エッジ | 複数 use → 一 define（aggregation 的） |
| リスク | サイズエラー分岐、余り |

### 3.4 IF

| 項目 | 内容 |
|------|------|
| define | なし（代入を伴わない場合） |
| use | 条件式内の全データ |
| エッジ | condition-dependency から **_then/else 内の文** へ（統合は `05`） |
| CFG | 分岐・合流が必須。reach は **分岐で分割** |
| リスク | 条件の網羅、デッド分岐 |

### 3.5 EVALUATE

| 項目 | 内容 |
|------|------|
| use | 選択対象、WHEN 条件のデータ |
| エッジ | 複数条件と **選ばれた文** のデータ依存 |
| CFG | 多路分岐。合流点での merge |
| リスク | フォールスルー、OTHER の有無 |

### 3.6 PERFORM（条件参照がある場合）

| 項目 | 内容 |
|------|------|
| use | UNTIL / VARYING の条件・添字 |
| define | 本文内の文に委譲 |
| CFG | ループエッジ。反復による **累積 define** |
| リスク | 無限ループ、ループ不変の誤認 |

### 3.7 READ

| 項目 | 内容 |
|------|------|
| define | レコード領域（INTO 指定含む） |
| use | キー、ファイル状態を参照する場合 |
| エッジ | input-origin, define |
| Scope | ファイル境界 **越えの define** |
| リスク | AT END、無効レコード |

### 3.8 WRITE

| 項目 | 内容 |
|------|------|
| use | 出力レコード内容 |
| define | 通常なし（レコードを書き換えない場合） |
| エッジ | use → output-consumption |
| リスク | レコードレイアウト変更の波及 |

### 3.9 REWRITE

| 項目 | 内容 |
|------|------|
| use | 新内容 |
| define | ファイル上のレコード像（論理） |
| リスク | READ-REWRITE 間の **他トランザクション** は DFG 外 |

### 3.10 ACCEPT

| 項目 | 内容 |
|------|------|
| define | 受信項目 |
| エッジ | input-origin |
| Scope | 端末・システム入力境界 |

### 3.11 DISPLAY

| 項目 | 内容 |
|------|------|
| use | 出力対象 |
| エッジ | output-consumption |

### 3.12 INITIALIZE

| 項目 | 内容 |
|------|------|
| define | 指定項目（複数）一括 |
| use | 置換が VALUE 句等で別項目を参照する場合 |
| リスク | **広範囲の同時 define**、見落とし |

### 3.13 STRING

| 項目 | 内容 |
|------|------|
| use | 送信項目、区切り |
| define | 受信、POINTER 更新 |
| 暗黙 | 連結結果の一時像（任意） |
| リスク | 長さ超過、POINTER 連鎖 |

### 3.14 UNSTRING

| 項目 | 内容 |
|------|------|
| use | ソース |
| define | 複数受信、区切りカウンタ |
| エッジ | decomposition |
| リスク | 区切り曖昧性 |

### 3.15 INSPECT

| 項目 | 内容 |
|------|------|
| use | 検査対象 |
| define | 置換・変換で **対象を更新** する場合 |
| リスク | 全置換・部分置換の見誤り |

### 3.16 SET

| 項目 | 内容 |
|------|------|
| define | 設定先（条件名、ポインタ等） |
| use | TO 句の参照 |

### 3.17 CALL（引数）

| 項目 | 内容 |
|------|------|
| use / define | BY REFERENCE / CONTENT / VALUE に応じ **呼び出し側** の項目は use、**被呼び出し側** での副作用は cross-scope |
| Scope | **手続き境界** を越える主な源 |

## 4. Cross-Cutting Concerns

- **EVALUATE / IF** は条件 use が **CFG と直交** する。
- **PERFORM** は **同一データへの反復 define** を生む。
- **ファイル I/O** は **外部シンク・ソース** として必ず境界ノード化するのが安全。

## 5. Migration Risk Notes

- **INITIALIZE / STRING / UNSTRING / INSPECT** は変更時の **暗黙の波及** が大きい。
- **グループ MOVE / COMPUTE** は **桁・符号・編集** の移行仕様とセットで検証が必要。

## 6. Summary

文単位で define/use を揃えることで、`05` 以降の **CFG 統合・境界・閉包** の入力として一貫した規則を与える。
