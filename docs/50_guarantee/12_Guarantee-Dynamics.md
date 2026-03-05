# 12_Guarantee-Dynamics

# 1. 目的

本稿では、COBOL移行プロセスにおける「保証の時間的進化」を **Guarantee Dynamics（保証ダイナミクス）** として体系化する。
Migration Path が静的な「経路」であるのに対し、Dynamics は「状態がどのように遷移し、次の可能性を開くか」という動的なメカニズムに焦点を当てる。
特に、依存関係の構造的特徴から導かれる **Critical Guarantee** や **Bottleneck Guarantee** を定義し、戦略的な意思決定のための基盤を提供する。

# 2. Guarantee State Evolution（保証状態の進化）

移行プロジェクトにおける保証状態の時間変化をモデル化する。

## 2.1 離散時間モデル

時間を離散的なステップ $t \in \{0, 1, \dots, n\}$ とする。
時刻 $t$ における保証状態を $S_t \in G_{dep}$ とする。

状態の進化は以下の遷移則に従う。

$$
S_{t+1} = S_t \cup \{p_{t+1}\}
$$

ここで $p_{t+1} \in \mathbb{P} \setminus S_t$ であり、かつ依存制約 $Cl_D(S_t \cup \{p_{t+1}\}) = S_t \cup \{p_{t+1}\}$ を満たす。

このプロセスは、空集合 $\emptyset$ から始まり、全集合 $\mathbb{P}$ へ至るまでの「保証の累積過程（Accumulation Process）」として記述される。

# 3. Dependency Activation（依存活性化）

ある保証性質 $p$ の追加は、単にその性質自体を獲得するだけでなく、それに依存する他の性質を「解放（Unlock）」または「活性化（Activate）」する役割を持つ。

## 3.1 Activation Potential（活性化ポテンシャル）

状態 $S$ において、次に追加可能な候補集合を $Available(S)$ とする。

$$
Available(S) = \{ q \in \mathbb{P} \setminus S \mid S \cup \{q\} \in G_{dep} \}
$$

ある性質 $p \in Available(S)$ を追加した後の状態 $S' = S \cup \{p\}$ における候補集合の増加分を、その性質の **Activation Potential** と呼ぶ。

$$
Potential(p \mid S) = |Available(S \cup \{p\})| - |Available(S)|
$$

高い Potential を持つ性質を優先的に導入することで、後の選択肢（Branching Factor）を広げ、プロジェクトの柔軟性を高めることができる。

# 4. Critical Guarantees（クリティカル保証）

依存関係グラフ $(\mathbb{P}, \leq_D)$ の構造に基づき、プロジェクト全体に対して重要な役割を果たす保証性質を定義する。

## 4.1 Definition

保証性質 $p$ が多数の他の性質の前提条件となっている場合、これを **Critical Guarantee** と呼ぶ。
定量的には、依存関係グラフにおける $p$ の **上側集合（Upper Set / Filter）** の大きさで評価できる。

$$
Impact(p) = | \{ q \in \mathbb{P} \mid p \leq_D q \} |
$$

$Impact(p)$ が大きい性質は、移行の早期段階で確立されるべき「基盤的保証（Foundational Guarantee）」である（例：構文解析の正確性、データ型の整合性など）。

# 5. Bottleneck Guarantees（ボトルネック保証）

## 5.1 Definition

多数の（あるいはすべての）有効な移行パスが、必ず通過しなければならない特定の順序や状態を支配する保証性質を **Bottleneck Guarantee** と呼ぶ。

形式的には、ある性質 $p$ が除去された（達成不可能となった）場合に、到達不可能なゴール状態の割合（または到達不能になる総コスト）が大きいほど、その性質はボトルネック性が高いと言える。

あるいは、グラフ理論的に $G_{trans}$ における **Cut Vertex（切断点）** や **Dominator** に対応する状態を構成する要素として定義できる。

# 6. Dynamics Interpretation（ダイナミクスの解釈）

移行プロセスは、単なる作業の消化ではなく、**Guarantee Activation Process（保証活性化プロセス）** として解釈できる。

1.  **初期段階**:
    Critical Guarantees を確立し、以後のパスを「開拓」するフェーズ。
    ここでの遅延は、依存するすべてのタスクに波及するため、リソースを集中すべきである。

2.  **中期段階**:
    活性化された多数の独立した保証性質（並行作業可能なタスク）を効率的に消化するフェーズ。
    ここでは並列処理能力（チーム数など）が重要となる。

3.  **終盤段階**:
    残された依存関係の深い（Depthの深い）性質や、統合的な性質を仕上げるフェーズ。

# 7. 結論

Guarantee Dynamics の視点により、移行計画は「どのタスクをいつやるか」というスケジュール問題から、「どの保証を確立して、次の可能性を最大化するか」という戦略問題へと昇華される。
特に Critical Guarantee の特定と早期着手は、プロジェクトのリスク低減と効率化において決定的な意味を持つ。
