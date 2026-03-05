# Phase2-A Research Task
Migration Path Theory
## 前提
これまでの研究で以下が確立されている。
Guarantee Space  
G = P(P)
Dependent Guarantee Space
G_dep = Idl(P, ≤_D)
Guarantee Transition Graph
G_trans = (V,E)
V = G_dep  
E = cover relations
このグラフは DAG である。
---
# 研究目的
COBOL移行を
Migration Path
として定式化する。
---
# 1 Migration Path
Migration Path を以下で定義する。
Path
S0 → S1 → ... → Sn
条件
S0 = ⊥ = ∅  
Sn = ⊤ = P
(S_i, S_{i+1}) ∈ E
つまり
S_i ⊂ S_{i+1}
---
# 2 Atomic Migration Step
各ステップは
T = S ∪ {p}
で表される。
ただし
Cl_D(S ∪ {p}) = S ∪ {p}
を満たす。
---
# 3 Path Length
Path Length
L(Path) = n
これは
保証導入ステップ数
である。
---
# 4 Migration Planning
移行問題は
Path Finding Problem
として表される。
Start
⊥
Goal
⊤
---
# 5 図
Mermaid を用いて
Guarantee Transition Graph
と
Migration Path
を図示する。
---
# 出力
Migration-Path-Theory.md
を生成する。
