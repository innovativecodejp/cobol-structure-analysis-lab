# Glossary 5. Geometry of Migration

This document defines concepts for the geometric modeling of migration processes.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Migration Path** | Geometry | 保証空間内での Legacy System から Target System への経路。連続的な状態変化を表現。 | $P: [0,1] \to GS$, $P(0) = S_{legacy}$, $P(1) = S_{target}$ | [[Migration Geometry]], [[Guarantee Space]] |
| **Migration State** | Geometry | 移行プロセスの特定時点におけるシステム状態。保証空間内の点として表現。 | $S(t) \in GS$ where $t \in [0,1]$ | [[Migration Path]], [[Guarantee Space]] |
| **Migration Distance** | Geometry | 保証空間内での2つの状態間の距離。移行コストや困難度の指標となる。 | $d: GS \times GS \to \mathbb{R}_{\geq 0}$ | [[Guarantee Metric]], [[Migration Cost]] |
| **Safe Region** | Geometry | 移行中に安全に滞在できる保証空間の領域。一定の保証レベルを満たす。 | $\mathcal{S} = \{S \in GS \mid \forall g_i, S_i \geq threshold_i\}$ | [[Failure Region]], [[Guarantee Space]] |
| **Failure Region** | Geometry | 移行失敗や重大な不整合が発生する可能性が高い保証空間の領域。 | $\mathcal{F} = \{S \in GS \mid \exists g_i, S_i < critical_i\}$ | [[Safe Region]], [[Migration Risk]] |
| **Migration Risk** | Geometry / Decision | 移行経路に沿った失敗確率や不整合発生の可能性。経路の形状や通過する領域に依存。 | $Risk(P) = \int_0^1 r(P(t)) dt$ | [[Migration Path]], [[Failure Region]] |
| **Migration Cost** | Geometry / Decision | 移行経路に沿った実行コスト。時間、労力、リソースなどの総合指標。 | $Cost(P) = \int_0^1 c(P(t)) \|\dot{P}(t)\| dt$ | [[Migration Path]], [[Migration Distance]] |
| **Ideal State** | Geometry | 理論上最適な保証状態。すべての保証次元で最高レベルを達成した状態。 | $S_{ideal} = (1, 1, \ldots, 1) \in GS$ | [[Target System]], [[Guarantee Space]] |
| **Migration Topology** | Geometry | 移行可能性を定義する保証空間上の位相構造。連結性や経路の存在を定義。 | $(GS, \mathcal{T}_{migration})$ | [[Guarantee Space]], [[Migration Path]] |
| **Migration Field** | Geometry | 保証空間の各点において、最適な移行方向を示すベクトル場。 | $\vec{F}: GS \to T(GS)$ | [[Migration Path]], [[Migration Optimization]] |
| **Migration Barrier** | Geometry | 移行を阻害する保証空間内の障壁。通過に高いコストやリスクを伴う領域。 | $B \subset GS$ where crossing $B$ has high cost/risk | [[Migration Path]], [[Migration Risk]] |