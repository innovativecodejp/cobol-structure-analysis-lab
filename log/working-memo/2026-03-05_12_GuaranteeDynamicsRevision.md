# Working Memo: Guarantee Dynamics Revision

- **ID**: 2026-03-05_12_GuaranteeDynamicsRevision
- **Date**: 2026-03-05
- **Author**: MSD-D
- **Status**: Completed

## 1. 検討内容

`12_Guarantee-Dynamics.md` の改訂タスク。
Phase 2-C の理論的厳密化を行う。

### 1.1 Linear Extension
- Dynamics を「Linear Extension の時間的実行」とみなす視点は非常に重要。
- これにより、スケジューリング問題としての側面が強調される。

### 1.2 Activation Potential
- 「次にどれだけのタスクを解放できるか」という指標。
- $Unlock(p)$ （依存される要素）のうち、現在の状態 $S$ でまだ解放されていないものを数える。
- これにより、「ボトルネックの解消」を定量的に評価できる。

### 1.3 Criticality & Bottleneck
- Criticality: 静的な構造上の重要度（依存グラフの中心性）。
- Bottleneck: 動的なプロセス上の制約（パスの支配性）。
- 両者を区別して定義することで、分析の解像度が上がる。

## 2. 結果

- 文書 `12_Guarantee-Dynamics.md` を全面的に改訂した。
- 定義が数式ベースになり、曖昧さが排除された。

## 3. 次へのステップ

- 具体的な最適化手法（Prompt 4: Optimization Landscape）の実装検討。
