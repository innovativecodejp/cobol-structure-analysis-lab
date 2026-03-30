# Phase10 / 40_dfg
## 02_DFG-Node-and-Edge-Taxonomy

あなたは「COBOL構造解析研究室」の研究補助AIです。  
本タスクの目的は、DFG を構成する **ノード種別とエッジ種別の分類体系** を定義することです。

---

## 1. 背景

DFG を研究・比較・検証可能なモデルにするためには、  
「どの種類の要素をノードとして持つのか」  
「どの種類の依存をエッジとして持つのか」  
を明確にしなければなりません。

ここでは、移行判断に役立つ構造分類を目的とします。

---

## 2. 作成対象

以下を体系化してください。

1. ノード分類
2. エッジ分類
3. ノード間接続制約
4. 分類ごとの意味
5. 移行分析上の利用価値
6. 他モデルとの接続点

---

## 3. ノード分類で必須の観点

少なくとも以下を検討してください。

- Data Item Node
- Literal / Constant Node
- Expression Result Node
- Statement Result Node
- Input Source Node
- Output Sink Node
- File Record Node
- Condition-related Data Node
- Temporary / Implicit Value Node
- Aggregate / Group Node
- Subfield / Element Node

必要なら上位分類・下位分類を設けてください。

---

## 4. エッジ分類で必須の観点

少なくとも以下を検討してください。

- define edge
- use edge
- overwrite / redefine edge
- propagation edge
- derived-from edge
- aggregation edge
- decomposition edge
- input-origin edge
- output-consumption edge
- condition-dependency edge
- cross-scope transfer edge

各エッジについて以下を記述してください。

- 意味
- 発生条件
- 始点と終点
- CFG との関係
- Scope / Guarantee への影響

---

## 5. 必須論点

### 5.1 ノード粒度
- 変数単位か
- 項目単位か
- フィールド単位か
- 配列要素単位か
- グループ項目単位か

### 5.2 値と器の分離
- データ項目そのもの
- その時点の値
- 文の結果値
これらを分けるかどうかを整理してください。

### 5.3 暗黙要素
- READ による入力
- ACCEPT
- INITIALIZE
- STRING / UNSTRING 中間結果
- COMPUTE の式結果
など、暗黙ノードの必要性を検討してください。

---

## 6. 出力形式

以下の章立てで Markdown を出力してください。

# DFG Node and Edge Taxonomy
## 1. Purpose
## 2. Design Principles
## 3. Node Taxonomy
## 4. Edge Taxonomy
## 5. Connection Constraints
## 6. Granularity Policy
## 7. Migration Analysis Value
## 8. Open Questions
## 9. Summary

必要に応じて表を用いてください。

---

## 7. 制約

- 実装データ構造の議論はしない
- 単なる一覧ではなく、分類根拠を書く
- AST ノード分類の焼き直しにはしない
- 「構造的依存」を表す分類として整合性を持たせる
- Scope / Guarantee / Impact 分析に接続できる分類にする

完全な Markdown を出力してください。
