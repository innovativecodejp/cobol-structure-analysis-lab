# Research Log: Migration Complexity Revision

- **ID**: 2026-03-05_11_MigrationComplexityRevision
- **Date**: 2026-03-05
- **Author**: MSD-D
- **Status**: Completed
- **Tag**: #migration-complexity #linear-extension #optimization #state-dependent-cost

## 1. 目的

`11_Migration-Complexity.md` を改訂し、数学的一貫性を高め、より現実的な移行コストモデルを導入する。
特に、Migration Path を Linear Extension として再定義し、コストを状態依存型に拡張する。

## 2. 改訂内容

### 2.1 Migration Path の厳密定義
- **旧定義**: Path = $(S_0, \dots, S_n)$ （グラフ表現のみ）。
- **新定義**: Migration Path は、依存関係 Poset $(P, \leq_D)$ の **Linear Extension（線形拡張）** に対応すると定義。
- これにより、パスの順序性が数学的に裏付けられた。

### 2.2 Cost 定義の強化
- **旧定義**: $Cost(Path) = \sum w(p)$ （定数重み）。
- **新定義**: $w(p \mid S)$ を導入し、導入順序（現在の状態 $S$）に依存するコスト関数を定義。
- $Cost(Path) = \sum w(p_i \mid S_{i-1})$。
- これにより、順序最適化の意味が生まれた。

### 2.3 Order Complexity
- 可能な Linear Extension の総数 $e(P)$ を **Order Complexity** として導入。
- 探索空間の広さを表す指標。

### 2.4 Branching Factor の数学定義
- $Branch(S) = | \{ p \notin S \mid S \cup \{p\} \in G_{dep} \} |$。
- 追加可能な有効な保証性質の数として定義。

### 2.5 Normalized Complexity の改善
- $\bar{C} = C / \mu(\mathbb{P})$。
- 単なる個数ではなく、基本コストの総和で正規化。

## 3. 結論

Migration Complexity 理論は、単なるグラフ探索から、**Poset 上の最適 Linear Extension 探索問題** へと昇華された。
状態依存コストの導入により、実務的な「段取り」の重要性を数理的に扱えるようになった。
