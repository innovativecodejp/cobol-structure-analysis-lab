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

# 4. Path Length（パス長）

移行パスの長さ $L(Path)$ を以下のように定義する。

$$
L(Path) = n
$$

これは、プロジェクト完了までに必要な **Atomic Migration Step の総数** である。
$G_{trans}$ が DAG であり、各ステップで要素が1つずつ追加されるため、任意の完全な Migration Path の長さは保証性質の総数に等しい。

$$
L(Path) = |\mathbb{P}|
$$

この事実は、どのような順序で移行を進めようとも、最終的に実施すべき「最小単位の作業数」は不変であることを示唆している。
（ただし、各ステップの重み（コスト）が異なる場合、総コストは経路によって変化する。これについては次章以降で扱う）

# 5. Migration Planning（移行計画）

移行計画（Migration Planning）とは、始点 $\bot$ から終点 $\top$ へ至る最適な Migration Path を発見する問題である。

**Path Finding Problem**:
- **Input**: Guarantee Transition Graph $G_{trans}$
- **Start**: $\bot$
- **Goal**: $\top$
- **Output**: A sequence of states $(S_0, \dots, S_n)$

この問題は、グラフ探索アルゴリズム（DFS, BFS, A*など）によって解くことができる。
すべてのパスが実行可能（Feasible）であるため、計画の焦点は「実行可能か」ではなく「どのパスが最適か（コスト、リスク、期間など）」に移る。

# 6. Visualization（図式化）

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

# 7. 結論

本稿により、COBOL移行プロセスは **Guarantee Transition Graph 上の経路探索問題** として定式化された。
各ステップ（Atomic Migration Step）は依存関係と整合しており、後戻りのない着実な進捗を表現している。
これにより、移行計画の策定は、経験則や勘ではなく、数学的に裏付けられたグラフアルゴリズムによって行われるべき対象となった。
