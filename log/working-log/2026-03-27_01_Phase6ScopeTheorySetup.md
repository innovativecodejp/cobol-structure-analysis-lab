# 2026-03-27_01_Phase6ScopeTheorySetup

## 🎯 今日の目的
- Phase 6 `Scope Theory` の着手条件を整理する。
- `Scope` を日常語の「範囲」ではなく、研究モデル上の第一級概念として固定するための論点を洗い出す。
- `AST / Guarantee / Decision` のあいだにある未接続部分を、`Scope` でどう束ねるかを見極める。

## 🛠 実施内容
- `Phase 6: Scope Theory Roadmap` を読み、Phase 6 全体の位置づけを確認した。
- `01_Scope-Core-Definition` のプロンプトを読み、最初の文書に要求されている定義範囲を整理した。
- `TEMPLATE.md` の標準構成を確認し、Phase 6 の各文書が共通の論理骨格を持つように揃えた。
- `Scope` と `Boundary / Unit / Region / Context` の差を、最初の文書で明示的に分離する必要があると判断した。
- `Scope` は AST の構文単位とは一致せず、Guarantee Unit とも Migration Unit とも一致しない、という前提を先に固定した。

## 🔍 結果
- Phase 6 の出発点は、「何を解析対象とみなすか」を定義することだと明確になった。
- `Scope` は構文上の可視範囲ではなく、保証適用と移行判断のための**有界な意味的対象領域**として扱うべきだという方向性が固まった。
- `Boundary` は `Scope` の区切り条件であり、`Scope` そのものではない、という整理が有効だと確認できた。
- 最初の文書は、後続の taxonomy、boundary、closure、verification の議論を支える基礎定義として機能させる必要があるとわかった。

## 💡 学び
- AST、Guarantee、Decision が個別に整っていても、それらが「同じ対象」を見ているとは限らない。`Scope` はその対象同一性を保証するための概念として必要になる。
- `Scope` が曖昧なままだと、保証評価の対象と移行判断の対象がずれ、理論上の一貫性が崩れる。
- `Scope` を先に定義しておくことで、後続の `Impact Scope` や `Verification Scope` を単なる派生トピックではなく、同一理論の展開として扱える。

## 🧠 思考整理
- 現時点では、`Scope` は「unit を束ねる箱」よりも、「意味的に判断可能な対象を切り出すための枠組み」として見る方が適切に思える。
- `Region` や `Context` と近い語感を持つが、`Scope` には判断妥当性を支える役割が含まれるため、より強い概念として扱う必要がある。
- 後続文書では `containment` や `closure` を扱うため、最初の定義文書の段階で boundedness と traceability を落とさないことが重要になる。

## 🧭 抽象レベル
- Structure / Decision: 構造的対象の切り出しと、移行判断の適用領域の接続。

## ⚖ 移行判断への示唆
- 移行可否は「コードが変換できるか」ではなく、「どの対象領域について判断しているか」が明確であって初めて成立する。
- `Scope` が狭すぎると依存漏れを招き、広すぎると実行可能な移行単位を失うため、`Scope` 理論は見積もり・検証・段階移行に直結する。
- 将来的な `Migration Unit` の議論は、`Scope` の上に載る実行単位の議論として切り分けた方が整理しやすい。

## ⏭ 次のアクション
- `02_Scope-Taxonomy.md` に向けて、`Syntactic / Structural / Control / Data / Dependency / Guarantee / Decision / Verification / Impact / Migration` の各 scope をどう分類するかを整理する。
- `03_Scope-Boundary-Model.md` の準備として、明示境界と暗黙境界の差を先に言語化する。
- `Guarantee Unit` と `Migration Unit` の差分文書では、`Scope` を共通の参照軸として定義できるかを確認する。
