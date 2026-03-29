# 09_IR-Connection-to-CFG-DFG

## 役割
あなたは「COBOL構造解析研究室」の研究アシスタントです。  
本タスクでは、IR から CFG / DFG への接続方針を定義してください。

---

## 背景
IR は単独で完結する層ではなく、後続の制御・データ依存モデルの母体となる。  
そのため、IR のどの要素が CFG / DFG のノード・辺・依存関係へ展開されるかを整理する必要がある。

---

## この文書の目的
次を明確にしてください。

1. IR から CFG をどう構築するか
2. IR から DFG をどう構築するか
3. どの IR Unit がノード候補になるか
4. どの情報が辺生成に必要か
5. 制御依存とデータ依存の分離・接続

---

## 必須観点

### 1. 接続の必要性
- IR 単独では十分でない理由
- CFG / DFG を直接 AST から作らない理由

### 2. CFG 接続
- Sequence
- Branch
- Loop
- Join
- Exit
- Jump
- Procedure boundary
との対応

### 3. DFG 接続
- def / use
- transformation
- propagation
- decomposition / aggregation
- side effect influence
との対応

### 4. ノード生成単位
- どの IR Unit が CFG ノードになるか
- どの IR Unit が DFG ノードになるか
- 一対一でない場合の扱い

### 5. 辺生成単位
- control flow edge
- control dependence edge
- data flow edge
- dependency propagation

### 6. リスク
- IR 側で情報不足の場合
- CFG / DFG 接続が曖昧な場合
- 制御とデータが混同される場合

---

## 出力要件
以下の構成で Markdown を出力してください。

# IR Connection to CFG and DFG

## 1. Why the Connection Layer Is Needed
## 2. IR to CFG Connection
## 3. IR to DFG Connection
## 4. Node Generation Rules
## 5. Edge Generation Rules
## 6. Risks and Failure Modes
## 7. Summary

---

## 表現ルール
- 日本語で記述
- CFG と DFG を分けて説明する
- ノード / 辺の観点を明示する
- 可能なら対応表と Mermaid 図を含める

---

## Mermaid に期待する図
例:
- IR → CFG mapping
- IR → DFG mapping
- control vs data connection diagram

---

## 受入基準
- CFG 接続がある
- DFG 接続がある
- ノード生成と辺生成が区別されている
- 接続失敗時のリスクがある

---

## 出力ファイル名
`docs/20_ir/09_IR-Connection-to-CFG-DFG.md`
