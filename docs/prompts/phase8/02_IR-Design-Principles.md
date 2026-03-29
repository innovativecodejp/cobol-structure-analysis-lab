# 02_IR-Design-Principles

## 役割
あなたは「COBOL構造解析研究室」における研究アシスタントです。  
本タスクでは `20_ir` の設計原則文書として、IR 設計に必要な原則群を定義してください。

---

## 背景
`01_IR-Core-Definition.md` では IR の中核定義を与えた。  
次に必要なのは、その IR をどのような原則に従って設計すべきかを固定することである。

IR は AST の単なる焼き直しでも、C# 生成専用の実装中間形式でもない。  
本研究では、**移行判断に耐える構造表現** を設計するため、IR 設計原則を文書化する必要がある。

---

## この文書の目的
次のような原則を体系化してください。

1. IR は構文写像ではなく作用構造を表す
2. IR は実装変換依存にしない
3. IR は CFG / DFG へ接続できる
4. IR は Guarantee / Scope / Decision に接続できる
5. IR は粒度一貫性と正規化可能性を持つ

---

## 必須観点

### 1. 設計原則の必要性
- なぜ定義だけでは足りないのか
- 原則不在だと何が揺れるのか

### 2. 設計原則一覧
最低でも次を含めてください。
- 構文従属回避
- 実装依存回避
- 構造作用優先
- 接続可能性維持
- 粒度一貫性
- 正規化可能性
- 境界明示性
- 判断単位への昇格可能性

### 3. 各原則の説明
各原則について
- 定義
- 必要性
- 守らない場合の問題
- 他原則との関係
を記述する

### 4. 原則間の緊張関係
例えば
- 抽象化 vs 情報保持
- 正規化 vs COBOL 特有性保持
- 粒度細分化 vs 可読性
など

### 5. 後続フェーズとの関係
- CFG
- DFG
- Guarantee
- Scope
- Decision
に対して、どの原則が何を支えるか

---

## 出力要件
以下の構成で Markdown を出力してください。

# IR Design Principles

## 1. Why Design Principles Are Needed
## 2. Core Principles
## 3. Detailed Explanation of Each Principle
## 4. Tensions and Trade-offs Among Principles
## 5. Principles as Preconditions for Later Models
## 6. Summary

---

## 表現ルール
- 日本語で記述
- 箇条書きだけで終わらず、文章として説明する
- 原則は最低 6 個以上示す
- 単なるソフトウェア設計一般論にしない
- COBOL 構造解析研究の文脈に閉じる
- 可能なら Mermaid 図を 1 つ含める

---

## Mermaid に期待する図
例:
- 原則群と AST / IR / CFG / DFG / Guarantee / Scope / Decision の関係図
- 原則間の依存関係図

---

## 受入基準
- 原則が列挙されている
- 各原則に必要性と破綻リスクがある
- 原則間のトレードオフが述べられている
- 後続研究との接続がある

---

## 出力ファイル名
`docs/20_ir/02_IR-Design-Principles.md`
