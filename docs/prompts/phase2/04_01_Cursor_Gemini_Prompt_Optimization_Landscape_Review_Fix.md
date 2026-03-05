# Cursor / Gemini Prompt

## Optimization Landscape 文書 改訂指示（レビュー対応）

あなたは
**形式理論・離散数学・最適化理論の研究者**として振る舞ってください。

既存文書

    13_Optimization-Landscape.md

を **数学的一貫性と理論的厳密性を高めるために改訂**してください。

目的

    Guarantee Space 上の Optimization Landscape を
    離散最適化問題として厳密化すること

出力は **完全な改訂版 Markdown 文書**としてください。

------------------------------------------------------------------------

# 改訂タスク

以下の4つの改善を必ず反映してください。

------------------------------------------------------------------------

# 1 Energy と Path Cost の一致

現在

    E(S) = Σ w(p)

と定義されていますが、以下の重要な性質を追加してください。

    Cost(Path_{∅→S}) = E(S)

つまり

    Energy = shortest path distance from the origin

であることを説明してください。

これにより

    Optimization Landscape
    = Shortest Path Geometry

という関係を明確にしてください。

------------------------------------------------------------------------

# 2 Energy Gradient の導入

Optimization Landscape の概念を強化するため、
状態におけるエネルギー勾配を定義してください。

    ΔE(S,p) = E(S ∪ {p}) − E(S)

基本モデルでは

    ΔE(S,p) = w(p)

となります。

さらに拡張として

    w(p | S)

という状態依存コストも説明してください。

------------------------------------------------------------------------

# 3 Migration Valley の数学的定義

現在 Valley は説明的概念になっています。

以下のような数学的定義を導入してください。

    Valley =
    { S ∈ G_dep | E(S) − d(∅,S) ≤ ε }

ここで

    d(∅,S)

は最短経路距離です。

つまり Valley とは

    optimal path に近い状態集合

であることを説明してください。

------------------------------------------------------------------------

# 4 Global Optimal Path の離散定義

現在

    ∫ Cost(dS)

という連続表現になっています。

Guarantee Space は離散構造であるため、 以下の形に書き直してください。

    Path_opt = argmin Σ w(p_i)

これは

    Shortest Path Problem on the Guarantee Transition Graph

と等価であることを説明してください。

------------------------------------------------------------------------

# 出力構造

以下の章構造で Markdown 文書を生成してください。

    1 Purpose
    2 State Cost
    3 Energy Function
    4 Landscape Geometry
    5 Energy Gradient
    6 Migration Valley
    7 Barriers and Local Optima
    8 Global Optimal Path
    9 Visualization
    10 Conclusion

------------------------------------------------------------------------

# 重要

以下の数学構造を明確にしてください。

    Guarantee Space → Distributive Lattice
    Dependency → Poset
    Migration Path → Linear Extension
    Transition Graph → DAG
    Energy → Path Cost
    Optimization → Shortest Path Problem

------------------------------------------------------------------------

# 出力

    13_Optimization-Landscape.md
    （完全改訂版）
