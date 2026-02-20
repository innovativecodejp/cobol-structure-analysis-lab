# 2026-02-21

## 今日考えたこと
- AST設計では「ノードを増やす」よりも「粒度原則を固定する」ほうが、後続のIR設計を安定させやすい。
- 1命令1ノードを基本としつつ、例外は明示的に定義する方針が運用しやすい。
- 構文安定性を優先したASTは、意味分解をIRへ委譲する境界を明確にできる。

## 疑問
- `EVALUATE` を `BranchStatementNode` の一種として扱うか、独立ノードにするか。
- `INSPECT` / `UNSTRING` / `STRING` は1ノードで十分か、内部構造を持たせるべきか。
- `DECLARATIVES` をProcedure構造にどう位置づけると整合性が高いか。

## 試したこと
- Research Log を新規作成:
  - `log/research-log/2026-02-21_AST_GranularityPolicy.md`
- AST粒度方針の明文化:
  - 構文単位を基本
  - 副作用展開を行わない
  - 意味分解をIRへ委譲
- 同Research Logを追記調整し、`AT END` / `INVALID KEY` の扱いをIR分解対象として統一。

## まだ曖昧な点
- ノード粒度の例外規則をどの条件で発火させるか。
- `MOVE CORRESPONDING` のIR展開後に保持すべきトレーサビリティ情報。
- AST粒度方針をCFG/DFG定義へ接続する際の記述ルール。

## research-logに昇格する可能性があるもの
- `EVALUATE` / `INSPECT` / `UNSTRING` / `STRING` の最終分類ルール。
- AST粒度例外ポリシー（例外条件・記録方式・検証基準）。
