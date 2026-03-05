# Working Memo: Migration Complexity

- **ID**: 2026-03-05_11_MigrationComplexity
- **Date**: 2026-03-05
- **Author**: MSD-D
- **Status**: Completed

## 1. 検討内容

Phase 2-B の「Migration Complexity」の定義に関するタスク。
`docs/50_guarantee/11_Migration-Complexity.md` を作成する。

### 1.1 Distance Definition
- Guarantee Transition Graph 上の距離 $d(S, T)$ を、集合の差分 $|T \setminus S|$ として定義。
- $S \subseteq T$ を前提とする（逆行は考えない）。
- これは、パス上の Atomic Steps の数と等しい。

### 1.2 Cost Function
- 各保証 $p$ に重み $w(p)$ を付与。
- パスのコストは重みの総和 $\sum w(p)$。
- 重みが定数なら、総コストは常に一定（$\mu(\mathbb{P})$）。
- しかし、順序によって「難易度」が変わる可能性を考慮し、一般形として Minimum Cost Path を定義する。

### 1.3 Complexity Definition
- Migration Complexity $C = MinCost(\bot, \top)$。
- プロジェクト全体を完了するための最小コスト。
- 構造的要因（依存深さ、保証数、分岐）が複雑度に影響を与える。

## 2. 結果

- 文書 `11_Migration-Complexity.md` 作成完了。
- 移行難易度を定量化する枠組みができた。
- 現時点では定数重みモデルだが、将来的な拡張（状態依存コスト）への道筋を示した。

## 3. 次へのステップ

- 具体的な最適化アルゴリズム（Dijkstra, A*など）の導入。
- 順序依存コスト（Risk-Adjusted Cost）の検討。
