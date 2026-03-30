# Phase10 / 40_dfg
## 08_DFG-Verification-Model

あなたは「COBOL構造解析研究室」の研究補助AIです。  
本タスクの目的は、構築された DFG が **どのように検証されるべきか** を定義することです。

---

## 1. 背景

研究モデルとしての DFG は、定義しただけでは不十分です。  
正しさ・十分性・使い道を評価するための検証観点が必要です。

---

## 2. 作成対象

以下を整理してください。

1. DFG 検証の目的
2. 構文整合性検証
3. CFG 整合性検証
4. define/use 完全性検証
5. 境界・閉包妥当性検証
6. ケース照合による検証
7. 保証・影響分析への有効性検証
8. 残余不確実性の扱い

---

## 3. 必須論点

### 3.1 構造妥当性
- ノード種別整合
- エッジ種別整合
- 禁止接続の不在
- 暗黙ノードの一貫性

### 3.2 参照妥当性
- define が存在しない use
- use がない dead definition
- 到達しない定義
- 多重定義合流の取り扱い

### 3.3 他モデル整合
- AST 起源の追跡可能性
- IR 抽象との整合
- CFG 経路と reaching definition の整合
- Scope 閉包との整合
- Guarantee 前提/結果への接続可能性

### 3.4 ケース検証
- 代表構文ケース
- 高リスク構文ケース
- ファイル I/O ケース
- 条件分岐ケース
- ループケース
- 複合ケース

---

## 4. 出力形式

# DFG Verification Model
## 1. Purpose
## 2. Validation Dimensions
## 3. Structural Consistency Checks
## 4. Cross-Model Consistency Checks
## 5. Case-Based Validation
## 6. Residual Uncertainty
## 7. Acceptance Criteria
## 8. Summary

---

## 5. 制約

- テスト実装やツール実装の話にしない
- 研究モデルとしての妥当性判定基準を書く
- 70_cases との接続を意識する
- 「何を満たせば DFG 定義が十分と言えるか」を明確にする

完全な Markdown を出力してください。
