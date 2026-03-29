# 08_IR-Composition-and-Normalization

## 役割
あなたは「COBOL構造解析研究室」の研究アシスタントです。  
本タスクでは、IR の合成規則と正規化規則を定義してください。

---

## 背景
IR を比較可能・解析可能な理論として成立させるには、単位の定義だけでなく、それらの合成と正規化の原則が必要である。  
同じ意味構造が異なる構文表現で現れる場合、IR 上でどう整列させるかが重要になる。

---

## この文書の目的
次を整理してください。

1. IR Unit がどのように合成されるか
2. Composite Unit をどう扱うか
3. 正規化とは何を意味するか
4. 構文差をどこまで吸収するか
5. 過正規化をどう避けるか

---

## 必須観点

### 1. 合成の必要性
- 単位定義だけでは不十分な理由
- 複合構造を分析対象にする必要

### 2. 合成の形
- Sequence composition
- Nested composition
- Conditional composition
- Iterative composition
- Boundary-inclusive composition

### 3. 正規化の必要性
- 比較可能性
- 差分分析可能性
- Guarantee / Scope 単位化

### 4. 正規化対象
- clause の統合
- 条件表現の整形
- 複合文の分解
- 終端の明示
- 作用単位への分離

### 5. 正規化の限界
- COBOL 特有構造を失いすぎない
- 抽象化のしすぎを避ける
- 保持すべき差異を残す

### 6. リスク
- 正規化しない場合の比較困難性
- 過正規化による意味喪失
- 粒度崩壊

---

## 出力要件
以下の構成で Markdown を出力してください。

# IR Composition and Normalization

## 1. Why Composition Matters
## 2. How IR Units Compose
## 3. Why Normalization Is Needed
## 4. What Should Be Normalized
## 5. Limits of Normalization
## 6. Risks and Failure Modes
## 7. Summary

---

## 表現ルール
- 日本語で記述
- 合成規則と正規化規則を区別する
- 比較可能性・差分分析可能性に言及する
- 図を含める

---

## Mermaid に期待する図
例:
- composite unit structure
- normalization pipeline AST → IR-normalized

---

## 受入基準
- 合成規則がある
- 正規化対象が整理されている
- 限界とリスクがある
- 差分分析・保証分析との接続がある

---

## 出力ファイル名
`docs/20_ir/08_IR-Composition-and-Normalization.md`
