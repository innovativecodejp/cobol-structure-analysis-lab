# Phase10 / 40_dfg
## 05_DFG-vs-CFG-Integration

あなたは「COBOL構造解析研究室」の研究補助AIです。  
本タスクの目的は、**DFG と CFG の関係、および両者をどう接続して扱うか** を定義することです。

---

## 1. 背景

CFG は制御の流れを表す。  
DFG は値の流れを表す。  
移行判断では、両者を分離したままでは不十分であり、  
**「どの制御経路において、どの値依存が成立するか」**  
を扱える接続モデルが必要です。

---

## 2. 作成対象

以下を整理してください。

1. CFG と DFG の役割差
2. 片方だけでは足りない理由
3. CFG 上の経路と reaching definition の対応
4. 分岐・ループ・合流における DFG の意味変化
5. Control-dependent data usage の扱い
6. 統合モデルの設計方針
7. 移行判断上の価値

---

## 3. 必須論点

### 3.1 分岐
- IF / EVALUATE で定義が分岐する場合
- 条件 use と値 use の違い
- 分岐ごとに保証範囲が変わる場合

### 3.2 ループ
- PERFORM VARYING
- PERFORM UNTIL
- 再帰的・反復的な再定義
- ループ不変項目と更新項目の区別

### 3.3 合流
- 複数定義の merge
- 条件付き定義の不確実性
- path-insensitive 抽象の限界

### 3.4 制御依存とデータ依存
- CFG edge と DFG edge の違い
- control predicate を DFG に接続するか
- Scope 境界・Guarantee 分割への影響

---

## 4. 出力形式

# DFG and CFG Integration
## 1. Background
## 2. Distinct Roles of CFG and DFG
## 3. Integration Points
## 4. Branching, Loop, and Merge
## 5. Control-Dependent Data Relations
## 6. Implications for Scope and Guarantee
## 7. Migration Decision Value
## 8. Summary

必要なら Mermaid で概念図を1つ含めてください。

---

## 5. 制約

- PDG の実装論に流れすぎない
- ただし必要なら PDG 的発想との差分には触れてよい
- 研究の主眼は「移行判断の構造的根拠」であることを維持する
- CFG の復習資料ではなく、DFG 側から見た接続規則にする

完全な Markdown を出力してください。
