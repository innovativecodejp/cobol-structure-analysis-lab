# 01. 意思決定のための保証空間の形式化 (Guarantee Space Formalization for Decision Making)

**Phase 3: Migration Decision Model**  
**Document ID:** `docs/60_decision/01_Guarantee_Decision_Space.md`  
**Date:** 2026-03-05

---

## 1. はじめに

本文書は、**保証空間（Guarantee Space, $\mathcal{G}$）** を、二値的な移行判断（安全 vs 危険）を行うための数学的領域として形式化するものである。Phase 2 では $\mathcal{G}$ をシステム特性の記述モデルとして確立したが、Phase 3 ではこれを **意思決定空間（Decision Space）** へと変換する。

中核となる目的は、可能なシステム状態の束（Lattice）の中に **安全領域（Safety Region）** を定義し、提案された移行パスがこの領域内に留まるか、あるいは到達するかを判定するための厳密な手法を提供することである。

---

## 2. 形式的定義: 保証束 (The Guarantee Lattice)

### 2.1 分配束としての保証空間

$\mathbb{P}$ を、すべての可能な保存特性（例：特定のデータフロー、制御ロジック、境界値）の有限集合とする。
**保証空間** $\mathcal{G}$ は、包含関係によって順序付けられた $\mathbb{P}$ のべき集合として定義される：

$$
\mathcal{G} = (\mathcal{P}(\mathbb{P}), \subseteq)
$$

この構造は **ブール束（Boolean Lattice）** を形成する。任意の2つの状態 $S_1, S_2 \in \mathcal{G}$ に対して：
- **結び（Join, $S_1 \cup S_2$）**: $S_1$ と $S_2$ 両方の特性が保存される状態。
- **交わり（Meet, $S_1 \cap S_2$）**: 共通の特性のみが保存される状態。

### 2.2 依存関係制約付き保証空間 ($\mathcal{G}_{dep}$)

現実には、保証は独立していない。高レベルの保証（例：「利息計算」）は、多くの場合、低レベルの保証（例：「変数アクセス」）に依存する。$D \subseteq \mathbb{P} \times \mathbb{P}$ を依存関係とし、$(p, q) \in D$ は「$q$ は $p$ を必要とする」ことを意味するとする。

**有効保証空間（Valid Guarantee Space）** は、$\mathbb{P}$ のすべての依存関係で閉じている部分集合（イデアル）の集合である：

$$
\mathcal{G}_{dep} = \{ S \in \mathcal{G} \mid \forall p \in S, \forall q \in \mathbb{P}, (q, p) \in D \implies q \in S \}
$$

$\mathcal{G}_{dep}$ は $\mathcal{G}$ の **分配部分束（Distributive Sublattice）** である。これが移行判断のための実際の状態空間となる。

---

## 3. クリティカル保証理論 (Critical Guarantee Theory)

すべての保証が等価であるわけではない。移行が「成功」または「安全」であると見なされるためには、特定の特性のサブセットが*必ず*保存されなければならない。

### 3.1 クリティカル保証集合 ($G_{crit}$) の定義

$Req$ を移行後のシステムのビジネス要件集合とする。
**クリティカル保証集合（Critical Guarantee Set）** $G_{crit} \subseteq \mathbb{P}$ を、$Req$ を満たすために不可欠な最小限の特性集合として定義する。

$$
G_{crit} = \{ p \in \mathbb{P} \mid p \text{ is essential for } Req \}
$$

**極めて重要な点として**、$G_{crit}$ は **依存関係で閉じて（dependency-closed）** いなければならない。クリティカルな要件が低レベルの特性に依存する場合、その低レベル特性も暗黙的にクリティカルとなる。

$$
G_{crit} \in \mathcal{G}_{dep}
$$

### 3.2 安全性関数 (The Safety Function)

二値の **安全性関数（Safety Function）** $Safe: \mathcal{G}_{dep} \to \{0, 1\}$ を定義する：

$$
Safe(S) = \begin{cases} 
1 & \text{if } G_{crit} \subseteq S \\
0 & \text{otherwise}
\end{cases}
$$

状態 $S$ は、すべてのクリティカル保証を含んでいる場合にのみ、**安全（Safe）** である。

---

## 4. 安全性部分束 (The Safety Sublattice)

### 4.1 安全領域 ($\mathcal{S}$)

すべての安全な状態の集合は、保証空間内に特定の領域を形成し、これを **安全領域（Safety Region）** $\mathcal{S}$ と呼ぶ：

$$
\mathcal{S} = \{ S \in \mathcal{G}_{dep} \mid G_{crit} \subseteq S \}
$$

**定理 1 (フィルター特性):**
安全領域 $\mathcal{S}$ は、束 $\mathcal{G}_{dep}$ 内の **フィルター（Filter, 双対イデアル）** である。
*証明:*
1.  もし $S \in \mathcal{S}$ かつ $S \subseteq T$ （ここで $T \in \mathcal{G}_{dep}$）ならば、$G_{crit} \subseteq S \subseteq T$ であるため、$G_{crit} \subseteq T$ となる。したがって $T \in \mathcal{S}$ である。（上方閉包）
2.  もし $S_1, S_2 \in \mathcal{S}$ ならば、$G_{crit} \subseteq S_1$ かつ $G_{crit} \subseteq S_2$ である。したがって $G_{crit} \subseteq S_1 \cap S_2$ となる。ゆえに $S_1 \cap S_2 \in \mathcal{S}$ である。（交わりについて閉じている）

### 4.2 安全への距離 (Distance to Safety)

任意の不安全な状態 $S \notin \mathcal{S}$ に対して、**移行負債（Migration Debt）** または **安全への距離（Distance to Safety）** を定義できる：

$$
d_{safety}(S) = \mu(G_{crit} \setminus S)
$$

ここで $\mu$ は保証の重要度の重み付き尺度である。このメトリクスは、ある状態が「どれほど不安全か」を定量化する。

---

## 5. 構造マッピング: コードから束へ (Structural Mapping)

物理的な COBOL プログラムを $\mathcal{G}_{dep}$ 内の点 $S$ にどのようにマッピングするか？

### 5.1 マッピング関数 $\Phi$

$\mathbb{C}$ をすべての可能なコード構造（AST）の空間とする。
特定のコード構造 $C$ によって提供される保証の集合を抽出するマッピング関数 $\Phi: \mathbb{C} \to \mathcal{G}_{dep}$ を定義する。

$$
S = \Phi(C)
$$

### 5.2 構造パターンと束上の領域

異なるコードパターンは、束の異なる領域にマッピングされる：

*   **スパゲッティコード (Spaghetti Code)**:
    *   非構造化制御フロー（GOTO）によって特徴づけられる。
    *   制御フロー保証（$P_{flow}$）が弱いか欠如している状態 $S_{spaghetti}$ にマッピングされる。
    *   もし $P_{flow} \cap G_{crit} \neq \emptyset$ ならば、おそらく $S_{spaghetti} \notin \mathcal{S}$ である。

*   **モノリシック構造 ("God Class")**:
    *   高い結合度と状態の共有によって特徴づけられる。
    *   データ分離保証（$P_{data}$）が欠落している状態 $S_{mono}$ にマッピングされる。

*   **モジュラー構造 (Modular Structure)**:
    *   明確なインターフェースとスコープによって特徴づけられる。
    *   束の上位にある状態 $S_{mod}$ にマッピングされ、$P_{flow}$ と $P_{data}$ の両方を保存している。

### 5.3 移行軌跡 (The Migration Trajectory)

移行はコードの変換 $C_0 \to C_1 \to \dots \to C_{target}$ である。
これは保証空間における軌跡に対応する：
$S_0 \to S_1 \to \dots \to S_{target}$。

**判断基準（Decision Criterion）** は以下の通りである：
その軌跡は最終的に $\mathcal{S}$ に到達するか？
すなわち、$S_{target} \in \mathcal{S}$ か？

---

## 6. 結論

我々は以下によって、意思決定のための保証空間を形式化した：
1.  $\mathcal{G}_{dep}$ を有効な状態の分配束として定義した。
2.  $G_{crit}$ を不可欠な特性の集合として特定した。
3.  **安全領域** $\mathcal{S}$ を $G_{crit}$ によって生成されるフィルターとして定義した。
4.  **安全への距離** $d_{safety}(S)$ を主要なメトリクスとして確立した。

この形式化は、**構造的リスクモデル**（Task 2）のための「座標系」を提供する。Task 2 では、$\mathcal{S}$ へ正常に遷移できる確率を定量化する。
