# 09_Guarantee-Transition-Graph

# 1. 目的

本稿では、Dependent Guarantee Space ($G_{dep}$) を **状態遷移空間（State Transition Space）** として定義し、その数学的構造を **Guarantee Transition Graph** として定式化する。
これにより、移行プロセスを「グラフ上の経路探索問題」として扱うための理論的基盤を確立する。

# 2. Guarantee Transition Graph の定義

Guarantee Space を以下の有向グラフとして定義する。

$$
G_{trans} = (V, E)
$$

## 2.1 頂点集合（State Set）

頂点集合 $V$ は、Dependent Guarantee Space そのものである。

$$
V = G_{dep} = Idl(\mathbb{P}, \leq_D)
$$

各頂点 $S \in V$ は、システムのある時点における **有効な保証状態（Valid Guarantee State）** を表す。
これは順序集合 $(\mathbb{P}, \leq_D)$ のイデアル（下側閉集合）に対応する。

頂点数（状態空間の大きさ）は、依存関係 $D$ に制約されるため、以下の不等式を満たす。
$$
|V| \leq 2^{|\mathbb{P}|}
$$
依存関係が強いほど、有効な状態数 $|V|$ は減少する。

## 2.2 辺集合（Transition Set）

辺集合 $E$ は、束の被覆関係（Cover Relation）によって定義される。

$$
E = \{ (S, T) \in V \times V \mid S \lessdot T \}
$$

ここで、被覆関係 $S \lessdot T$ は以下のように定義される。

$$
S \lessdot T \iff T = S \cup \{p\} \land p \notin S \land Cl_D(S \cup \{p\}) = S \cup \{p\}
$$

すなわち、**単一の保証性質 $p$ を追加する操作が、依存制約を満たしつつ状態を拡張する場合** にのみ、状態遷移（エッジ）が存在する。

# 3. グラフの性質

## 3.1 有向非巡回グラフ（DAG）

$G_{trans}$ は **DAG (Directed Acyclic Graph)** である。

**証明**:
任意のエッジ $(S, T) \in E$ について、被覆関係の定義より
$$
S \subset T
$$
が成立する（真部分集合である）。
したがって、集合の濃度（Cardinality）は厳密に増加する。
$$
|T| > |S|
$$
状態遷移は常に集合サイズを増加させるため、元の状態に戻る閉路（Cycle）は存在し得ない。 $\square$

## 3.2 階層構造（Weighted Graded Structure）

$G_{trans}$ は階層的な構造を持つ。
Guarantee Measure $\mu: G_{dep} \to \mathbb{R}_{\geq 0}$ が定義されていると仮定し、ランク関数（Rank Function） $\rho$ を以下のように定義する。

$$
\rho(S) = \mu(S) = \sum_{p \in S} w(p)
$$

任意のエッジ $(S, T)$ について、$\rho(T) = \rho(S) + w(p)$ （ここで $T = S \cup \{p\}$）となり、常にランクが増加する。
これにより、グラフは測度 $\mu$ に基づく重み付き階層構造（Weighted Graded Structure）として解釈できる。

## 3.3 Hypercube Graph との関係

Guarantee Space $G = \mathcal{P}(\mathbb{P})$ のグラフ構造は、$N$次元ハイパーキューブグラフ $\{0, 1\}^N$ と同型である（$N = |\mathbb{P}|$）。

$G_{trans}$ は、この **Hypercube Graph の部分グラフ（Subgraph）** である。
依存関係 $D$ により、有効条件を満たさない頂点（Non-Ideal states）と、依存関係を満たさない遷移（Invalid transitions）が除去されているためである。

## 3.4 始点と終点

- **Source（始点）**:
  $\bot = \emptyset$ （保証なし、空集合）。
  常に $G_{dep}$ に含まれる。

- **Sink（終点）**:
  $\top = \mathbb{P}$ （完全保証、全集合）。
  依存関係 $D$ が $\mathbb{P}$ 内で完結している限り、常に $G_{dep}$ に含まれる。

# 4. 移行ダイナミクス（Migration Dynamics）

このグラフ構造に基づき、移行プロセスを以下のように定義する。

## 4.1 移行パス（Migration Path）

始点 $\bot$ から終点 $\top$ へのパスを **Migration Path** と呼ぶ。

$$
Path = (S_0, S_1, \dots, S_n)
$$

- $S_0 = \bot$
- $S_n = \top$
- $(S_i, S_{i+1}) \in E$ （各ステップは有効な原子的遷移）

## 4.2 Migration Optimization Problem

移行計画の最適化は、以下の問題に帰着される。

**問題**: Guarantee Transition Graph 上において、始点 $\bot$ から終点 $\top$ へのパスのうち、コスト（例えばリスクや工数の総和）を最小化するものを求めよ。

これは、エッジ重みを適切に設定することで、グラフ理論における **最短経路問題（Shortest Path Problem）** として定式化できる。
$G_{trans}$ が DAG であるため、動的計画法（DP）やダイクストラ法を用いて効率的に解くことが可能である。

# 5. 結論

Guarantee Transition Graph の定義により、COBOL移行における「保証の積み上げ」プロセスは、数学的に **有限分配束のハッセ図（Hypercubeの部分グラフ）上のパス探索** と等価になった。
このグラフは以下の特性を持つ：
1.  **有限性**: 頂点数は $|V| \leq 2^{|\mathbb{P}|}$。
2.  **有向性**: DAGであり、常に保証強度 $\mu(S)$ が増加する方向へ進む。
3.  **整合性**: すべての状態と遷移が依存関係と整合している。
