# Research Revision Task
Guarantee Space Geometry Revision

## 背景

以下の研究文書が作成されている。

- Weighted Guarantee Space
- Metric on Guarantee Space

これらは Guarantee Space を

- Hypercube Geometry
- Measure Space
- Metric Space
- Migration Optimization Problem

として定式化している。

レビューにより、理論をより厳密にするための改善点が指摘された。
本タスクではそれらを反映し、文書を改訂する。

---

# 改訂対象

以下の文書を改訂する。

05_Weighted-Guarantee-Space.md  
06_Metric-on-Guarantee-Space.md

既存の構造はできるだけ保持しながら、
理論定義を強化すること。

---

# 改善点1  
## 依存関係の形式定義

現在の文書では依存閉包

Cl_D

のみが定義されている。

依存関係そのものを明確に定義すること。

### 要求

依存関係を

D ⊆ P × P

として定義する。

意味：

p_i depends on p_j

を

p_j ≤_D p_i

として定義する。

閉包は

Cl_D(S) = S ∪ { p_j | ∃ p_i ∈ S : p_j ≤_D p_i }

として定義する。

この定義を

Dependent Guarantee Space

の章に追加すること。

---

# 改善点2  
## Hypercube Graph の明示

現在の文書では

Hypercube

と

Shortest Path

の関係が明示されていない。

Guarantee Space が

**Hypercube Graph**

であることを明確にする。

### 要求

以下を定義すること。

Graph G = (V, E)

V = {0,1}^N

E = {(u,v) | Hamming distance = 1}

そして

Guarantee Space

はこの Graph と同型であることを説明する。

---

# 改善点3  
## Migration Step の依存制約

現在の定義

S → S ∪ {p}

は依存制約を考慮していない。

### 要求

遷移を

S → S'

として

S' = Cl_D(S ∪ {p})

であることを定義する。

また

S' ∈ G_dep

であることを条件とする。

これを Migration Path の章に追加すること。

---

# 改善点4  
## Measure と Metric の関係

現在

μ(S) = Σ w(p)

d_w(G1,G2)

が定義されている。

両者の関係を明示すること。

### 要求

以下を追加すること。

d_w(S1, S2) = μ(S1 △ S2)

これにより

Weighted Hamming Metric

が

Measure によって誘導されることを説明する。

---

# 追加説明

以下の概念的整理を導入すること。

Guarantee Space with weighted metric is a finite metric graph.

Migration planning becomes a shortest path problem on this graph.

---

# 図式化

Mermaid を用いて以下を図示する。

1 Guarantee Hypercube Graph  
2 Dependent Region  
3 Migration Path with Dependency  

---

# 出力

改訂された文書として

- Weighted Guarantee Space (Revised)
- Metric on Guarantee Space (Revised)

を出力せよ。

理論整合性を優先し、
数理定義を明確にすること。
