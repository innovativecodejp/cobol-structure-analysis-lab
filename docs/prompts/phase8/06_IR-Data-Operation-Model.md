# 06_IR-Data-Operation-Model

## 役割
あなたは「COBOL構造解析研究室」の研究アシスタントです。  
本タスクでは、COBOL のデータ操作を IR 上でどのように抽象化するかを定義してください。

---

## 背景
IR は DFG の前段階として、データ作用を整理する必要がある。  
COBOL のデータ操作は、MOVE のような代入から、COMPUTE、INSPECT、STRING / UNSTRING のような複合操作まで広がる。

---

## この文書の目的
次を整理してください。

1. データ操作を IR でどのような作用単位として扱うか
2. 値代入・変換・集約・分解・再配置などの分類
3. COBOL 主要データ操作をどの IR Unit に写すか
4. DFG へ接続する際にどの情報を持つか
5. Guarantee / Scope への接続可能性

---

## 必須観点

### 1. データ作用抽象の必要性
- AST 上の文法構造では足りない理由
- DFG のために何を明示する必要があるか

### 2. データ作用の分類軸
最低でも次を扱う。
- Assignment
- Transformation
- Aggregation
- Decomposition
- Initialization
- Formatting / Rearrangement
- Position-dependent operation

### 3. COBOL 構造別検討
- MOVE
- COMPUTE
- ADD / SUBTRACT / MULTIPLY / DIVIDE
- INITIALIZE
- INSPECT
- STRING
- UNSTRING

### 4. 各操作で保持すべき情報
- source
- target
- intermediate transformation
- positional dependency
- side effect possibility

### 5. DFG 接続
- def / use
- transformation edge
- decomposition / aggregation edge
- state change の扱い

### 6. リスク
- 見た目の文法差だけで分類する問題
- 複合操作を単一代入扱いする問題
- 位置依存性を落とす問題

---

## 出力要件
以下の構成で Markdown を出力してください。

# IR Data Operation Model

## 1. Why Data Operation Abstraction Is Needed
## 2. Core Categories of Data Operations
## 3. Abstraction of Major COBOL Data Operations
## 4. Information Retained in Data Operation Units
## 5. Connection from IR Data Units to DFG
## 6. Risks and Failure Modes
## 7. Summary

---

## 表現ルール
- 日本語で記述
- 作用の分類を明示する
- COBOL 主要操作ごとの考察を含める
- DFG との関係を意識する
- 図または表を含める

---

## Mermaid に期待する図
例:
- data operation taxonomy
- MOVE / COMPUTE / STRING / UNSTRING の作用分類図

---

## 受入基準
- データ作用分類がある
- COBOL 主要操作が取り上げられている
- DFG への接続がある
- 位置依存や複合性の問題が扱われている

---

## 出力ファイル名
`docs/20_ir/06_IR-Data-Operation-Model.md`
