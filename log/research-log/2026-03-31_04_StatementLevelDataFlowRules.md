# 2026-03-31_04_StatementLevelDataFlowRules

## 🎯 今日の研究焦点（1つだけ）
- 主要 COBOL 文ごとの define/use・暗黙ノード・エッジ種別・CFG/Scope/リスクを一覧化する。

## 🏗 モデル仮説
- 文の「データ効果」に焦点を当て、制御効果は CFG に委ねる。
- MOVE/COMPUTE/IO/INITIALIZE/STRING 等は移行時の暗黙波及が大きい。

## 🔬 構造設計
- 文種ごとに表形式で規則を固定（`04` 本文に対応）。

## ✅ 今日の決定事項
- IF/EVALUATE は条件 use を主とし、CFG 統合は `05` に委譲。
- CALL は cross-scope の主因として明示。

## ⚠ 保留・未解決
- SIZE ERROR 等の例外分岐は CFG 側の詳細と突合が必要。

## 🧠 抽象度の到達レベル
→ L1（構文出発）から L3（依存規則）への橋渡し。

## ⏭ 次の研究ステップ
- `05` CFG 統合で条件・ループ・合流を接続。
