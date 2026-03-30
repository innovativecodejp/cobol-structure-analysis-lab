# Phase10 / 40_dfg
## 03_Define-Use-and-Reaching-Definition-Model

あなたは「COBOL構造解析研究室」の研究補助AIです。  
本タスクの目的は、DFG における **define/use モデルおよび reaching definition の構造定義** を確立することです。

---

## 1. 目的

COBOL プログラムの移行判断では、  
「どこで定義された値が、どこで使われるか」  
「ある use に到達しうる definition は何か」  
を明示する必要があります。

本タスクでは、define/use/redefine/reach を理論的に整理してください。

---

## 2. 記述対象

以下を含めてください。

1. define の定義
2. use の定義
3. redefine / overwrite の定義
4. reaching definition の定義
5. path-sensitive / path-insensitive の扱い
6. conditional definition の扱い
7. merge point での扱い
8. 変更影響分析への接続

---

## 3. 必須論点

### 3.1 define
- MOVE
- COMPUTE
- ADD/SUBTRACT/MULTIPLY/DIVIDE
- READ / ACCEPT
- INITIALIZE
- STRING / UNSTRING
- INSPECT による値変更
などがどのような define を作るか。

### 3.2 use
- 右辺参照
- IF / EVALUATE の条件参照
- WRITE / DISPLAY / CALL 引数
- 添字・長さ・ポインタ参照
- ファイルキー参照
などがどのような use を作るか。

### 3.3 reaching definition
少なくとも以下を論じてください。

- CFG 経路との関係
- 定義が途中で kill される条件
- 複数 definition が合流する場合
- 未初期化の可能性
- 到達不明の扱い
- Scope 境界をまたぐ場合

### 3.4 判断層への接続
- 再定義が多い項目は移行リスクが高いか
- 1つの項目に多数の reaching definitions がある場合の意味
- 条件分岐により保証が分かれる場合の解釈
- Guarantee Unit の入力前提との接続

---

## 4. 出力形式

# Define-Use and Reaching Definition Model
## 1. Background
## 2. Core Concepts
## 3. Definition Model
## 4. Use Model
## 5. Reaching Definition Model
## 6. Merge and Kill Rules
## 7. Connection to CFG and Scope
## 8. Migration Risk Interpretation
## 9. Summary

必要なら簡潔な表や疑似記法を用いてください。

---

## 5. 制約

- 最適化理論の教科書説明にはしない
- COBOL 移行判断へ接続すること
- 実装アルゴリズムではなく構造規則を書く
- path-sensitive を採る/採らないの長短所を判断層まで含めて記述する

完全な Markdown を出力してください。
