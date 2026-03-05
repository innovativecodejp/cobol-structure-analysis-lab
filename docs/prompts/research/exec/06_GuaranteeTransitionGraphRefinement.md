# Research Revision Task
Refinement of Guarantee Transition Graph

対象文書

09_Guarantee-Transition-Graph.md

レビューで指摘された数学的改善点を反映して
文書を改訂する。

既存の構造は維持しつつ、
定義と説明の厳密性を強化すること。

---

# 修正1
## DAG 証明の厳密化

現在の説明

|S| < |T|

は一般には正しくない。

理由：

遷移は

T = S ∪ {p}

で定義されるが、
依存閉包

Cl_D

によって

複数の要素が追加される可能性がある。

したがって

|T| > |S|

と書くのが正しい。

---

### 修正内容

DAG の証明を次の形に書き換える。

任意のエッジ (S,T) について

S ⊂ T

が成立する。

したがって

|T| > |S|

である。

よって

状態遷移は常に集合サイズを増加させるため、
閉路は存在せず

Guarantee Transition Graph は DAG である。

---

# 修正2
## Rank Function の改善

現在

ρ(S) = |S|

としている。

これは成立するが、
次章で導入する

Guarantee Measure

との整合性を考えると

以下の定義の方が自然である。

---

### 新しい定義

Guarantee Measure

μ : G_dep → ℝ≥0

が定義されているとする。

Rank Function を

ρ(S) = μ(S)

として定義する。

これにより

遷移グラフは

weighted graded structure

として解釈できる。

---

# 修正3
## Hypercube Graph との関係

Guarantee Space

G = P(P)

は

N次元ハイパーキューブ

{0,1}^N

と同型である。

したがって

P(P)

のハッセ図は

Hypercube Graph

である。

---

### 追加説明

Guarantee Transition Graph は

Hypercube Graph の部分グラフである。

理由：

依存関係 D により
一部の頂点と遷移が除去されるためである。

---

# 修正4
## 頂点数の修正

現在

頂点数

2^|P|

と書かれている。

しかし

実際の頂点集合は

G_dep = Idl(P, ≤_D)

であるため

依存関係により状態数は減少する。

---

### 修正

頂点数は

|V| ≤ 2^|P|

とする。

---

# 出力要求

改訂された

09_Guarantee-Transition-Graph.md

を再出力する。

以下を満たすこと。

- DAG 証明を修正
- Rank Function を Measure ベースに更新
- Hypercube Graph との関係を追加
- 頂点数の表現を修正

必要に応じて Mermaid 図を更新する。

---

# 最後に

この定義から導かれる

Migration Optimization Problem

を1段落で説明する。

これは

Shortest Path Problem

として定式化できることを示す。
