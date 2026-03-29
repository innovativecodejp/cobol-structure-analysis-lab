# 10_IR-Connection-to-Guarantee-Scope-Decision

## 役割
あなたは「COBOL構造解析研究室」の研究アシスタントです。  
本タスクでは、IR を Guarantee / Scope / Decision に接続する理論的位置づけを定義してください。

---

## 背景
本研究は、単なる構文研究ではなく、移行可否判断のための構造的根拠生成を目的としている。  
したがって IR は、CFG / DFG の前段であるだけでなく、保証・境界・判断の各モデルへ接続されなければならない。

---

## この文書の目的
次を明確にしてください。

1. IR Unit が Guarantee Unit とどう関係するか
2. IR Unit が Scope Unit とどう関係するか
3. IR Unit が Migration Decision の根拠単位になりうるか
4. どの IR 特性が移行リスク指標になるか
5. IR が「判断可能構造単位」として成立する条件は何か

---

## 必須観点

### 1. Guarantee との接続
- Guarantee Unit と IR Unit の対応関係
- 保証対象としての IR
- 保証困難性を高める IR 特徴

### 2. Scope との接続
- Scope boundary candidate としての IR Unit
- 閉包性・包含性・伝播性との関係
- paragraph / section / boundary interaction との関係

### 3. Decision との接続
- 移行可否判断に必要な IR 情報
- 高リスク IR パターン
- 判断根拠としての説明可能性

### 4. 構造特徴とリスク
例として次を検討する。
- 高密度制御分岐
- 境界作用の集中
- 複合データ変換
- 正規化困難性
- 外部依存の強さ

### 5. 判断単位としての成立条件
- 観測可能性
- 境界明示性
- 他層接続可能性
- 比較可能性
- 保証可能性

### 6. リスク
- IR が判断接続できない場合
- Guarantee / Scope との粒度不整合
- 説明責任を果たせない場合

---

## 出力要件
以下の構成で Markdown を出力してください。

# IR Connection to Guarantee, Scope, and Decision

## 1. Why IR Must Connect to Judgment Models
## 2. IR and Guarantee
## 3. IR and Scope
## 4. IR and Migration Decision
## 5. Structural Features of IR as Risk Indicators
## 6. Conditions for IR to Become a Judgment Unit
## 7. Risks and Failure Modes
## 8. Summary

---

## 表現ルール
- 日本語で記述
- Guarantee / Scope / Decision を分けて論じる
- 構造特徴から判断へ向かう流れを書く
- 図を含める

---

## Mermaid に期待する図
例:
- IR → Guarantee / Scope / Decision の接続図
- risk-bearing IR features map

---

## 受入基準
- Guarantee 接続がある
- Scope 接続がある
- Decision 接続がある
- リスク指標候補が示されている
- IR を判断単位とする条件が示されている

---

## 出力ファイル名
`docs/20_ir/10_IR-Connection-to-Guarantee-Scope-Decision.md`
