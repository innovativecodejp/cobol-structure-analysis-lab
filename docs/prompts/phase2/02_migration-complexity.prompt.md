# Phase2-B Research Task

Migration Complexity
## 前提
Guarantee Transition Graph
G_trans = (V,E)
は DAG である。
Migration は
⊥ → ⊤
への Path である。
---
# 研究目的
移行の
難易度
を数学的に定義する。
---
# 1 Migration Distance
距離
d(S,T)
を
d(S,T) = |T \ S|
と定義する。
これは
必要な保証追加数
を表す。
---
# 2 Migration Cost
各保証
p ∈ P
に重み
w(p) ≥ 0
を与える。
---
Cost
Cost(Path) = Σ w(p)
---
# 3 Minimum Migration Cost
最適移行は
Min Cost Path
として定義される。
---
# 4 Migration Complexity
移行複雑度
C
を
C = min Cost(Path)
として定義する。
---
# 5 構造的解釈
Migration Complexity は
- dependency depth
- guarantee count
- branching
に依存する。
---
# 出力
Migration-Complexity.md
を生成する。
