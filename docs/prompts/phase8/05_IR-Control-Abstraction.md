# 05_IR-Control-Abstraction

## 役割
あなたは「COBOL構造解析研究室」の研究アシスタントです。  
本タスクでは、制御構造を IR 上でどのように抽象化するかを定義してください。

---

## 背景
IR は CFG の前段階として、制御作用を整理する必要がある。  
COBOL の制御構造は、単純な if / loop / switch に還元しきれない部分があり、IR 上でどう扱うかが重要になる。

---

## この文書の目的
次を整理してください。

1. 制御作用を IR でどう表すか
2. IF / EVALUATE / PERFORM / GO TO / NEXT SENTENCE / STOP RUN などをどの抽象で扱うか
3. branch / loop / dispatch / jump / terminate をどう区別するか
4. paragraph / section 境界が制御構造にどう関与するか
5. CFG へどう接続するか

---

## 必須観点

### 1. 制御抽象の必要性
- AST 記述だけでは不十分な理由
- CFG 直接生成前に抽象化が必要な理由

### 2. 制御抽象の基本カテゴリ
最低でも次を扱う。
- Sequence
- Branch
- Dispatch
- Iteration
- Jump
- Return / Exit / Termination

### 3. COBOL 構造別検討
- IF
- EVALUATE
- PERFORM paragraph
- PERFORM THRU
- PERFORM UNTIL / VARYING
- GO TO
- NEXT SENTENCE
- STOP RUN / GOBACK

### 4. Paragraph / Section の制御的意味
- 単なるコンテナではなく、制御境界としての役割
- 参照先、遷移先、戻り先の扱い

### 5. IR と CFG の接続
- どの制御抽象がどの CFG 構造に対応するか
- join / exit / loop back edge などへの橋渡し

### 6. リスク
- PERFORM を単純 call とみなす問題
- EVALUATE を単純 switch とみなす問題
- GO TO の扱いを曖昧にする問題

---

## 出力要件
以下の構成で Markdown を出力してください。

# IR Control Abstraction

## 1. Why Control Abstraction Is Needed
## 2. Core Categories of Control in IR
## 3. Abstraction of Major COBOL Control Structures
## 4. Paragraph and Section as Control Boundaries
## 5. Connection from IR Control Units to CFG
## 6. Risks and Pitfalls
## 7. Summary

---

## 表現ルール
- 日本語で記述
- 制御構造の抽象分類を明示する
- COBOL 特有性を落としすぎない
- 例と図を含める
- 実装アルゴリズムには立ち入らない

---

## Mermaid に期待する図
例:
- IF / EVALUATE / PERFORM の抽象関係図
- IR control category → CFG structure 図

---

## 受入基準
- 制御カテゴリが定義されている
- COBOL 主要制御構造が扱われている
- paragraph / section の制御的意味が説明されている
- CFG 接続が述べられている

---

## 出力ファイル名
`docs/20_ir/05_IR-Control-Abstraction.md`
