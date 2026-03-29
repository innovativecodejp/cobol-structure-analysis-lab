# 03_IR-Unit-Taxonomy

## 役割
あなたは「COBOL構造解析研究室」の研究アシスタントです。  
本タスクでは、IR を構成する単位群の分類体系を定義してください。

---

## 背景
IR の定義と設計原則が与えられても、構成単位が不明確なままでは分析モデルにならない。  
そこで本タスクでは、IR 上で扱う「単位」を分類し、どのような種類の IR Unit が存在するかを整理する。

---

## この文書の目的
以下を整理してください。

1. IR Unit とは何か
2. IR Unit をどのような観点で分類するか
3. 各 Unit の責務は何か
4. 各 Unit がどの後続分析に効くか
5. Unit 間の関係はどうなるか

---

## 必須観点

### 1. IR Unit の定義
- IR Unit の一文定義
- 「文」ではなく「構造作用単位」として扱う理由

### 2. 分類軸
最低でも次の観点を検討してください。
- 制御作用
- データ作用
- 状態遷移
- 境界越え
- 呼出
- 条件判定
- 複合構成
- 終端 / 例外 / 中断

### 3. 推奨分類
最低でも次の候補を扱ってください。
- Control Unit
- Condition / Guard Unit
- Data Operation Unit
- State Transition Unit
- Boundary Interaction Unit
- Invocation Unit
- Composite Unit
- Terminal Unit

### 4. 各 Unit の説明
各分類について
- 定義
- 典型 COBOL 構造
- 保持すべき情報
- CFG / DFG / Guarantee / Scope との関係
を記述する

### 5. Unit 間の関係
- 包含
- 依存
- 合成
- 派生
の観点で整理する

### 6. リスク
- 分類が曖昧だと何が困るか
- 文法分類に引きずられる問題
- 過度に細分化した場合の問題

---

## 出力要件
以下の構成で Markdown を出力してください。

# IR Unit Taxonomy

## 1. What Is an IR Unit
## 2. Why a Taxonomy Is Needed
## 3. Classification Axes
## 4. Proposed Taxonomy of IR Units
## 5. Detailed Description of Each Unit Type
## 6. Relationships Among Unit Types
## 7. Risks of Poor Taxonomy
## 8. Summary

---

## 表現ルール
- 日本語で記述
- 単なる一覧ではなく分類体系として説明する
- COBOL 構造との対応を含める
- 可能なら表と Mermaid 図を含める

---

## Mermaid に期待する図
例:
- IR Unit taxonomy tree
- Unit 間依存関係図

---

## 受入基準
- Unit 定義がある
- 分類軸が示されている
- 各分類に説明がある
- 後続分析との関係が書かれている
- 単位分類が AST の構文カテゴリに回収されていない

---

## 出力ファイル名
`docs/20_ir/03_IR-Unit-Taxonomy.md`
