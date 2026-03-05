# Gemini Prompt

## Migration Complexity 文書 改善対応

あなたは **形式的理論設計の研究者**として振る舞ってください。
以下の既存文書

    11_Migration-Complexity.md

を **数学的一貫性を高めるために改訂**してください。

目的は

    Migration Complexity 理論の厳密化

です。

出力は **Markdown形式の完全な論文改訂版**としてください。

------------------------------------------------------------------------

# 改訂タスク

以下の5つの改善を必ず反映してください。

------------------------------------------------------------------------

# 1 Migration Path の厳密定義

現在の定義

    Path = (S0,...,Sn)

はグラフ理論表現であり、構造を完全に表現していません。

Guarantee Dependency は

    (P, ≤D)

という **poset** です。

したがって

    Migration Path = Linear Extension of the Poset

と定義してください。

具体的には

    A migration path corresponds to a linear extension of the dependency poset (P, ≤D).

を導入してください。

説明も追加してください。

------------------------------------------------------------------------

# 2 Cost 定義の強化

現在

    Cost(Path) = Σ w(p)

ですが、現実の移行では

    導入順序依存コスト

が存在します。

したがって

    w : P × G → R≥0

を導入してください。

つまり

    w(p | S)

です。

改訂定義

    Cost(Path)
    = Σ w(p_i | S_{i-1})

この定義を正式なモデルとして追加してください。

------------------------------------------------------------------------

# 3 Complexity の構造的要因の強化

Migration Complexity は

    cost complexity
    + order complexity

に分解できます。

ここで

    order complexity

とは

    Number of Linear Extensions

です。

この概念を追加してください。

------------------------------------------------------------------------

# 4 Branching Factor の数学定義

現在説明のみなので、以下を追加してください。

    Branch(S)
    = | { p ∉ S | S ∪ {p} ∈ G_dep } |

これは

    追加可能保証数

を表します。

------------------------------------------------------------------------

# 5 Normalized Complexity の改善

現在

    C̄ = C / |P|

ですが

    μ(P) = Σ w(p)

を用いて

    C̄ = C / μ(P)

として定義し直してください。

------------------------------------------------------------------------

# 出力形式

以下の構造を持つ Markdown 文書を生成してください。

    1 Purpose
    2 Migration Distance
    3 Migration Cost
    4 Minimum Migration Cost
    5 Migration Complexity
    6 Structural Factors
    7 Normalized Complexity
    8 Discussion
    9 Conclusion

必要に応じて数式を使用してください。

------------------------------------------------------------------------

# 重要

以下の数学構造を明確に示してください。

    Guarantee Space → Distributive Lattice
    Dependency → Poset
    Migration Path → Linear Extension
    Cost → Functional
    Complexity → Optimization Problem

------------------------------------------------------------------------

# 出力

    11_Migration-Complexity.md
    （完全改訂版）
