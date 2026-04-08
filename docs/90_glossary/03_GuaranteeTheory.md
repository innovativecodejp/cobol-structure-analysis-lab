# Glossary 3. Guarantee Theory

This document defines the constituent elements of the Guarantee concept.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Guarantee** | Guarantee | 移行プロセスにおいて維持または満たされるべきシステムの性質や振る舞い。「正しさ」の基本単位。定量的には $0$ から $1$ の値を取る。 | $g \in [0,1]$ | [[Guarantee Unit]], [[Invariant]] |
| **Guarantee Unit** | Guarantee | 保証を検証・維持する最小の機能単位。L1（文）からL5（業務機能）までの階層を持つ。 | $U \subseteq Program$ | [[Guarantee Layer]] |
| **Guarantee Composition** | Guarantee | 複数の小さな保証を組み合わせて、より大きな保証を構成する操作または理論。 | $G(Parent) = \bigwedge_{child} G(child)$ | [[Guarantee Unit]], [[Guarantee Lattice]] |
| **Guarantee Order** | Guarantee | 保証の強さや包含関係に基づく順序関係。「保証Aは保証Bよりも強い（A implies B）」などの関係。 | Partial order $\leq$ on Guarantee Space: $g_a \leq g_b \iff b \implies a$ | [[Guarantee Lattice]] |
| **Guarantee Equivalence** | Guarantee | 2つのプログラム要素が、保証の観点で「等価」であるとみなされるための条件。 | $S_A \equiv S_B \iff G(S_A) = G(S_B)$ | [[Semantic Equivalence]] |
| **Guarantee Layer** | Guarantee | 保証の階層レベル。L1（文レベル）からL5（業務機能レベル）までの抽象度。 | $L_i$ where $i \in \{1,2,3,4,5\}$ | [[Guarantee Unit]] |
| **Guarantee Violation** | Guarantee | 保証が満たされない状態。移行失敗やシステム不整合の原因となる。 | $\neg G(S)$ | [[Guarantee]], [[Migration Risk]] |
| **Guarantee Verification** | Guarantee | 保証が実際に満たされているかを検証するプロセスや手法。 | - | [[Guarantee]], [[Verification Strategy]] |
| **Invariant** | Guarantee | プログラムの実行を通じて常に真であるべき条件や性質。 | $I: State \to Boolean$ | [[Guarantee]] |
| **Semantic Equivalence** | Guarantee | 構文は異なるが意味的に同等なプログラム要素間の関係。 | $S_1 \equiv_sem S_2$ | [[Guarantee Equivalence]] |