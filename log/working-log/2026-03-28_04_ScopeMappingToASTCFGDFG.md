# 2026-03-28_04_ScopeMappingToASTCFGDFG

## 🎯 今日の目的
- `docs/prompts/phase6/60_scope/10_Scope-Mapping-to-AST-CFG-DFG.md` に沿って、Phase 6 の締めくくりとして **Scope 理論を各構造モデルへ写像する文書** をまとめる。
- `Scope` が model ごとに違って見えつつ、理論上は同じ対象を指している、という整理を作業メモに残す。

## 🛠 実施内容
- プロンプトで要求されている章立て（問題設定、中心命題、AST / CFG / DFG / Guarantee / Decision、Cross-Model Correspondence、移行判断、Mermaid、暫定結論）を確認した。
- `01_Scope-Core-Definition.md` の三つ組と、`07`〜`09` の議論を踏まえ、`Scope` を **model-invariant / manifestation model-specific** として整理した。
- AST-facing / CFG-facing / DFG-facing / Guarantee-facing / Decision-facing の 5 観点で、それぞれの現れ方を言語化した。
- `equivalence` ではなく **correspondence** を強調する方針でまとめた。
- `log/research-log/2026-03-28_04_ScopeMappingToASTCFGDFG.md` に、決定事項と保留を研究メモとして残した。

## 🔍 結果
- `Scope` が各モデルで同一表現を取るわけではない、という点を明確に保ったまま、抽象的一貫性を説明できた。
- AST / CFG / DFG / Guarantee / Decision を、1つの抽象 `Scope` の **異なる投影** として並べて書けた。
- Phase 6 の理論が、後続の構造フェーズへどう橋渡しされるかを締めくくり文書として示せた。

## 💡 学び
- model 間の関係は equivalence と書くより、**correspondence** と書いた方が誤解が少ない。
- `Scope` の価値は、各モデルを同じにすることではなく、**各モデルの見ている対象が本当に同じかを点検できること** にある。

## 🧠 思考整理
- AST は見えやすいが十分ではなく、DFG は広がりやすいが判断単位を失いやすい、といった各モデルの癖が `Scope` の manifestation に反映される。
- `Guarantee` と `Decision` を最後に含めることで、Phase 6 が単なる構造論ではなく判断理論へ接続することがはっきりした。

## 🧭 抽象レベル
- Invariance / Manifestation / Correspondence: **理論的一貫性**、**モデル固有の現れ**、**モデル間対応** を分離して扱う。

## ⚖ 移行判断への示唆
- reliable migration reasoning には、各モデルでの `Scope` alignment が必要であり、どこか1層だけに依拠すると判断が偏る。

## ⏭ 次のアクション
- AST / CFG / DFG の後続フェーズで、今回の correspondence をより具体的な rules / mappings に落とす。
- cross-model mismatch や boundary conflict を、将来の分析ルールとして定式化する。
