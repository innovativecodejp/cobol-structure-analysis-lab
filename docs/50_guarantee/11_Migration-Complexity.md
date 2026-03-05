# 11_Migration-Complexity

# 1. 目的

本稿では、COBOL移行プロジェクトの「難易度」を定量化するための数学的指標として **Migration Complexity（移行複雑度）** を定義する。
Guarantee Transition Graph 上の経路探索問題に基づき、最小コストパス（Minimum Cost Path）の概念を用いて、移行に要する本質的なコストを定式化する。

# 2. Migration Distance（移行距離）

Guarantee Transition Graph $G_{trans} = (V, E)$ 上の2つの状態 $S, T \in V$ （ただし $S \subseteq T$）間の距離 $d(S, T)$ を以下のように定義する。

$$
d(S, T) = |T \setminus S|
$$

これは、状態 $S$ から状態 $T$ へ到達するために追加が必要な **保証性質の個数** を表す。
Atomic Migration Step の定義より、各ステップで保証性質は1つずつ追加されるため、パス上の距離はステップ数と一致する。

$$
d(S, T) = L(Path_{S \to T})
$$

# 3. Migration Cost（移行コスト）

各保証性質 $p \in \mathbb{P}$ に対して、その導入や維持にかかるコストを表す重み関数 $w: \mathbb{P} \to \mathbb{R}_{\geq 0}$ を定義する。
ある移行パス $Path = (S_0, \dots, S_n)$ のコスト $Cost(Path)$ は、パス上で追加されるすべての保証性質の重みの総和として定義される。

$$
Cost(Path) = \sum_{i=0}^{n-1} w(p_{i+1}) \quad \text{where } S_{i+1} = S_i \cup \{p_{i+1}\}
$$

これは、パス全体で追加される保証性質集合 $S_n \setminus S_0$ の重み付き和（Measure）と等価である。

$$
Cost(Path) = \mu(S_n \setminus S_0) = \sum_{p \in S_n \setminus S_0} w(p)
$$

**重要な性質**:
Atomic Migration Step において $Cl_D(S \cup \{p\}) = S \cup \{p\}$ （単一要素追加）が保証されている場合、どのような経路を通っても最終的に追加される保証性質の集合は同一（$\mathbb{P}$ 全体）である。
したがって、重み $w(p)$ が状態や順序に依存しない定数である限り、**すべての完全な移行パスのコストは一定値 $\mu(\mathbb{P})$ となる**。

$$
\forall Path: \bot \to \top, \quad Cost(Path) = \mu(\mathbb{P})
$$

しかし、現実のプロジェクトでは、導入順序によってコストが変動する場合がある（例：ある保証 $p$ を先に導入すると、別の保証 $q$ の導入コストが下がる、あるいはリスクが増大するなど）。
より高度なモデルでは、重み関数を状態依存 $w(p \mid S)$ として定義する必要があるが、本稿ではまず基本モデルとして定数重みを扱う。

# 4. Minimum Migration Cost（最小移行コスト）

始点 $S$ から終点 $T$ への移行における最小コストを以下のように定義する。

$$
MinCost(S, T) = \min \{ Cost(Path) \mid Path \text{ is a valid migration path from } S \text{ to } T \}
$$

前述の通り、重みが定数であればすべてのパスは等コストであるが、重みが変動する場合や、リスクをコストとしてモデル化する場合、この最小化問題は意味を持つ。

# 5. Migration Complexity（移行複雑度）

プロジェクト全体の移行複雑度 $C$ を、始点 $\bot$ から終点 $\top$ への最小移行コストとして定義する。

$$
C = MinCost(\bot, \top) = \min_{Path} \sum_{p \in Path} w(p)
$$

## 5.1 構造的要因による解釈

Migration Complexity は以下の構造的要因に依存する。

1.  **Dependency Depth（依存深さ）**:
    依存関係の連鎖が長いほど、順序制約が厳しくなり、選択可能なパスが制限される。これは柔軟性の低下（複雑度の増大）として解釈できる。

2.  **Guarantee Count（保証数）**:
    保証性質の総数 $|\mathbb{P}|$ が多いほど、ステップ数が増え、累積コスト $C$ は増大する。

3.  **Branching Factor（分岐係数）**:
    各状態で選択可能な次のステップ（Atomic Steps）の数。分岐が多いほど選択肢が増え、最適化の余地が生まれるが、探索空間も広がる。

## 5.2 Normalized Complexity（正規化複雑度）

複雑度を保証数で正規化した指標も有用である。

$$
\bar{C} = \frac{C}{|\mathbb{P}|}
$$

これは「保証性質1つあたりの平均導入コスト」を表す。

# 6. 結論

Migration Complexity を定義することで、移行プロジェクトの難易度を定量的に評価する枠組みが整った。
基本モデルではコストは経路によらず一定だが、この定義は将来的に「順序依存コスト」や「リスク許容度」を導入した際の最適化指標として機能する。
次フェーズでは、この複雑度を最小化するための具体的な最適化アルゴリズムについて論じる。
