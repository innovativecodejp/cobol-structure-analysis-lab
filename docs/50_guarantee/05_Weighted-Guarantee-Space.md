# 05_Weighted-Guarantee-Space

# 1. 背景と目的

これまでの理論により、保証空間（Guarantee Space）は依存構造を持つイデアル束 $\mathcal{G}_{dep}$ として定義された。これにより、保証の「有無」や「包含関係」は厳密に扱えるようになった。

しかし、実際の移行プロジェクトでは、すべての保証が等価ではない。例えば、構文解析（Syntax）のコストと、副作用検証（Side-effect）のコストは桁違いである。また、それらが崩れた際のリスク（影響度）も異なる。

本定義書では、保証空間に**「重み（Weight）」**という計量構造を導入し、保証の強度、コスト、難易度を定量的に評価するための数理モデル **Weighted Guarantee Space** を構築する。

# 2. 重み関数の定義

保存性質集合 $\mathbb{P} = \{ P_{syn}, P_{flow}, P_{data}, P_{side}, P_{bound} \}$ の各要素に対し、その重要度やコストを表す非負実数を割り当てる。

## 2.1 定義

重み関数 $w: \mathbb{P} \to \mathbb{R}_{\geq 0}$ を定義する。

$$
w(p) \geq 0 \quad (\forall p \in \mathbb{P})
$$

この重み $w(p)$ の意味は、文脈（Context）に応じて以下のように解釈される。

- **実装コスト**: その性質を保証する変換器を作る難易度
- **検証コスト**: その性質が守られているかテストするコスト
- **リスク**: その性質が守られなかった場合の影響度

## 2.2 相対尺度（正規化）

総和が1（または100）になるように正規化された重み $w_{norm}$ を定義することもある。

$$
\sum_{p \in \mathbb{P}} w_{norm}(p) = 1
$$

### 重み配分の例（仮説）

| 性質 $p$ | 重み $w(p)$ | 理由 |
| :--- | :--- | :--- |
| $P_{syn}$ (構文) | 10 | 基礎的。自動化容易。 |
| $P_{flow}$ (制御) | 20 | 構造解析が必要。 |
| $P_{bound}$ (境界) | 15 | インターフェース整合。 |
| $P_{data}$ (データ) | 30 | データフロー解析が必要。高コスト。 |
| $P_{side}$ (副作用) | 50 | 環境依存。検証困難。最大コスト。 |

# 3. 保証強度（Guarantee Strength）

ある保証集合 $S \subseteq \mathbb{P}$ が持つ「強さ」を、要素の重みの総和として定義する。

## 3.1 定義

$$
Strength(S) = \sum_{p \in S} w(p)
$$

## 3.2 依存空間 $\mathcal{G}_{dep}$ 上での性質

$S \in \mathcal{G}_{dep}$ （すなわち $S$ がイデアルである）場合、この Strength 関数は、空間の順序構造と整合する。

**単調性（Monotonicity）:**
$$
S \subseteq T \implies Strength(S) \leq Strength(T)
$$

証明：
$T = S \cup (T \setminus S)$ であり、$w(p) \geq 0$ であるため、
$Strength(T) = Strength(S) + \sum_{p \in T \setminus S} w(p) \geq Strength(S)$。

# 4. 依存構造と強制コスト

Dependent Guarantee Space では、ある高度な性質 $p_{high}$ を保証しようとすると、その前提となる基礎性質 $p_{base}$ も（閉包演算により）強制的に保証セットに含まれる。

## 4.1 限界費用（Marginal Cost）

ある性質 $p$ を追加する際の「実質的なコスト」は、単体コスト $w(p)$ ではなく、その依存閉包全体を追加するコストである。

既存の保証状態 $S$ に対して、性質 $p$ を追加する場合の増分コスト $\Delta Cost(S, p)$：

$$
\Delta Cost(S, p) = Strength(Cl_D(S \cup \{p\})) - Strength(S)
$$

例：
$S = \{ P_{syn} \}$ の状態から、$P_{data}$ を追加する場合、
$Cl_D(\{ P_{syn}, P_{data} \}) = \{ P_{syn}, P_{flow}, P_{data} \}$ となるため、
増分コストは $w(P_{data})$ だけでなく $w(P_{flow})$ も加算される。

$$
\Delta Cost = w(P_{data}) + w(P_{flow})
$$

これは「データフローだけを保証することはできず、必然的に制御フローの保証コストも支払う必要がある」という工学的現実を数式化したものである。

# 5. 保証難易度モデル（Migration Difficulty）

この重み付き空間を用いて、移行プロジェクトの難易度を定量化する。

## 5.1 難易度（Difficulty）

現在の保証状態（現状）$S_{current}$ から、目標とする保証状態（To-Be）$S_{target}$ へ到達するための難易度 $Diff$ を定義する。

$$
Diff(S_{current}, S_{target}) = Strength(S_{target}) - Strength(S_{target} \cap S_{current})
$$

通常、$S_{target} = \top$（完全保証）を目指す場合、現状の達成度を引いた残りが難易度となる。

$$
Diff(\emptyset, \top) = Strength(\top) \quad \text{(全量コスト)}
$$

## 5.2 変換器の性能評価

変換ツール $T$ が保証できる集合を $S_T$ とすると、そのツールの「カバレッジ率」を定義できる。

$$
Coverage(T) = \frac{Strength(S_T)}{Strength(\top)}
$$

これにより、「ツールAは機能数は多いが重要な部分（重い部分）をカバーしていない」といった定性的な評価を定量化できる。

# 6. 幾何学的解釈と図式化

Weighted Guarantee Space は、各ノードに「高さ（Strength）」が与えられた地形（Landscape）として解釈できる。

## 6.1 Guarantee Landscape (Mermaid)

各ノードに (コスト) を付記したハッセ図。
※ 重み例: Syn=1, Bound=2, Flow=3, Data=5, Side=8

```mermaid
graph BT
    %% Nodes with Strength
    Bot[Bot (0)]
    Syn[Syn (1)]
    
    Flow[Flow + Syn (1+3=4)]
    Bound[Bound + Syn (1+2=3)]
    
    Data[Data + Flow + Syn (1+3+5=9)]
    
    BoundFlow[Bound + Flow + Syn (1+2+3=6)]
    
    NoSide[NoSide (1+2+3+5=11)]
    
    Top[Top (1+2+3+5+8=19)]

    %% Edges (Dependency / Inclusion)
    Bot --> Syn
    Syn --> Flow
    Syn --> Bound
    
    Flow --> Data
    Flow --> BoundFlow
    Bound --> BoundFlow
    
    Data --> NoSide
    BoundFlow --> NoSide
    
    NoSide --> Top
    
    %% Styles
    style Top fill:#f9f,stroke:#333,stroke-width:4px
    style Bot fill:#eee,stroke:#333
```

- **高さ（Y軸）**: Strengthを表す。
- **勾配**: 辺の傾きは、そのステップの限界費用（Marginal Cost）を表す。

# 7. 結論

Weighted Guarantee Space の定義により、保証構造に「重み」という距離空間的な性質が付与された。

1.  **定量評価**: 移行の進捗やツールの性能を、単なる集合の包含関係だけでなく、数値（Strength）として比較可能になった。
2.  **コスト構造の可視化**: 依存関係による「強制コスト」が形式化され、上位レベルの保証（$P_{side}$など）がいかに高コストであるかが理論的に説明可能になった。
3.  **意思決定への応用**: 「残りコスト」や「ROI」の算出根拠として使用できる。

これは、移行プロジェクトのマネジメント層（判断層）にとって強力な理論的武器となる。
