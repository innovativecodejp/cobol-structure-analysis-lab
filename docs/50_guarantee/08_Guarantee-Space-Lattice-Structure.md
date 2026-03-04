# 08_Guarantee-Space-Lattice-Structure

# 1. 目的

本稿では、Guarantee Space の代数的構造を定義し、それが **分配束（Distributive Lattice）** であることを示す。
また、依存関係を考慮した Dependent Guarantee Space ($G_{dep}$) が、順序集合上の **Ideals (Lower Sets)** の集合として定義され、元の空間の **部分束（Sublattice）** として分配束の性質を保持することを証明する。
これにより、次フェーズで扱う「グラフ上の最短経路問題」の数学的基礎（格子グラフ構造）を確立する。

# 2. Guarantee Space の束構造

## 2.1 定義：束（Lattice）

半順序集合 $(L, \leq)$ が **束（Lattice）** であるとは、任意の2要素 $x, y \in L$ に対して、以下の2つの演算が一意に存在することをいう。

1.  **結び（Join, Least Upper Bound）**: $x \vee y = \sup\{x, y\}$
2.  **交わり（Meet, Greatest Lower Bound）**: $x \wedge y = \inf\{x, y\}$

## 2.2 定理：Guarantee Space は束である

**定理 1**:
保証空間 $G = (\mathcal{P}(\mathbb{P}), \subseteq)$ は束である。

**証明**:
任意の $S, T \in \mathcal{P}(\mathbb{P})$ に対して、
- Join: $S \vee T = S \cup T$ （集合和）
- Meet: $S \wedge T = S \cap T$ （集合積）
と定義する。
集合論の基本性質より、$S \cup T$ は $S, T$ を含む最小の集合であり、$S \cap T$ は $S, T$ に含まれる最大の集合である。
よって $(G, \subseteq)$ は束である。 $\square$

## 2.3 定理：Guarantee Space は分配束である

**定義：分配束（Distributive Lattice）**
束 $L$ が以下の分配律を満たすとき、分配束という。
任意の $x, y, z \in L$ について：
1. $x \wedge (y \vee z) = (x \wedge y) \vee (x \wedge z)$
2. $x \vee (y \wedge z) = (x \vee y) \wedge (x \vee z)$

**定理 2**:
保証空間 $G$ は分配束である。

**証明**:
集合演算の分配律により自明である。
任意の $S, T, U \in \mathcal{P}(\mathbb{P})$ について：
$$ S \cap (T \cup U) = (S \cap T) \cup (S \cap U) $$
$$ S \cup (T \cap U) = (S \cup T) \cap (S \cup U) $$
したがって $G$ は分配束である。 $\square$

# 3. Dependent Guarantee Space の束構造

依存関係 $D$ を持つ部分空間 $G_{dep}$ の構造を整理する。

## 3.1 依存関係とIdeals (Lower Sets)

依存関係 $D \subseteq \mathbb{P} \times \mathbb{P}$ により、性質間の依存順序 $p_j \leq_D p_i$ （$p_i$ depends on $p_j$）を定義する。
$G_{dep}$ は、順序集合 $(\mathbb{P}, \leq_D)$ 上の **Ideals (Lower Sets)** の集合として定義される。

$$
G_{dep} = Idl(\mathbb{P}, \leq_D) = \{ S \subseteq \mathbb{P} \mid \forall p \in S, q \leq_D p \implies q \in S \}
$$

## 3.2 定理：G_dep は部分束である

**定理 3**:
$G_{dep}$ は $G$ の部分束（Sublattice）である。すなわち、$G_{dep}$ は $\cup$ と $\cap$ について閉じている。
また、$G_{dep}$ 自体も **Finite Distributive Lattice** を形成する。

**証明**:
任意の $S, T \in G_{dep}$ をとる。
1.  **Meetの閉性**:
    $x \in S \cap T$ とする。任意の $y \leq_D x$ について、$S, T$ がLower Setであることから $y \in S$ かつ $y \in T$。
    よって $y \in S \cap T$。ゆえに $S \cap T \in G_{dep}$。
2.  **Joinの閉性**:
    $x \in S \cup T$ とする。$x \in S$ または $x \in T$ である。
    任意の $y \leq_D x$ について、$x \in S$ なら $y \in S$、$x \in T$ なら $y \in T$。
    いずれにせよ $y \in S \cup T$。ゆえに $S \cup T \in G_{dep}$。

以上より、$G_{dep}$ は $G$ の部分束である。 $\square$

明らかに $G_{dep} \subset \mathcal{P}(\mathbb{P})$ であり、部分束であることから分配律も成立する。

# 4. Graph構造への接続（Prompt3 前提）

束構造を離散グラフとして扱うための定義を導入する。

## 4.1 被覆関係（Cover Relation）の厳密定義

順序集合 $(L, \leq)$ において、$x < y$ かつ $x < z < y$ となる $z$ が存在しないとき、「$y$ は $x$ を被覆する（covers）」といい、$x \lessdot y$ と書く。

Guarantee Space $G$ における被覆関係は、依存関係を考慮し以下のように定義される：

$$ S \lessdot T \iff T = S \cup \{p\} \land p \notin S \land Cl_D(S \cup \{p\}) = S \cup \{p\} $$

かつ、当然ながら $S, T \in G_{dep}$ である必要がある。
すなわち、**単一の要素 $p$ を追加した結果が即座に有効な状態（Ideal）となる場合のみ**、被覆関係が成立する。

## 4.2 Lattice Graph

**Lattice Graph** を以下のように定義する。

$$
Graph \ G = (V, E)
$$
- $V = G_{dep} = Idl(\mathbb{P}, \leq_D)$
- $E = \{ (S, T) \mid S \lessdot T \}$

このグラフは、全体空間 $G$ に対応する **Hypercube Graph の部分グラフ** として解釈できる。
（ただしエッジは依存関係を満たす遷移のみに制限される）

```mermaid
graph TD
    subgraph "Lattice Structure (Hasse Diagram / Lattice Graph)"
        Top((Top: {p1, p2}))
        p1(( {p1} ))
        p2(( {p2} ))
        Bot((Bot: ∅))

        Bot -->|cover| p1
        Bot -.->|invalid| p2
        p1 -->|cover| Top
        p2 -.->|invalid| Top
    end
    style p2 fill:#ccc,stroke-dasharray: 5 5
```
*(注: 上図は p2 が p1 に依存する場合の例。p2単独はInvalidとなり、Bot->p2のエッジは存在しない)*

このグラフ構造により、次フェーズ（Prompt3）において、移行パスを「Lattice Graph 上のパス」として定義し、最短経路問題を適用することが可能となる。

# 5. Prompt3 入力前提まとめ

次フェーズ（Prompt3）の入力として、以下の定義・定理が確定した。

1.  **代数構造**:
    - Guarantee Space は **分配束（Distributive Lattice）** である。
    - Join = Union ($\cup$), Meet = Intersection ($\cap$)。

2.  **依存空間**:
    - $G_{dep} = Idl(\mathbb{P}, \leq_D)$ は順序集合 $(\mathbb{P}, \leq_D)$ の **Ideals (Lower Sets)** の集合である。
    - $G_{dep}$ は $G$ の **部分束** であり、かつ **分配束** である。
    - $G_{dep} \subset \mathcal{P}(\mathbb{P})$。

3.  **グラフ接続**:
    - Lattice Graph $G = (V, E)$。
    - $V = G_{dep}$。
    - $E$: Cover Relation $S \lessdot T \iff T = S \cup \{p\}$ かつ $T \in G_{dep}$。
    - これは Hypercube Graph の部分グラフである。
