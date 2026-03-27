# 2026-03-27_05_ScopeVsGuaranteeUnit

## 🎯 今日の目的
- `docs/prompts/phase6/60_scope/05_Scope-vs-Guarantee-Unit.md` に沿って、Phase 6 の第5文書として **`Scope` と `Guarantee Unit` の厳密な区別**（適用範囲 vs 評価単位）をどう固定するかを整理する。
- 「移行対象の範囲」と「保証が評価される単位」を同一視しない思考を、作業メモとして残す。

## 🛠 実施内容
- プロンプトで要求されている章立て（問題設定、両者の再確認、中核的差異、構造的関係、Coverage と Scope、混同のリスク、移行判断、Mermaid、暫定結論）を確認した。
- `01_Scope-Core-Definition.md` の三つ組と、`50_guarantee` における **Guarantee Unit / Guarantee Space** の役割を突き合わせた。
- **target range** と **evaluative unit** の対比表で中核差異を固定した。
- **§6.1** として「Guarantee applicability は Scope identity を定義しない」を必須小節として書いた。
- `log/research-log/2026-03-27_05_ScopeVsGuaranteeUnit.md` で決定事項と保留を記録した。

## 🔍 結果
- **Scope** は対象の枠であり、**Guarantee Unit** は主張の帰属・検証の枠である、という二層が言語化できた。
- **一つの Scope に複数 GU**、**一つの GU が複数構造に横断**、**部分的 coverage** を、同一の語彙で並べて説明できた。
- **conflation** 時の破綻（帰属・被覆・合成・Decision）を、保証理論の不安定化として列挙できた。

## 💡 学び
- 保証が「ある」ことと、**解析・判断の対象としての Scope が定まった**ことは別物である。
- **applicability** と **identity** を混同しないことは、保証理論と Scope 理論を接続する際の最低限の関所である。

## 🧠 思考整理
- メトリクスや格子の細部に飛ばず、**構造**（適用・被覆・境界）で議論を止めることが本稿の目的だった。
- `04` の合成と、`50_guarantee` の合成は **別操作** である、という感覚がはっきりした。

## 🧭 抽象レベル
- Target / Evaluative: **対象範囲の記述**と**評価単位の記述**を分離する。

## ⚖ 移行判断への示唆
- **migration feasibility** は Scope と GU の **両方**に依存する。**guarantee attribution** だけでパッケージを切ると、実効的な広がりとずれる。

## ⏭ 次のアクション
- `06_Scope-vs-Migration-Unit.md` で、`Scope` と移行単位の対応を詰める。
- `docs/60_scope/05_Scope-vs-Guarantee-Unit.md` と research-log の用語を突き合わせ、ブレがないか確認する。
