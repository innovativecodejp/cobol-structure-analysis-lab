# 2026-03-27_06_ScopeVsMigrationUnit

## 🎯 今日の目的
- `docs/prompts/phase6/60_scope/06_Scope-vs-Migration-Unit.md` に沿って、Phase 6 の第6文書として **`Scope` と `Migration Unit` の区別**（分析単位 vs 実行単位）をどう固定するかを整理する。
- analysis と execution のズレを、単なる現場都合ではなく **mismatch** として理論上の対象にする思考を残す。

## 🛠 実施内容
- プロンプトで要求されている章立て（問題設定、Scope 再確認、Migration Unit 定義、中核的差異、Mismatch、Packaging / Cutover、構造と運用の緊張、移行判断、Mermaid、暫定結論）を確認した。
- `01_Scope-Core-Definition.md` と `05_Scope-vs-Guarantee-Unit.md` を踏まえ、**analysis unit** と **execution unit** の違いを中核差異として整理した。
- `Migration Unit` を最小形 \( \mu = \langle E_\mu, C_\mu, O_\mu \rangle \) で置き、**packaging constraints** と **operational commitments** を分けて書いた。
- **§7.1** として「Analytical coherence does not guarantee migration executability」を必須節として明示した。
- `log/research-log/2026-03-27_06_ScopeVsMigrationUnit.md` に、決定事項と保留を研究メモとして残した。

## 🔍 結果
- **Scope** は対象を理解するための枠、**Migration Unit** は移行を動かすための枠、という二層が安定して書けた。
- **小さい Scope / 大きい MU**、**大きい Scope / 複数 MU** の両方向 mismatch を、同一の構造語彙で説明できた。
- **packaging** と **cutover** を管理論ではなく、境界と原子的操作の問題として位置づけられた。

## 💡 学び
- 構造的にきれいな切り方が、そのまま配備や切替の単位になるとは限らない。
- feasibility judgment が崩れる原因は、しばしば対象の分析ミスではなく、**実行単位への写像ミス** にある。

## 🧠 思考整理
- `Scope` の整合条件と `Migration Unit` の整合条件は別であり、両者の対応は自明ではない。
- `04` の Scope 合成と、複数 Scope を 1 つの実行単位に束ねる操作は、似て見えても別操作として扱う必要がある。

## 🧭 抽象レベル
- Analysis / Execution: **意味的対象の境界**と**移行実行の境界**を分離する。

## ⚖ 移行判断への示唆
- **migration planning logic** は、まず `Scope` を決め、その後で `Migration Unit` を設計する二段階を持つ。ここを飛ばすと、cutover feasibility も packaging も過小評価される。

## ⏭ 次のアクション
- `07_Impact-Scope-and-Propagation.md` で、impact が analysis 境界と execution 境界をどう跨ぐかを書く。
- `docs/60_scope/06_Scope-vs-Migration-Unit.md` と research-log の用語を突き合わせ、`mismatch` の定義ブレがないか確認する。
