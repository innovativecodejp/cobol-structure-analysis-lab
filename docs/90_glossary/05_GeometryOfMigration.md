# Glossary 5. Geometry of Migration

This document defines geometric concepts applied to migration planning.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Migration Geometry** | Geometry | 移行プロセスを幾何空間上の移動としてモデル化する枠組み。 | Tuple $\mathcal{M} = (GS, d, \mathcal{S}, \mathcal{F}, \phi)$ | [[Guarantee Space]] |
| **Migration Distance** | Geometry | 現状システムと目標システムの間の幾何学的距離。移行の「大きさ」を表す。 | $d(Legacy, Target)$ | [[Migration Cost]] |
| **Migration Path** | Geometry | Guarantee Space 上での、Legacy状態からTarget状態への軌跡（一連の状態遷移）。 | Sequence $S_0, \dots, S_n$ where $S_0=Legacy, S_n=Target$<br>or $P: [0,1] \to GS$ | [[Migration Strategy]] |
| **Shortest Migration Path** | Geometry | Migration Cost または Distance を最小化する経路。 | $\min_P \int cost(P(t)) dt \quad \text{s.t.} \quad P(t) \in \mathcal{S}$ | [[Migration Optimization]] |
| **Migration Cost** | Decision | Migration Path を移動するために必要な総労力。距離だけでなく、経路上のリスクや摩擦係数を含む。 | $J(P) = \int (Effort + Risk - Utility) dt$ | [[Migration Distance]] |
