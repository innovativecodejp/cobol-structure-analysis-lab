# 12_Guarantee-Dynamics

# 1. Purpose

本稿では、COBOL移行プロセスにおける「保証の時間的進化」を **Guarantee Dynamics（保証ダイナミクス）** として体系化する。
Migration Path が依存関係（Poset）の静的な線形拡張（Linear Extension）であるのに対し、Dynamics はその「時間的実行（Temporal Realization）」に焦点を当てる。
本稿では、依存関係の構造的特徴から導かれる活性化ポテンシャル、クリティカル性、ボトルネック性を数学的に厳密に定義し、移行最適化問題との接続を明確にする。

# 2. Guarantee State Evolution

移行プロジェクトにおける保証状態の時間変化をモデル化する。

## 2.1 Discrete Time Model

時間を離散的なステップ $t \in \{0, 1, \dots, n\}$ とする。
時刻 $t$ における保証状態を $S_t \in G_{dep}$ とする。

状態の進化は以下の遷移則に従う。

$$
S_{t+1} = S_t \cup \{p_{t+1}\}
$$

ここで $p_{t+1} \in \mathbb{P} \setminus S_t$ であり、かつ依存制約 $Cl_D(S_t \cup \{p_{t+1}\}) = S_t \cup \{p_{t+1}\}$ を満たす。

このプロセスは、空集合 $\emptyset$ から始まり、全集合 $\mathbb{P}$ へ至るまでの「保証の累積過程（Accumulation Process）」として記述される。

# 3. Dependency Activation

ある保証性質 $p$ の追加は、単にその性質自体を獲得するだけでなく、それに依存する他の性質を「解放（Unlock）」または「活性化（Activate）」する役割を持つ。

## 3.1 Definition

保証性質 $p \in \mathbb{P}$ によって直接的または間接的に活性化される可能性のある性質の集合を $Unlock(p)$ と定義する。

$$
Unlock(p) = \{ q \in \mathbb{P} \mid p \leq_D q \}
$$

これは依存関係 Poset における $p$ の上側集合（Upper Set / Filter）に相当する。

# 4. Activation Potential

状態 $S$ において、次に追加可能な候補集合を $Available(S)$ とする。

$$
Available(S) = \{ q \in \mathbb{P} \setminus S \mid S \cup \{q\} \in G_{dep} \}
$$

ある性質 $p \in Available(S)$ を追加することによる即時的な効果を、その性質の **Activation Potential** として厳密に定義する。

$$
Potential(p \mid S) = | (Unlock(p) \setminus S) \cap Available(S \cup \{p\}) |
$$

これは、「$p$ を追加することによって、**新たに** $Available$ 集合に追加される性質（newly available guarantees）の数」を表す。
高い Potential を持つ性質を優先的に導入することで、後の選択肢（Branching Factor）を広げ、プロジェクトの柔軟性を高めることができる。

# 5. Critical Guarantees

依存関係グラフ $(\mathbb{P}, \leq_D)$ の構造に基づき、プロジェクト全体に対して重要な役割を果たす保証性質を定義する。

## 5.1 Dependency Centrality

保証性質 $p$ が多数の他の性質の前提条件となっている場合、これを **Critical Guarantee** と呼ぶ。
この重要度を **Dependency Centrality** として定量化する。

$$
C_{dep}(p) = | \{ q \in \mathbb{P} \mid p \leq_D q \} |
$$

これは $Unlock(p)$ の濃度に等しい。
$C_{dep}(p)$ が大きい性質は、移行の早期段階で確立されるべき「基盤的保証（Foundational Guarantee）」である（例：構文解析の正確性、データ型の整合性など）。

## 5.2 Path Centrality (Supplementary)

補足として、ある性質 $p$ がどれだけの数の有効な移行パスに含まれるか（あるいは通過するか）を示す **Path Centrality** も有用である。

$$
C_{path}(p) = \text{number of migration paths containing } p
$$

ただし、Atomic Step の定義上、すべてのパスはすべての要素を含むため、順序制約としての「順序の自由度への影響」を考慮する場合に意味を持つ。

# 6. Bottleneck Guarantees

多数の（あるいはすべての）有効な移行パスが、必ず通過しなければならない特定の順序や状態を支配する保証性質を **Bottleneck Guarantee** と呼ぶ。

## 6.1 Dominance

保証性質間の支配関係を以下のように定義する。

$$
p \text{ dominates } q \iff \forall Path \in \mathcal{P}_{\bot \to q}, \ p \in Path
$$

これは、グラフ理論における Dominator の概念を移行パスに適用したものである。
（注：Atomic Step の定義上、すべての要素が含まれるため、ここでは「順序的な支配（$p$ が完了しないと $q$ が開始できない）」、すなわち $p \leq_D q$ と同義になるが、より複雑な依存条件を持つモデルでは区別される）

## 6.2 Bottleneck Definition

ある性質 $p$ が **Bottleneck** であるとは、もし $p$ が除去された（達成不可能となった）場合に、到達可能なゴール状態の割合や有効なパスの数が著しく減少することを意味する。

$$
p \text{ is bottleneck } \iff |G_{dep}(\mathbb{P} \setminus \{p\})| \ll |G_{dep}(\mathbb{P})|
$$

グラフ理論的には、$G_{trans}$ における **Cut Vertex（切断点）** や **Bridge（橋）** に近い概念として解釈できる。

# 7. Dynamics Interpretation

Migration Path が Poset の Linear Extension であることから、Guarantee Dynamics は以下のように解釈される。

$$
Dynamics = \text{Execution of Linear Extension}
$$

つまり、移行プロセスとは、依存関係という半順序制約を満たしながら、時間を追って全順序（Linear Order）を実現していく過程である。
この過程において、Activation Potential や Criticality は、次にどのステップを選択すべきかの「局所的な指針（Local Heuristics）」を提供する。

# 8. Relation to Migration Optimization

Guarantee Dynamics は、最終的に移行最適化問題へと接続される。

1.  **Cost Function**: 各ステップにコスト（重み）を付与する。
2.  **Minimum Cost Path**: 全体のコストを最小化するパスを探索する。
3.  **Optimal Dynamics**: 最小コストパスに沿った実行プロセスこそが、最適なダイナミクスである。

$$
\text{Optimal Migration Execution} = \text{Minimum Cost Path in } G_{trans}
$$

この関係性により、動的なプロジェクト管理（Dynamics）は、静的なグラフ上の最短経路問題（Optimization）として数学的に解くことが可能となる。

# 9. Conclusion

本稿では、Guarantee Dynamics を Linear Extension の時間的実行として再定義し、Activation Potential や Criticality などの指標を厳密化した。
これにより、移行プロセスは単なる作業リストの消化ではなく、依存関係の構造的特性を利用した戦略的な状態遷移プロセスとして捉え直された。
この理論的枠組みは、次フェーズにおけるコスト最適化（Optimization Landscape）の基礎となる。
