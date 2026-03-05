# Gemini 3 Prompt

## Guarantee Dynamics 文書 改訂指示

あなたは **形式的理論設計の研究者**として振る舞ってください。

以下の既存文書

    12_Guarantee-Dynamics.md

を **数学的整合性と理論的接続を強化する形で改訂**してください。

目的は

    Guarantee Dynamics 理論の厳密化

です。

出力は **Markdown形式の完全改訂版論文**としてください。

------------------------------------------------------------------------

# 改訂タスク

以下の改善を必ず反映してください。

------------------------------------------------------------------------

# 1 Migration Path との理論接続

既存理論では

    Migration Path = Linear Extension of the dependency poset

です。

したがって Dynamics は

    Linear Extension の時間的実行

として説明してください。

追加する説明

    A migration execution corresponds to the temporal realization
    of a linear extension of the dependency poset (P, ≤D).

つまり

    Dynamics = execution of linear extension

という理論構造を明確にしてください。

------------------------------------------------------------------------

# 2 Activation Potential の厳密化

現在

    Potential(p | S)

は Available(S) を使って定義されていますが、
依存構造を使って以下の概念を導入してください。

    Unlock(p)
    = { q ∈ P | p ≤_D q }

そして

    Potential(p | S)
    = | Unlock(p) ∩ Available(S ∪ {p}) |

として書き直してください。

------------------------------------------------------------------------

# 3 Critical Guarantee の中心性定義

Critical Guarantee を **中心性 (centrality)**
の概念として再定義してください。

導入する指標

    Dependency Centrality

    C_dep(p) =
    | { q ∈ P | p ≤_D q } |

必要であれば

    Path Centrality

    C_path(p) =
    number of migration paths containing p

も補足として説明してください。

------------------------------------------------------------------------

# 4 Bottleneck Guarantee の厳密定義

現在は説明的記述なので、以下の定義を導入してください。

### Dominance

    p dominates q
    iff
    every migration path to q passes through p

### Bottleneck Guarantee

    p is bottleneck
    if removing p significantly reduces reachable goal states
    or reachable paths

また

    Cut Vertex
    Dominator

との関係を説明してください。

------------------------------------------------------------------------

# 5 Dynamics と Optimization の接続

Guarantee Dynamics を以下と接続してください。

    Cost(Path)
    ↓
    Minimum Cost Path
    ↓
    Optimal Migration Dynamics

つまり

    optimal migration execution
    = minimum cost path in the transition graph

という関係を説明してください。

------------------------------------------------------------------------

# 出力構造

以下の章構造で Markdown 文書を生成してください。

    1 Purpose
    2 Guarantee State Evolution
    3 Dependency Activation
    4 Activation Potential
    5 Critical Guarantees
    6 Bottleneck Guarantees
    7 Dynamics Interpretation
    8 Relation to Migration Optimization
    9 Conclusion

------------------------------------------------------------------------

# 重要

以下の数学構造を明確にしてください。

    Guarantee Space → Distributive Lattice
    Dependency → Poset
    Migration Path → Linear Extension
    Dynamics → Execution of Linear Extension
    Optimization → Minimum Cost Path

------------------------------------------------------------------------

# 出力

    12_Guarantee-Dynamics.md
    （完全改訂版）
