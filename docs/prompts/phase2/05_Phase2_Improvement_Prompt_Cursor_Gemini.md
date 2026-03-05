# Cursor / Gemini 実行プロンプト

## Phase2 改善対応（完全版）

あなたは
**離散数学・順序理論・最適化理論の研究者**として振る舞ってください。

既存の Phase2 文書群

    10_Migration-Path-Theory.md
    11_Migration-Complexity.md
    12_Guarantee-Dynamics.md
    13_Optimization-Landscape.md

を **理論的一貫性を強化するために改訂**してください。

目的

    Phase2 を完全な Migration Optimization Theory として統合する

出力は **4ファイルの改訂版 Markdown** としてください。

------------------------------------------------------------------------

# 改訂タスク

以下の改善点を必ず反映してください。

------------------------------------------------------------------------

# 1 Migration Path Theory の改善

次の理論接続を追加してください。

    Migration Path = Linear Extension of Poset

さらに以下の関係を明示してください。

    |Paths| = e(P)

ここで

    e(P) = number of linear extensions of poset (P, ≤_D)

これにより

    Migration Path Space
    = Linear Extension Space

が成立することを説明してください。

------------------------------------------------------------------------

# 2 Migration Complexity の改善

Migration Complexity の定義を

    Minimum Path Cost

として明確化してください。

追加する式

    C = MinCost(⊥, ⊤)

さらに以下の関係を明示してください。

    C = d_min(⊥, ⊤)

これは Phase2 の後半で定義される

    Energy Function

と一致することを説明してください。

------------------------------------------------------------------------

# 3 Guarantee Dynamics の改善

Activation Potential の定義を厳密化してください。

現在

    Unlock(p)

のみを使用していますが、

    Unlock(p) − S

を用いて

    新たに活性化される保証

を明確にしてください。

修正定義

    Potential(p | S) =
    |(Unlock(p) \ S) ∩ Available(S ∪ {p})|

これにより

    Activation = newly available guarantees

という意味を明確化してください。

------------------------------------------------------------------------

# 4 Optimization Landscape の改善

Barrier の定義を勾配定義と一致させてください。

現在

    ΔE(S,T)

となっている箇所を

    ΔE(S,p)

へ統一してください。

最終式

    Barrier(S)
    ⇔ ∀ p ∈ Available(S), ΔE(S,p) > Threshold

------------------------------------------------------------------------

# 5 Phase2 全体構造の明示

最後の章（13章）に以下の理論構造を追加してください。

    Guarantee Space
        ↓
    Distributive Lattice
        ↓
    Dependency Poset
        ↓
    Linear Extensions
        ↓
    Migration Paths
        ↓
    Migration Complexity
        ↓
    Guarantee Dynamics
        ↓
    Optimization Landscape

これにより

    Migration = Discrete Optimization Problem

であることを明示してください。

------------------------------------------------------------------------

# 出力

以下の4ファイルを改訂版として出力してください。

    10_Migration-Path-Theory.md
    11_Migration-Complexity.md
    12_Guarantee-Dynamics.md
    13_Optimization-Landscape.md

------------------------------------------------------------------------

# 注意

-   数学記号は LaTeX 形式で書く
-   構造の一貫性を保つ
-   Mermaid 図は維持する
-   章番号は変更しない
