# 11_Migration-Complexity

# 1. Purpose

本稿では、COBOL移行プロジェクトの「難易度」を定量化するための数学的指標として **Migration Complexity（移行複雑度）** を定義する。
従来のグラフ理論的アプローチに加え、順序理論（Order Theory）および最適化理論（Optimization Theory）の観点から理論を厳密化し、移行コストの本質的な構造を明らかにする。

# 2. Migration Distance

Guarantee Transition Graph $G_{trans} = (V, E)$ 上の2つの状態 $S, T \in V$ （ただし $S \subseteq T$）間の距離 $d(S, T)$ を以下のように定義する。

$$
d(S, T) = |T \setminus S|
$$

これは、状態 $S$ から状態 $T$ へ到達するために追加が必要な **保証性質の個数** を表す。
Atomic Migration Step の定義より、各ステップで保証性質は1つずつ追加されるため、パス上の距離はステップ数と一致する。

$$
d(S, T) = L(Path_{S \to T})
$$

# 3. Migration Cost

移行コストをより現実的にモデル化するため、導入順序に依存するコスト関数を定義する。

## 3.1 状態依存重み関数

各保証性質 $p \in \mathbb{P}$ の導入コストは、その時点での保証状態 $S$ に依存すると仮定する。
重み関数 $w$ を以下のように定義する。

$$
w : \mathbb{P} \times V \to \mathbb{R}_{\geq 0}
$$

ここで $w(p \mid S)$ は、現在の保証状態が $S$ であるときに、新たな性質 $p$ を導入するためのコスト（リスクや工数）を表す。

## 3.2 パスコスト

ある移行パス $Path = (S_0, \dots, S_n)$ のコスト $Cost(Path)$ は、パス上で発生する状態依存コストの総和として定義される。

$$
Cost(Path) = \sum_{i=1}^{n} w(p_i \mid S_{i-1})
$$

ここで $S_i = S_{i-1} \cup \{p_i\}$ である。
この定義により、同じ保証性質の集合を追加する場合でも、**導入する順序によって総コストが変動する** という現実的な特性を表現できる。

# 4. Minimum Migration Cost

始点 $S$ から終点 $T$ への移行における最小コストを以下のように定義する。

$$
MinCost(S, T) = \min \{ Cost(Path) \mid Path \in \mathcal{P}_{S \to T} \}
$$

ここで $\mathcal{P}_{S \to T}$ は、状態 $S$ から $T$ へのすべての有効な移行パスの集合である。
この最小化問題は、重み付きグラフ上の **Shortest Path Problem（最短経路問題）** に帰着される。

これは Phase 2 後半で定義される **Energy Function** の差分（あるいは到達エネルギー）と一致する概念である。

$$
MinCost(\bot, S) = E(S)
$$

# 5. Migration Complexity

プロジェクト全体の移行複雑度 $C$ を、始点 $\bot$ から終点 $\top$ への最小移行コストとして定義する。

$$
C = MinCost(\bot, \top) = \min_{Path} \sum_{i=1}^{n} w(p_i \mid S_{i-1})
$$

さらに、最短経路距離の記法を用いて以下のように表現できる。

$$
C = d_{min}(\bot, \top)
$$

## 5.1 Optimization Problem

Migration Complexity を求めることは、以下の最適化問題を解くことと等価である。

- **Objective**: Minimize Total Cost
- **Constraints**: 
    - Path must be valid in $G_{trans}$ (Dependent Guarantee Space).
    - Start at $\bot$, End at $\top$.

# 6. Structural Factors

Migration Complexity は、コストだけでなく、構造的な複雑さにも依存する。

## 6.1 Order Complexity (Linear Extensions)

Guarantee Dependency は半順序集合（Poset） $(P, \leq_D)$ を形成する。
Migration Path は、この Poset の **Linear Extension（線形拡張）** に対応する。

$$
Migration \ Path \cong Linear \ Extension \ of \ (P, \leq_D)
$$

**Order Complexity** を、可能な Linear Extension の総数 $e(P)$ として定義する。
$e(P)$ が大きいほど、選択可能なパスが多くなり、最適化の探索空間が広がる（計算複雑度が増大する）ことを意味する。

## 6.2 Branching Factor (Branch)

各状態 $S$ における選択肢の多さを **Branching Factor** として定義する。

$$
Branch(S) = | \{ p \in \mathbb{P} \setminus S \mid S \cup \{p\} \in G_{dep} \} |
$$

これは、現在の状態 $S$ に対して、依存制約を満たしつつ次に追加可能な保証性質の数を表す。
平均分岐係数が高いほど、柔軟性が高い一方で、最適経路探索の難易度は上がる。

# 7. Normalized Complexity

複雑度をプロジェクトの規模（総コストの期待値）で正規化した指標を定義する。
基準となる総コスト $\mu(\mathbb{P})$ を、文脈に依存しない基本重み $w_0(p)$ の総和とする。

$$
\mu(\mathbb{P}) = \sum_{p \in \mathbb{P}} w_0(p)
$$

**Normalized Complexity $\bar{C}$**:

$$
\bar{C} = \frac{C}{\mu(\mathbb{P})}
$$

- $\bar{C} < 1$: 順序最適化により、基本コストよりも効率的に移行可能（シナジー効果）。
- $\bar{C} > 1$: 順序制約や状態依存コストにより、基本コスト以上の労力が必要（摩擦コスト）。

# 8. Discussion

## 8.1 数学的構造のまとめ

本理論は以下の数学的構造に基づいている。

| Concept | Mathematical Structure |
| :--- | :--- |
| **Guarantee Space** | Distributive Lattice (分配束) |
| **Dependency** | Poset (半順序集合) |
| **Migration Path** | Linear Extension (線形拡張) |
| **Cost** | Functional on Path (汎関数) |
| **Complexity** | Optimization Problem (最適化問題) |

## 8.2 実践的意義

この理論により、単なる「工数見積もり」を超えて、「どの順序で移行すれば最も効率的か」を科学的に決定することが可能となる。
特に $w(p \mid S)$ を適切に設定することで、リスク回避や早期の価値実現（Early Value Delivery）を考慮した計画策定ができる。

# 9. Conclusion

Migration Complexity の再定義により、移行難易度を「最適経路における最小コスト」として厳密に定式化した。
状態依存コストとLinear Extensionの概念を導入することで、順序最適化の重要性が数学的に裏付けられた。
これにより、COBOL移行プロジェクトは、経験則ではなく数理最適化のアプローチによって管理可能な対象となる。
