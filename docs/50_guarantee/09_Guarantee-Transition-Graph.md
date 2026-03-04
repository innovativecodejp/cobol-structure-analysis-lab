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

**理由**:
任意のエッジ $(S, T)$ について、包含関係 $S \subset T$ が成立するため、集合の濃度（Cardinality）は厳密に増加する ($|S| < |T|$)。
したがって、閉路（Cycle）は存在し得ない。

## 3.2 階層構造（Graded Poset）

$G_{trans}$ は **階層的半順序集合（Graded Poset）** の構造を持つ。
ランク関数（Rank Function） $\rho: V \to \mathbb{N}$ を以下のように定義できる。

$$
\rho(S) = |S|
$$

すべてのエッジ $(S, T)$ について $\rho(T) = \rho(S) + 1$ が成立する。
すなわち、グラフは $|S|$ に基づく層（Layer）構造を成す。

## 3.3 始点と終点

- **Source（始点）**:
  $\bot = \emptyset$ （保証なし、空集合）。
  これは常に $G_{dep}$ に含まれる（空集合は任意の順序集合のイデアルであるため）。

- **Sink（終点）**:
  $\top = \mathbb{P}$ （完全保証、全集合）。
  これは $\mathbb{P}$ 上の依存関係 $D$ が $\mathbb{P}$ 内で完結している限り、常に $G_{dep}$ に含まれる（全集合はイデアルであるため）。

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

## 4.2 実行可能性（Feasibility）

$G_{trans}$ 上の任意のパスは、定義により常に **Feasible（実行可能）** である。
なぜなら、すべての頂点は依存制約を満たす有効状態（Ideal）であり、すべてのエッジは有効な遷移（Cover）だからである。
これにより、グラフ上の経路探索を行うだけで、工学的に妥当な移行手順を導出できる。

# 5. 結論

Guarantee Transition Graph の定義により、COBOL移行における「保証の積み上げ」プロセスは、数学的に **有限分配束のハッセ図上のパス探索** と等価になった。
このグラフは以下の特性を持つ：
1.  **有限性**: 頂点数は最大 $2^{|\mathbb{P}|}$。
2.  **有向性**: 常に保証が増加する方向へ進む。
3.  **整合性**: すべての状態と遷移が依存関係と整合している。

次フェーズでは、このグラフに重み（コスト）を導入し、最短経路問題として最適移行計画を定式化する。
