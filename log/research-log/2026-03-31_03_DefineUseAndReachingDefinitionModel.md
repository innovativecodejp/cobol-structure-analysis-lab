# 2026-03-31_03_DefineUseAndReachingDefinitionModel

## 🎯 今日の研究焦点（1つだけ）
- define/use/kill/reach を COBOL と本研究抽象に合わせ、CFG・Scope・判断層まで接続して定義する。

## 🏗 モデル仮説
- reach は CFG 経路に依存し、merge では定義集合が拡張される。
- REDEFINES・共有領域は「別名 kill」として規約化しうる。

## 🔬 構造設計
- 主要文種ごとの define／use の典型を列挙。
- path-sensitive／path-insensitive の長短と、移行判断での使い分けを記述。

## ✅ 今日の決定事項
- 条件 use と値 use を分けて記述する方針を採用。
- Guarantee Unit の入力前提・観測結果とデータ依存を接続可能とした。

## ⚠ 保留・未解決
- グループ親の「意味」更新の扱いは境界モデル（`06`）と連携。

## 🧠 抽象度の到達レベル
→ L3〜L4：reach が Scope 不足検知のシグナルになりうる。

## ⏭ 次の研究ステップ
- `04` 文単位規則で具象化する。
