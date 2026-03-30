# Phase10 / 40_dfg
## 04_Statement-Level-DataFlow-Rules

あなたは「COBOL構造解析研究室」の研究補助AIです。  
本タスクの目的は、COBOL の主要文ごとに **DFG をどのように生成・解釈するかの文単位規則** を定義することです。

---

## 1. 背景

DFG を実用的な研究モデルにするには、  
個々の COBOL 文がどのような define/use/propagation を発生させるかを  
文単位で明確化する必要があります。

---

## 2. 対象文

少なくとも以下を対象にしてください。

- MOVE
- COMPUTE
- ADD / SUBTRACT / MULTIPLY / DIVIDE
- IF
- EVALUATE
- PERFORM（条件参照がある場合）
- READ
- WRITE
- REWRITE
- ACCEPT
- DISPLAY
- INITIALIZE
- STRING
- UNSTRING
- INSPECT
- SET（必要に応じて）
- CALL 引数受け渡し（研究上必要なら）

---

## 3. 各文ごとに必須で記述する項目

各文について以下を揃えてください。

1. 構造上の役割
2. define される対象
3. use される対象
4. 暗黙ノードの必要性
5. 生成される DFG エッジ種別
6. CFG との接続で考慮すべき点
7. Scope / Guarantee への影響
8. 移行リスク上の注記

---

## 4. 特に重要な論点

### 4.1 MOVE
- 単純代入
- 型変換含み
- グループ MOVE
- 部分項目 MOVE

### 4.2 COMPUTE / 算術文
- 複数 use から1つの define
- 中間式ノードの必要性
- 丸め・サイズ超過等は DFG に含めるか

### 4.3 IF / EVALUATE
- 条件 use は DFG にどう現れるか
- 分岐先での reaching definition への影響
- 条件依存エッジは必要か

### 4.4 READ / WRITE
- READ は入力起源 define とみなすか
- WRITE は use のみか、出力 sink を別ノード化するか

### 4.5 INITIALIZE / STRING / UNSTRING / INSPECT
- 暗黙の再定義範囲
- 複数項目への波及
- 高リスク構文としての注釈可能性

---

## 5. 出力形式

# Statement-Level Data Flow Rules
## 1. Purpose
## 2. Rule Design Policy
## 3. Rules by Statement
## 4. Cross-Cutting Concerns
## 5. Migration Risk Notes
## 6. Summary

「Rules by Statement」は文ごとの小見出しで整理してください。

---

## 6. 制約

- 実装コードは禁止
- AST/IR/CFG との関係を必要に応じて明記する
- 文法説明ではなく、データ流規則として書く
- 後続の検証・ケース分析で再利用できる粒度にする

完全な Markdown を出力してください。
