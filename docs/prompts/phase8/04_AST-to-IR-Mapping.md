# 04_AST-to-IR-Mapping

## 役割
あなたは「COBOL構造解析研究室」の研究アシスタントです。  
本タスクでは、AST から IR への写像規則を定義してください。

---

## 背景
`10_ast` で AST 粒度を定義し、Phase8 で IR の定義と Unit taxonomy を構築した。  
次に必要なのは、AST から IR へどのように情報を射影するかを整理することである。

---

## この文書の目的
以下を明確にしてください。

1. AST ノードがどのように IR Unit に変換されるか
2. 1対1 / 1対多 / 多対1 の写像がどのように起きるか
3. paragraph / section / statement / clause の扱い
4. 補助的構文要素をどう吸収・統合するか
5. 正規化の入り口として AST→IR 写像をどう位置づけるか

---

## 必須観点

### 1. 写像の目的
- なぜ AST をそのまま使わず IR に写すのか
- 写像段階で何を保存し、何を再構成するのか

### 2. 基本写像パターン
- 1対1
- 1対多
- 多対1
- コンテナ→境界単位
- 補助句の吸収
- 条件表現の統合

### 3. COBOL 構造別写像
最低でも次を扱ってください。
- paragraph / section
- IF
- EVALUATE
- PERFORM
- MOVE / COMPUTE
- READ / WRITE
- CALL
- STOP RUN / GOBACK

### 4. 写像ルール
- AST ノード単位で保持する情報
- IR Unit 生成時に新たに付与する情報
- 失われる情報
- 後続層へ渡す情報

### 5. 正規化の起点
- AST の構文差を IR 側でどう吸収するか
- clause ベース構造をどうまとめるか

### 6. リスク
- 写像が曖昧な場合
- 情報を落としすぎる場合
- AST の粒度と IR の粒度が整合しない場合

---

## 出力要件
以下の構成で Markdown を出力してください。

# AST to IR Mapping

## 1. Why Mapping Is Needed
## 2. Mapping Principles
## 3. Basic Mapping Patterns
## 4. Mapping Rules for Major COBOL Structures
## 5. Information Preserved, Added, and Lost
## 6. Mapping as the Entry Point of Normalization
## 7. Risks and Failure Modes
## 8. Summary

---

## 表現ルール
- 日本語で記述
- 写像規則として明示的に書く
- 例を含める
- 可能なら対応表を含める
- Mermaid 図を 1 つ以上含める

---

## Mermaid に期待する図
例:
- AST node → IR unit mapping diagram
- 1対1 / 1対多 / 多対1 の模式図

---

## 受入基準
- 写像の目的が明確
- 基本パターンが整理されている
- COBOL 主要構造の写像例がある
- 正規化接続がある
- 曖昧さのリスクが説明されている

---

## 出力ファイル名
`docs/20_ir/04_AST-to-IR-Mapping.md`
