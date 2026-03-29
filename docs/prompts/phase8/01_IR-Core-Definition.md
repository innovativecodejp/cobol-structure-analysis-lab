# 01_IR-Core-Definition

## 役割
あなたは「COBOL構造解析研究室」における研究アシスタントです。  
本タスクでは `20_ir` の最初の文書として、IR（Intermediate Representation）の中核定義を確立してください。

---

## 背景
本研究では、`10_ast` で構文構造の粒度方針を整理し、`50_guarantee` で保証単位、`60_scope` で境界と閉包を定義してきた。  
Phase8 では `20_ir` を対象に、AST の次に位置する中間構造理論を構築する。

ここでいう IR は、単なるコード生成用の中間形式ではなく、**AST で得た構文構造を、制御・データ・保証・判断へ接続可能な構造単位へ再編成する抽象層** として定義する必要がある。

---

## この文書の目的
`01_IR-Core-Definition.md` では、次を明確にしてください。

1. IR とは何か
2. なぜ AST の次に IR が必要なのか
3. IR は AST と何が違うのか
4. IR は何を表し、何を表さないのか
5. IR が今後の CFG / DFG / Guarantee / Scope / Decision にどう接続されるのか

---

## 必須観点
以下を必ず含めてください。

### 1. 定義
- IR の一文定義
- 本研究空間における IR の位置づけ
- 一般的な compiler IR との違い

### 2. 必要性
- AST だけでは不足する理由
- 判断可能構造を得るために IR が必要な理由
- 移行判断研究における IR の意義

### 3. 境界
- IR が扱うもの
- IR が直接は扱わないもの
- AST / CFG / DFG との責務分離

### 4. 構造層としての役割
- 構文層 → 構造層 → 判断層 の関係
- IR が橋渡しする対象
- IR の抽象度

### 5. 将来接続
- CFG との接続
- DFG との接続
- Guarantee との接続
- Scope との接続
- Decision との接続

### 6. リスク
- IR が未定義だと何が起こるか
- AST と混同した場合の問題
- 実装寄りに定義しすぎた場合の問題

---

## 出力要件
以下の構成で Markdown を出力してください。

# IR Core Definition

## 1. Purpose
## 2. Definition of IR
## 3. Why IR is Needed After AST
## 4. Boundary of IR
## 5. IR as a Structural Layer
## 6. Relationship to AST / CFG / DFG
## 7. Relationship to Guarantee / Scope / Decision
## 8. Risks of Not Defining IR Properly
## 9. Summary

---

## 表現ルール
- 日本語で記述する
- 抽象化優先
- 実装手順やコード生成手法には立ち入らない
- 「構文層」「構造層」「判断層」の区別を明示する
- 可能なら Mermaid 図を 1 つ含める
- 研究文書として読める密度で記述する
- 単なる説明文で終わらず、判断材料生成の観点を含める

---

## Mermaid に期待する図
例:
- AST → IR → CFG / DFG → Guarantee / Scope / Decision の接続図

---

## 受入基準
- IR の定義が一文で明快に示されている
- AST との差分が明示されている
- IR の責務範囲が明示されている
- 判断モデルとの接続が明示されている
- 実装論に流れず、研究レベルの抽象性を保っている

---

## 出力ファイル名
`docs/20_ir/01_IR-Core-Definition.md`
