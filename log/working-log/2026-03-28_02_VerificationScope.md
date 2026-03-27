# 2026-03-28_02_VerificationScope

## 🎯 今日の目的
- `docs/prompts/phase6/60_scope/08_Verification-Scope.md` に沿って、Phase 6 の第8文書として **Verification Scope** をどう固定するかを整理する。
- 検証を test case 数ではなく、**どこまでの領域に対して証拠が十分か** という scope の問題として扱う思考を作業メモに残す。

## 🛠 実施内容
- プロンプトで要求されている章立て（問題設定、中心命題、形式的定義、類型、Impact Scope との関係、Evidence Adequacy、Under-Verification、移行判断、Mermaid、暫定結論）を確認した。
- `07_Impact-Scope-and-Propagation.md` と `60_decision/06_Verification_Framework.md` を踏まえ、verification を **判断証拠の対象領域** として置き直した。
- `Verification Scope` を \( \sigma_{ver} = \langle T_{ver}, B_{ver}, P_{ver} \rangle \) として定義した。
- **Local / Boundary / Dependency / Extended Verification Scope** の 4 類型を整理した。
- `log/research-log/2026-03-28_02_VerificationScope.md` に、決定事項と保留を研究メモとして残した。

## 🔍 結果
- verification は活動量ではなく、**証拠が意味を持つ対象領域** の問題である、と安定して書けた。
- `Impact Scope` と `Verification Scope` の関係を、一致・超過・遅れの 3 類型で整理できた。
- **Evidence Adequacy** と **Verification Evidence Collection Region** を分けることで、検証対象と証拠収集場所の違いを説明できた。

## 💡 学び
- under-verification は「テスト不足」よりも、**検証境界の設定不足** として理解したほうが筋がよい。
- confidence は absolute ではなく scoped だと書くと、false confidence の問題がかなり明確になる。

## 🧠 思考整理
- `Guarantee Unit` が保証主張の帰属単位を定め、`Verification Scope` がその主張を支える証拠の必要範囲を定める、という役割分担がはっきりした。
- `Impact Scope` を超える verification が必要な場合を入れることで、boundary / dependency verification の意味が出た。

## 🧭 抽象レベル
- Evidence / Scope / Decision: **証拠**、**検証領域**、**判断支援**を分離して扱う。

## ⚖ 移行判断への示唆
- **feasibility / confidence / decision support** は、どれだけ検証したかではなく、どの `Verification Scope` に adequacy が成立したかで決まる。

## ⏭ 次のアクション
- `09_Scope-Closure-and-Completeness.md` で、verification adequacy と closure / completeness の関係を書く。
- `10_Scope-Mapping-to-AST-CFG-DFG.md` で、verification の各類型を AST / CFG / DFG に写像する。
