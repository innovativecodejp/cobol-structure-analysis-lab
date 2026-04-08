# Terms: AST, IR, CFG, DFG

This file defines terminology related to Syntax and Structure analysis layers.

---

## Abstract Syntax Tree (AST)

**Layer**: Syntax Layer (構文層)

**Definition**:
ソースコードの構文構造を木構造として表現したもの。括弧や区切り文字などの不要なトークンを取り除き、構文の意味的な階層のみを保持する。本研究では、AST は **観測層** として位置づけられ、プログラムの構文構造をトレース可能な形で観測・記録するための基底層を構成する。

**Formal Description**:
$$
T_{AST} = (V, E, \lambda)
$$
where $V$ are syntax nodes, $E$ represent containment (parent-child), $\lambda: V \to \text{NodeType}$.

**Related Concepts**:
- [[IR]], [[CFG]], [[DFG]]
- [[Node Taxonomy]], [[Structural Layer Stack]]

**Example**:
COBOL の `MOVE A TO B` は、AST 上で `MoveStatement` ノードの子として `SourceOperand(A)` と `DestinationOperand(B)` を持つ。

---

## Intermediate Representation (IR)

**Layer**: Structure Layer (構造作用層)

**Definition**:
AST と CFG/DFG の中間に位置し、**構造作用（制御・データ・境界）を再編成した中間構造**。言語依存の構文差異を吸収し、移行判断に必要な **統一的な作用単位** を与える。コンパイラ最適化向けの低水準 IR ではなく、移行リスク分析のための **構造抽象** として設計される。

**Formal Description**:
$$
IR = (U, \Sigma, \delta)
$$
where $U$ is a set of IR units, $\Sigma$ is effect signatures (control, data, boundary), $\delta: U \to 2^{\Sigma}$ assigns effects to units.

**Key Concepts**:
- **IR Unit**: 構造作用の最小単位（文・節・手続きなど）
- **Control Abstraction**: 分岐・反復・遷移の構造化
- **Data Abstraction**: 定義・参照・伝播の構造化
- **Boundary Abstraction**: スコープ・外部インタフェースの明示化

**Related Concepts**:
- [[AST]], [[CFG]], [[DFG]], [[Guarantee]], [[Scope]]
- [[IR Unit]], [[Control Abstraction]], [[Data Abstraction]]

---

## Control Flow Graph (CFG)

**Layer**: Structure Layer (制御到達層)

**Definition**:
プログラム内の **実効的に遷移しうる制御順序** を有向グラフとして表現したもの。ノードは基本ブロック（Basic Block）、エッジは制御の遷移を表す。本研究では、CFG を **制御到達と経路閉包の構造層** として位置づけ、実行トレースの再現図や AST の別表現ではなく、**移行判断に接続可能な制御構造モデル** として扱う。

**Formal Description**:
$$
G_{CFG} = (V, E, s, t)
$$
where $V$ are basic blocks, $E \subseteq V \times V$ are control transitions, $s$ is entry, $t$ is exit.

**Key Concepts**:
- **Basic Block**: 単一入口・単一出口の文の列
- **Control Region**: 入れ子構造を持つ制御領域
- **Dominance**: 支配関係（あるノードを経由しないと到達不可能）
- **Reachability**: 経路到達可能性
- **Path Closure**: 経路集合の閉包

**Related Concepts**:
- [[Basic Block]], [[DFG]], [[Guarantee]], [[Scope]]
- [[Dominance]], [[Reachability]], [[Loop Structure]]

---

## Data Flow Graph (DFG)

**Layer**: Structure Layer (データ依存層)

**Definition**:
データの依存関係（定義と使用）を有向グラフとして表現したもの。ある変数の値がどこで生成され、どこで使われるかを追跡する。本研究では、DFG を **移行判断・変更影響分析・保証評価に接続可能なデータ依存モデル** として位置づけ、コンパイラ最適化向けのデータフロー解析ではなく、**判断材料を生成する構造層** として扱う。

**Formal Description**:
$$
G_{DFG} = (V, E, \tau)
$$
where $V$ are data elements (items, literals, expressions, I/O endpoints), $E$ represent data dependency (define, use, propagation, aggregation, cross-scope), $\tau: E \to \text{EdgeType}$.

**Key Concepts**:
- **Define**: 値の生成（代入、READ、算術結果）
- **Use**: 値の参照（右辺、条件、出力）
- **Kill**: 同一領域への上書きによる先行定義の無効化
- **Reaching Definition**: ある use に到達しうる define の集合
- **Impact Closure**: 変更影響の依存閉包

**Related Concepts**:
- [[CFG]], [[Define-Use]], [[Reaching Definition]], [[Scope]], [[Guarantee]]
- [[Impact Closure]], [[Data Dependency]]

---

## Basic Block

**Layer**: Structure Layer (構造層)

**Definition**:
制御フローの観点で **単一の入口と単一の出口** を持つ、連続した文の列。基本ブロック内では、最初の文が実行されれば最後の文まで必ず実行される（途中での分岐・合流がない）。CFG の最小解析単位として用いられる。

**Formal Description**:
$$
BB = (s_1, s_2, \ldots, s_n) \quad \text{where } \forall i \in [1, n-1], \text{succ}(s_i) = \{s_{i+1}\}
$$

**Related Concepts**:
- [[CFG]], [[Control Region]]

---

## Define-Use (Def-Use)

**Layer**: Structure Layer (構造層)

**Definition**:
データフロー解析における基本概念。**Define** はデータ要素が新たな値を持つ操作、**Use** はデータ要素の値を参照する操作。Define-Use 関係は DFG のエッジを構成する。

**Formal Description**:
$$
\text{def}(v, p) \quad \text{— variable } v \text{ is defined at point } p
$$
$$
\text{use}(v, p) \quad \text{— variable } v \text{ is used at point } p
$$

**Related Concepts**:
- [[DFG]], [[Reaching Definition]]

---

## Reaching Definition

**Layer**: Structure Layer (構造層)

**Definition**:
プログラム上のある点における変数の use に対し、その use に **到達しうる define の集合**。CFG 上の経路に依存し、途中で kill（上書き）されなかった define のみが到達する。

**Formal Description**:
$$
\text{reach}(v, p) = \{ d \mid d \in \text{def}(v), \exists \text{path } d \to p \text{ without kill of } v \}
$$

**Related Concepts**:
- [[DFG]], [[Define-Use]], [[Kill]]

---

## Impact Closure

**Layer**: Structure / Decision (構造層 / 判断層)

**Definition**:
変更起点から DFG 上の依存エッジを辿って到達しうる **ノード・文・境界の集合**（順方向閉包）。変更影響分析の根拠となり、Scope や Guarantee との整合を評価する材料を与える。

**Formal Description**:
$$
\text{closure}(v) = \{ u \mid v \to^* u \text{ on DFG} \}
$$

**Related Concepts**:
- [[DFG]], [[Scope]], [[Guarantee]]

---

## Variable Scope

**Layer**: Structure Layer (構造層)

**Definition**:
コード内でデータ要素が参照可能（可視）である範囲。COBOL では WORKING-STORAGE、LOCAL-STORAGE、LINKAGE、FILE SECTION などの記憶クラスにより異なるスコープを持つ。

**Formal Description**:
$$
\text{scope}(v) \subseteq \text{ProgramPoints}
$$

**Related Concepts**:
- [[DFG]], [[Scope Boundary]], [[Data Scope]]