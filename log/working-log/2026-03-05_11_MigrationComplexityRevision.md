# Working Memo: Migration Complexity Revision

- **ID**: 2026-03-05_11_MigrationComplexityRevision
- **Date**: 2026-03-05
- **Author**: MSD-D
- **Status**: Completed

## 1. 検討内容

`11_Migration-Complexity.md` の改訂タスク。
理論的厳密性と実用性を両立させるための定義変更を行う。

### 1.1 Linear Extension
- Migration Path を単なる「状態列」ではなく、「依存順序を守った全順序化（Linear Extension）」として定義。
- これにより、順序理論の知見（例えば、Linear Extension の数え上げ問題 #P-complete など）と接続できる。

### 1.2 State-Dependent Cost
- $w(p \mid S)$ の導入。
- 「ある機能を先に実装しておけば、次の機能の実装が楽になる（あるいは逆）」という状況を表現可能に。
- これがなければ、どの順序でも総コストが変わらないため、最適化の意味がない。

### 1.3 Complexity Factors
- Cost Complexity: 単純な重みの総和。
- Order Complexity: Linear Extension の数。探索空間の広さ。
- Branching Factor: 各ステップでの選択肢の数。

## 2. 結果

- 文書 `11_Migration-Complexity.md` を全面的に書き換えた。
- 構造的要因（Structure）とコスト的要因（Cost）が明確に分離・統合された。

## 3. 次へのステップ

- 具体的なコスト関数の設計（何をもってコストとするか）。
- 最適化アルゴリズムの実装検討。
