# Terms: Guarantee Space & Migration Geometry

This file defines terminology related to Guarantee Space and Migration Geometry (Guarantee/Geometry layers).

---

## Guarantee Space (GS)

**Layer**: Guarantee / Geometry Layer (保証・幾何層)

**Definition**:
システムが取りうるすべての保証状態の集合が構成する数理的空間。各保証次元（制御、データ、状態、インタフェースなど）を軸とする多次元空間として表現される。連続近似では超立方体 $[0,1]^n$、離散的には束（Lattice）として扱われる。

**Formal Description**:
$$
GS = [0,1]^n \text{ (continuous)} \quad \text{or} \quad (2^{\mathbb{P}}, \subseteq) \text{ (discrete)}
$$

**Related Concepts**:
- [[Guarantee Vector]], [[Guarantee Axis]]
- [[Guarantee Dimension]], [[Migration Geometry]]

**Example**:
3次元保証空間では、制御保証・データ保証・インタフェース保証の各軸で構成され、$(0.8, 0.6, 0.9)$ のような点で状態を表現する。

---

## Guarantee Axis

**Layer**: Guarantee / Geometry Layer (保証・幾何層)

**Definition**:
保証空間の各次元を表す軸。特定の保証観点（制御、データ、状態、トランザクション、インタフェースなど）に対応し、その観点での保証レベルを $[0,1]$ で表現する。

**Formal Description**:
$$
axis_i: \text{保証観点}_i \to [0,1]
$$

**Related Concepts**:
- [[Guarantee Space]], [[Guarantee Dimension]]

**Example**:
制御保証軸では、0 = 制御フローが完全に不明、1 = すべての制御パスが検証済み

---

## Guarantee Vector

**Layer**: Guarantee / Geometry Layer (保証・幾何層)

**Definition**:
保証空間内の特定の点を表すベクトル。各保証次元の保証レベルを成分とし、システムの総合的な保証状態を表現する。

**Formal Description**:
$$
\vec{g} = (g_1, g_2, \ldots, g_n) \in GS
$$
where $g_i \in [0,1]$ is guarantee level for dimension $i$.

**Related Concepts**:
- [[Guarantee Space]], [[Guarantee Dimension]]

**Example**:
$\vec{g} = (0.9, 0.7, 0.8, 0.6)$ = (制御保証, データ保証, 状態保証, IF保証)

---

## Migration State (G)

**Layer**: Geometry Layer (幾何層)

**Definition**:
移行プロセスの特定時点におけるシステム状態。保証空間内の点として表現され、時間とともに変化する軌跡を描く。

**Formal Description**:
$$
G(t) \in GS, \quad t \in [0,1]
$$
where $t=0$ is legacy state, $t=1$ is target state.

**Related Concepts**:
- [[Migration Path]], [[Ideal State]]
- [[Guarantee Space]]

---

## Safe Region (S)

**Layer**: Geometry Layer (幾何層)

**Definition**:
移行中に安全に滞在できる保証空間の領域。各保証次元で一定の閾値以上を満たし、システムが正常に動作する保証がある領域。

**Formal Description**:
$$
\mathcal{S} = \{S \in GS \mid \forall i, S_i \geq threshold_i\}
$$

**Related Concepts**:
- [[Failure Region]], [[Guarantee Space]]
- [[Migration Risk]]

---

## Failure Region (F)

**Layer**: Geometry Layer (幾何層)

**Definition**:
移行失敗や重大な不整合が発生する可能性が高い保証空間の領域。いずれかの保証次元で危険な閾値を下回る状態。

**Formal Description**:
$$
\mathcal{F} = \{S \in GS \mid \exists i, S_i < critical_i\}
$$

**Related Concepts**:
- [[Safe Region]], [[Migration Risk]]

---

## Migration Path (P)

**Layer**: Geometry Layer (幾何層)

**Definition**:
保証空間内での Legacy System から Target System への連続的な経路。時間パラメータで parameterized された曲線として表現される。

**Formal Description**:
$$
P: [0,1] \to GS, \quad P(0) = S_{legacy}, \quad P(1) = S_{target}
$$

**Related Concepts**:
- [[Migration State]], [[Migration Strategy]]
- [[Migration Geometry]]

---

## Migration Risk (Risk(P))

**Layer**: Geometry Layer (幾何層)

**Definition**:
移行経路に沿った失敗確率や不整合発生の可能性。経路の形状、通過する領域（Safe/Failure Region）、勾配などに依存する総合的リスク指標。

**Formal Description**:
$$
Risk(P) = \int_0^1 r(P(t)) \|\dot{P}(t)\| dt
$$
where $r(s)$ is local risk function at state $s$.

**Related Concepts**:
- [[Migration Cost]], [[Migration Distance]]
- [[Failure Region]]

---

## Migration Cost (Cost(P))

**Layer**: Geometry Layer (幾何層)

**Definition**:
移行経路に沿った実行コスト。時間、労力、リソースなどを統合した指標。経路の長さと各点での実行コストの積分として表現される。

**Formal Description**:
$$
Cost(P) = \int_0^1 c(P(t)) \|\dot{P}(t)\| dt
$$
where $c(s)$ is local cost function at state $s$.

**Related Concepts**:
- [[Migration Risk]], [[Migration Path]]

---

## Migration Distance (d)

**Layer**: Geometry Layer (幾何層)

**Definition**:
保証空間内での2つの状態間の距離。移行の困難度やコストの基礎指標となる。重み付きユークリッド距離やマンハッタン距離などを用いる。

**Formal Description**:
$$
d(S_1, S_2) = \sqrt{\sum_i w_i (S_{1,i} - S_{2,i})^2}
$$

**Related Concepts**:
- [[Guarantee Metric Space]], [[Migration Cost]]

---

## Ideal State (Ideal)

**Layer**: Geometry Layer (幾何層)

**Definition**:
理論上最適な保証状態。すべての保証次元で最高レベル（1.0）を達成した状態。実際の到達は困難だが、移行の方向性を示す指標として用いる。

**Formal Description**:
$$
S_{ideal} = (1, 1, \ldots, 1) \in GS
$$

**Related Concepts**:
- [[Migration State]], [[Target System]]

---

## Big Bang Strategy

**Layer**: Decision Layer (判断層)

**Definition**:
Legacy System を一度に全面的に Target System へ置き換える移行戦略。保証空間では急激な状態遷移として表現される。

**Formal Description**:
$$
P_{bigbang}(t) = \begin{cases}
S_{legacy} & \text{if } t < t_0 \\
S_{target} & \text{if } t \geq t_0
\end{cases}
$$

**Related Concepts**:
- [[Migration Path]], [[Migration Strategy]]

---

## Strangler Fig Strategy

**Layer**: Decision Layer (判断層)

**Definition**:
既存システムを段階的に新システムで置き換えていく移行戦略。保証空間では滑らかで制御された経路として表現される。

**Formal Description**:
$$
P_{strangler}(t) = (1-s(t)) \cdot S_{legacy} + s(t) \cdot S_{target}
$$
where $s(t)$ is smooth transition function.

**Related Concepts**:
- [[Migration Path]], [[Migration Strategy]]