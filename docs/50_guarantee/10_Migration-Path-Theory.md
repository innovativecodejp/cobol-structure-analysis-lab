# 10_Migration-Path-Theory

# 1. 目的

本稿では、Phase 2 の主題である移行ダイナミクス（Migration Dynamics）の第一歩として、COBOL移行プロセスを **Migration Path** として数学的に定式化する。
Guarantee Transition Graph ($G_{trans}$) 上での経路探索問題として移行計画を定義し、その実行可能性（Feasibility）と長さ（Length）について論じる。

# 2. Migration Path の定義

Guarantee Transition Graph $G_{trans} = (V, E)$ 上において、移行プロセスを以下の経路として定義する。

$$
Path = (S_0, S_1, \dots, S_n)
$$

## 2.1 パスの条件

この経路は以下の条件を満たさなければならない。

1.  **始点（Start Condition）**:
    $$ S_0 = \bot = \emptyset $$
    プロジェクト開始時は、何も保証されていない状態から始まる。

2.  **終点（Goal Condition）**:
    $$ S_n = \top = \mathbb{P} $$
    プロジェクト完了時は、すべての性質が保証された状態に至る。
    （ただし、依存関係 $D$ が $\mathbb{P}$ 内で完結している場合。すなわち $\forall p \in \mathbb{P}, Dependency(p) \subseteq \mathbb{P}$ が成立する場合に限る）

3.  **遷移（Transition Condition）**:
    $$ (S_i, S_{i+1}) \in E $$
    各ステップは、定義された有効な遷移（Cover Relation）でなければならない。

4.  **単調増加性（Monotonicity）**:
    $$ S_i \subset S_{i+1} $$
    各ステップで保証状態は厳密に拡大する。これにより、後退（Regression）のない理想的な移行プロセスがモデル化される。

# 3. Atomic Migration Step

各ステップ $S_i \to S_{i+1}$ は **Atomic Migration Step（原子的移行ステップ）** と呼ばれる。
これは以下の形式で表される。

$$
S_{i+1} = S_i \cup \{p\}
$$

ここで $p \in \mathbb{P} \setminus S_i$ である。
ただし、遷移が有効であるためには、以下の依存閉包条件を満たす必要がある。

$$
Cl_D(S_i \cup \{p\}) = S_i \cup \{p\}
$$

すなわち、新たに追加される性質 $p$ が依存するすべての性質は、すでに $S_i$ に含まれているか、あるいは $p$ 自身で完結していなければならない。
これにより、「前提条件を満たさないまま機能を追加する」という工学的な誤りを理論的に排除する。

# 4. Linear Extension Interpretation

本章では、Migration Path と順序理論の関係について数学的な解釈を与える。

## 4.1 数学的定義

保証性質集合を $\mathbb{P}$、依存関係を $\leq_D$ とする。
$(\mathbb{P}, \leq_D)$ は部分順序集合（poset）である。

Migration Path $(S_0 \to S_1 \to \dots \to S_n)$ は、保証性質の追加順序 $(p_1, p_2, \dots, p_n)$ を誘導する。
ここで、各状態は以下のように表現できる。

$$
S_i = \{p_1, \dots, p_i\}
$$

Atomic Migration Step の定義より、次式が成立する。

$$
S_{i+1} = S_i \cup \{p_{i+1}\}
$$

## 4.2 順序保存性

依存関係の定義より、もし $p_j \leq_D p_i$ （$p_i$ が $p_j$ に依存する）ならば、依存する側（$p_i$）よりも先に依存される側（$p_j$）が追加されていなければならない。
すなわち、添字について以下の関係が成立する。

$$
p_j \leq_D p_i \implies j < i
$$

したがって、追加順序列 $(p_1, p_2, \dots, p_n)$ は、poset $(\mathbb{P}, \leq_D)$ の **線形拡張（Linear Extension）** である。

$$
\text{Migration Path Space} = \text{Linear Extension Space of } (\mathbb{P}, \leq_D)
$$

## 4.3 経路の数（Path Count）

有効な移行パスの総数は、Poset $(\mathbb{P}, \leq_D)$ の Linear Extension の総数 $e(P)$ に等しい。

$$
|Paths| = e(P)
$$

これは、移行計画の探索空間の大きさを表す指標となる。

## 4.4 理論的解釈

この結果から、Migration Path は数学的には **poset の Linear Extension** と一対一に対応することが示された。
したがって、Migration Planning（移行計画）は、無数に存在する Linear Extension の中から、コスト関数を最小化するものを選択する問題、すなわち **Topological Ordering（トポロジカルソート）の探索問題** として解釈できる。

# 5. Path Length（パス長）

移行パスの長さ $L(Path)$ を以下のように定義する。

$$
L(Path) = n
$$

一般に、閉包 $Cl_D$ によって複数の要素が同時に追加される場合、パス長は保証性質の総数以下となる ($L(Path) \leq |\mathbb{P}|$)。
しかし、本モデルでは Atomic Step の条件として $Cl_D(S \cup \{p\}) = S \cup \{p\}$ （単一要素のみの追加）を要求しているため、常に以下が成立する。

$$
L(Path) = |\mathbb{P}|
$$

この事実は、どのような順序（線形拡張）で移行を進めようとも、最終的に実施すべき「最小単位の作業数」は不変であることを示している。
（ただし、各ステップの重み（コスト）が異なる場合、総コストは経路によって変化する）

# 6. Migration Planning（移行計画）

移行計画（Migration Planning）とは、始点 $\bot$ から終点 $\top$ へ至る最適な Migration Path を発見する問題である。

**Path Finding Problem**:
- **Input**: Guarantee Transition Graph $G_{trans}$ (DAG)
- **Start**: $\bot$
- **Goal**: $\top$
- **Output**: A sequence of states $(S_0, \dots, S_n)$

この問題は、DAG（有向非巡回グラフ）上の最適経路探索であるため、以下のアルゴリズムが適している。

1.  **Topological Shortest Path**:
    DAGのトポロジカル順序を利用して線形時間で最短経路を求める手法。
2.  **Dynamic Programming (DP)**:
    部分問題の最適解を積み上げる手法。
3.  **Dijkstra / A\***:
    汎用的な最短経路アルゴリズム（DAGなのでDijkstraも有効）。

Migration Planning は、本質的には **Topological Ordering（トポロジカルソート）の最適化問題** として解釈できる。

# 7. Visualization（図式化）

Guarantee Transition Graph と Migration Path の関係を以下に示す。

```mermaid
graph TD
    subgraph "Guarantee Transition Graph (DAG)"
        Bot((Start: ∅))
        
        %% Layer 1
        L1_1(( {p1} ))
        L1_2(( {p2} ))
        
        %% Layer 2
        L2_1(( {p1, p3} ))
        L2_2(( {p2, p4} ))
        L2_3(( {p1, p2} ))
        
        %% Layer 3
        Top((Goal: ℙ))
        
        %% Valid Transitions
        Bot --> L1_1
        Bot --> L1_2
        
        L1_1 --> L2_1
        L1_1 --> L2_3
        L1_2 --> L2_2
        L1_2 --> L2_3
        
        L2_1 --> Top
        L2_2 --> Top
        L2_3 --> Top
        
        %% Invalid (Dependent) Nodes are excluded implicitly
    end

    %% Highlight one Migration Path
    linkStyle 0,3,6 stroke-width:4px,stroke:blue;
    
    subgraph "Migration Path Example"
        direction LR
        P_Start((∅)) == p1 ==> P_S1(( {p1} )) == p3 ==> P_S2(( {p1, p3} )) == "..." ==> P_Goal((ℙ))
    end
```

（青線は一つの有効な Migration Path の例：$\emptyset \to \{p_1\} \to \{p_1, p_3\} \to \dots \to \mathbb{P}$）

# 8. 結論

本稿により、COBOL移行プロセスは **Guarantee Transition Graph 上の経路探索問題** として定式化された。
各ステップは依存関係と整合しており、Migration Path は依存順序の **線形拡張（Linear Extension）** に対応する。
これにより、移行計画の策定は、数理的な **Topological Ordering 問題** として厳密に扱うことが可能となった。
