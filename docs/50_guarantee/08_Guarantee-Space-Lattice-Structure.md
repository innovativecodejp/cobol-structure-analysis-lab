# 08_Guarantee-Space-Lattice-Structure

# 1. 目的

本稿では、Guarantee Space の代数的構造を定義し、それが **分配束（Distributive Lattice）** であることを示す。
また、依存関係を考慮した Dependent Guarantee Space ($G_{dep}$) が、元の空間の **部分束（Sublattice）** となり、同様に分配束の性質を継承することを証明する。
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

## 2.4 完備性（Completeness）

有限集合 $\mathbb{P}$ 上の冪集合束は完備束（Complete Lattice）である。
すなわち、任意の部分集合族に対して上限 $\bigcup$ と下限 $\bigcap$ が存在する。

# 3. Dependent Guarantee Space の束構造

依存関係 $D$ を持つ部分空間 $G_{dep}$ の構造を整理する。

## 3.1 下側閉集合（Lower Set / Ideal）としての定義

前稿までの定義において、依存関係 $p_j \leq_D p_i$ （$p_i$ は $p_j$ に依存）が存在するとき、有効な保証状態 $S$ は閉包条件 $S = Cl_D(S)$ を満たす必要があった。
これは、順序集合 $(\mathbb{P}, \leq_D)$ における **下側閉集合（Lower Set）**、あるいは有限順序集合における **イデアル（Ideal）** の定義と等価である。

$$
G_{dep} = \mathcal{O}(\mathbb{P}, \leq_D) = \{ S \subseteq \mathbb{P} \mid \forall p \in S, \forall q \leq_D p \implies q \in S \}
$$

## 3.2 定理：G_dep は部分束である

**定理 3**:
$G_{dep}$ は $G$ の部分束（Sublattice）である。すなわち、$G_{dep}$ は $\cup$ と $\cap$ について閉じている。

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

## 3.3 系：G_dep は分配束である

**系**:
$G_{dep}$ は分配束である。

**証明**:
$G$ が分配束であり、$G_{dep}$ がその部分束であることから、分配律は $G_{dep}$ 上でも成立する。 $\square$

この性質は、依存関係のある保証状態の探索において、常に「共通部分（共通の前提）」や「合併（統合）」が有効な状態として存在することを保証する重要な性質である。

# 4. Graph構造への接続（Prompt3 前提）

束構造を離散グラフとして扱うための定義を導入する。

## 4.1 被覆関係（Cover Relation）

順序集合 $(L, \leq)$ において、$x < y$ かつ $x < z < y$ となる $z$ が存在しないとき、「$y$ は $x$ を被覆する（covers）」といい、$x \lessdot y$ と書く。

Guarantee Space $G$ における被覆関係は以下となる：
$$ S \lessdot T \iff T = S \cup \{p\} \quad (p \notin S) $$

これは **Hamming距離が1である** ことと同値である。

## 4.2 ハッセ図（Hasse Diagram）と Lattice Graph

束の要素を頂点とし、被覆関係 $x \lessdot y$ を有向辺 $(x, y)$ とみなしたグラフを **ハッセ図** または **Lattice Graph** と呼ぶ。

- **Guarantee Graph**: $G$ のハッセ図。$N$次元ハイパーキューブグラフと同型。
- **Dependent Guarantee Graph**: $G_{dep}$ のハッセ図。ハイパーキューブの部分グラフ。

```mermaid
graph TD
    subgraph "Lattice Structure (Hasse Diagram Example)"
        Top((Top: {p1, p2}))
        p1(( {p1} ))
        p2(( {p2} ))
        Bot((Bot: ∅))

        Bot -->|cover| p1
        Bot -->|cover| p2
        p1 -->|cover| Top
        p2 -->|cover| Top
    end
```

このグラフ構造により、次フェーズ（Prompt3）において、移行パスを「Lattice Graph 上のパス」として定義し、最短経路問題を適用することが可能となる。

# 5. Prompt3 入力前提まとめ

次フェーズ（Prompt3）の入力として、以下の定義・定理が確定した。

1.  **代数構造**:
    - Guarantee Space は **分配束（Distributive Lattice）** である。
    - Join = Union ($\cup$), Meet = Intersection ($\cap$)。

2.  **依存空間**:
    - $G_{dep}$ は $(\mathbb{P}, \leq_D)$ の **Lower Sets (Ideals)** の族である。
    - $G_{dep}$ は $G$ の **部分束** であり、かつ **分配束** である。
    - つまり、有効な状態同士の $\cup$ と $\cap$ は常に有効である。

3.  **グラフ接続**:
    - 順序関係 $\subseteq$ はグラフの経路に対応する。
    - Step $S \to S'$ が原子的（Atomic）であるとは、それが Cover Relation $S \lessdot S'$ に対応することである。
