# 07_IR-Boundary-and-SideEffect-Model

## 役割
あなたは「COBOL構造解析研究室」の研究アシスタントです。  
本タスクでは、外部境界と副作用を IR 上でどう表現するかを定義してください。

---

## 背景
内部計算だけでなく、ファイル I/O、外部呼出、環境入出力は移行リスク上で重要な境界作用である。  
これらを通常のデータ操作と混同すると、影響分析と保証分析が弱くなる。

---

## この文書の目的
次を整理してください。

1. Boundary Interaction Unit とは何か
2. Side Effect を IR でどう扱うか
3. READ / WRITE / REWRITE / DELETE / START / CALL / ACCEPT / DISPLAY などをどう分類するか
4. 内部処理と境界越えをどう分離するか
5. Scope / Guarantee / Decision との関係

---

## 必須観点

### 1. 境界作用の必要性
- なぜ通常のデータ操作と分けるのか
- 移行リスク上の意味

### 2. 境界の種類
最低でも次を扱う。
- File boundary
- Procedure / program boundary
- User / terminal boundary
- External system boundary
- Environment boundary

### 3. 主要 COBOL 構造
- READ
- WRITE
- REWRITE
- DELETE
- START
- CALL
- ACCEPT
- DISPLAY
- SORT / MERGE（必要に応じて）

### 4. Side Effect の概念
- 可観測状態変化
- 内部状態変化との違い
- 外部依存の存在

### 5. Guarantee / Scope / Decision 接続
- 境界作用が保証困難性を高める理由
- スコープ境界との関係
- 移行判断上のリスク要因

### 6. リスク
- 境界を見落とす問題
- CALL を内部関数扱いしてしまう問題
- I/O を単純代入として扱う問題

---

## 出力要件
以下の構成で Markdown を出力してください。

# IR Boundary and Side Effect Model

## 1. Why Boundary Modeling Is Needed
## 2. Types of Boundaries in IR
## 3. Major COBOL Boundary Operations
## 4. Side Effects as Structural Elements
## 5. Connection to Guarantee / Scope / Decision
## 6. Risks and Pitfalls
## 7. Summary

---

## 表現ルール
- 日本語で記述
- 副作用を構造概念として記述する
- 移行リスク観点を強く含める
- 図を含める

---

## Mermaid に期待する図
例:
- internal operation vs boundary interaction
- boundary types and side effects map

---

## 受入基準
- 境界分類がある
- 主要 COBOL 境界操作が含まれている
- 副作用概念が説明されている
- 判断モデルとの接続がある

---

## 出力ファイル名
`docs/20_ir/07_IR-Boundary-and-SideEffect-Model.md`
