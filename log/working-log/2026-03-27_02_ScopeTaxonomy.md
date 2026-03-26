# 2026-03-27_02_ScopeTaxonomy

## 🎯 今日の目的
- `docs/prompts/phase6/60_scope/02_Scope-Taxonomy.md` に沿って、Phase 6 の第2文書として **Scope の分類体系** をどう固定するかを整理する。
- `Scope` を単一ラベルで運用すると起きるすり替え（構文・構造・判断の混線）を、類型で防ぐという方針を思考として残す。

## 🛠 実施内容
- プロンプトで要求されている章立て（問題設定、分類原理、十種類型、層横断、重なりと緊張、移行判断上の意義、Mermaid、暫定結論）を確認した。
- `syntax-facing / structure-facing / judgment-facing` を、例示ではなく **面向性の整理** として明示する必要があると整理した。
- 先行の `01_Scope-Core-Definition.md` の三つ組 \( \langle T, B, P \rangle \) と、類型分類（どの射影を主に固定するか）の接続を意識した。

## 🔍 結果
- 分類は「タグの列挙」ではなく、**分析目的と抽象層**に基づく原理的分類として扱う方針が明確になった。
- 十種類は相互に直交しない。重なり・乖離・衝突はバグではなく、**制約の表現**として書ける。
- 後続の boundary / containment / impact / verification / completeness は、この taxonomy を座標系として書ける。

## 💡 学び
- 「Syntactic」と「Structural」を分けることで、AST 粒度の議論と責務境界の議論を混ぜないようにできる。
- 「Decision」と「Migration」を分けることで、判断対象と実行・パッケージング対象のズレを先に言語化できる。
- taxonomy を先に置くと、後続文書の見出しが「何の Scope を前提にしているか」を宣言しやすくなる。

## 🧠 思考整理
- 類型が多すぎると運用が重いが、少なすぎると再び未分化に戻る。十種は **研究モデルに必要な分解能** としての暫定セットとして捉える。
- 面向性（syntax / structure / judgment）は排他的ではない。特に Dependency は structure と judgment の橋渡しになりやすい。

## 🧭 抽象レベル
- Structure / Decision: 構造目的（制御・データ・依存）と判断目的（保証・検証・影響・移行）を分類軸として接続する。

## ⚖ 移行判断への示唆
- 見積もりは Impact / Dependency、テスト設計は Verification / Guarantee、カットオーバー単位は Migration / Structural が衝突しやすい。
- taxonomy がないと、これらの議論が同一の「範囲」という語で混ざる。

## ⏭ 次のアクション
- `03_Scope-Boundary-Model.md` で、類型ごとに境界条件の型（明示・暗黙）を定義する。
- `docs/60_scope/02_Scope-Taxonomy.md` 本文と research-log の決定事項を突き合わせ、用語のブレがないか確認する。
