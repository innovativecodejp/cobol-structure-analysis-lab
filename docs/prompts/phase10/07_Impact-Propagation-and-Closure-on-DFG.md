# Phase10 / 40_dfg
## 07_Impact-Propagation-and-Closure-on-DFG

あなたは「COBOL構造解析研究室」の研究補助AIです。  
本タスクの目的は、DFG 上での **変更影響伝播と閉包判定** を定義することです。

---

## 1. 背景

移行判断では、ある項目や文の変更が  
どこまで伝播しうるかを把握する必要があります。  
DFG はそのための主要根拠になります。

---

## 2. 作成対象

以下を整理してください。

1. 影響伝播の定義
2. 伝播の単位
3. 直接影響 / 間接影響
4. 条件付き影響
5. 境界越え影響
6. 閉包の定義
7. 閉包未達成時の意味
8. 移行優先順位付けとの接続

---

## 3. 必須論点

### 3.1 影響源
- データ項目の定義変更
- 文の式変更
- 入出力仕様変更
- フィールド構造変更
- 初期化方針変更

### 3.2 影響伝播
- define-use 連鎖
- condition-dependency 経由の伝播
- aggregation / decomposition 経由の伝播
- file I/O 経由の伝播
- scope 境界越え

### 3.3 閉包
少なくとも以下を論じてください。

- どこまで追えば閉包とみなせるか
- 未観測ノードがある場合
- 外部境界で止まる場合
- CFG 条件未確定で完全閉包できない場合
- Guarantee 範囲に収まる閉包と収まらない閉包

### 3.4 判断層
- 影響半径の大きい項目とは何か
- 再定義密度が高い領域の危険性
- 変更の波及に対する migration unit 切り方
- 部分移行の難所の見つけ方

---

## 4. 出力形式

# Impact Propagation and Closure on DFG
## 1. Background
## 2. Impact Propagation Model
## 3. Direct and Indirect Effects
## 4. Conditional and Cross-Boundary Effects
## 5. Closure Conditions
## 6. Migration Risk Interpretation
## 7. Relationship to Scope and Guarantee
## 8. Summary

必要なら Mermaid 図を1つ付けてください。

---

## 5. 制約

- 単なるグラフ探索説明にはしない
- 「移行判断材料をどう作るか」に焦点を置く
- Scope / Guarantee / Migration Unit へつなぐ
- 実装アルゴリズム詳細は禁止

完全な Markdown を出力してください。
