# Research Log: Migration Complexity

- **ID**: 2026-03-05_11_MigrationComplexity
- **Date**: 2026-03-05
- **Author**: MSD-D
- **Status**: Completed
- **Tag**: #migration-complexity #migration-cost #path-finding #guarantee-space

## 1. 目的

COBOL移行プロジェクトの難易度を定量化するための指標として **Migration Complexity（移行複雑度）** を定義する。
Guarantee Transition Graph 上の Minimum Cost Path 問題を通じて、コストの本質的な構造を明らかにする。

## 2. 定義内容

### 2.1 Migration Distance

- 定義: $d(S, T) = |T \setminus S|$。
- 状態間の「距離」＝「必要な保証追加数」。
- Atomic Step の定義に基づき、パス長（ステップ数）と一致する。

### 2.2 Migration Cost

- 定義: $Cost(Path) = \sum_{p \in Path} w(p)$。
- 重み $w(p)$ が定数の場合、すべてのパスで総コストは一定（$\mu(\mathbb{P})$）となる。
- 将来的には、順序依存コスト $w(p \mid S)$ の導入を視野に入れる。

### 2.3 Migration Complexity

- 定義: $C = MinCost(\bot, \top)$。
- プロジェクト全体を完了するための最小コスト。
- 構造的要因（Dependency Depth, Guarantee Count, Branching Factor）に依存する。

## 3. 考察

現時点の基本モデルでは、重みが定数であるため、どのパスを選んでも総コストが変わらない（パス長 $|\mathbb{P}|$ も一定）。
しかし、この定義は将来的に「順序によってコストが変わる」状況（例：ある保証を先に導入するとリスクが減るなど）を扱うための基礎となる。
次フェーズでは、より現実的なコストモデル（状態依存コスト）やリスク評価を導入し、最適化問題としての深みを増す必要がある。

## 4. 成果物

- `docs/50_guarantee/11_Migration-Complexity.md`: 理論定義書。
