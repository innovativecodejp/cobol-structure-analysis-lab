# 2026-02-20

## 今日考えたこと
- 研究記録の正本を `log/` 配下に統一すると、更新責務と参照先が明確になり運用の迷いが減る。
- READMEは「理念説明」だけでなく「現行構成の実態説明」を継続的に同期させる必要がある。
- 文字化けコミットは見た目の問題ではなく、将来の監査性にも影響するため早期対応が望ましい。
- AST設計ではノード種を増やしすぎず、抽象カテゴリで止める方がIR以降の拡張に有利。

## 疑問
- `EVALUATE` を `BranchStatementNode` の下位分類で扱うか、独立ノード化するか。
- `INSPECT` / `UNSTRING` / `MOVE CORRESPONDING` をどの抽象カテゴリに寄せるのが一貫的か。
- `DECLARATIVES` を Procedure 構造にどこまで含めるか。

## 試したこと
- `log/` 正本化方針に合わせて `docs/00_project/ResearchLog.md` の廃止を実施。
- `README.md` の Repository Structure を現行構成に合わせて更新。
- `log/` 配下と `docs/prompts/` 配下を分離してコミット。
- 文字化けしていた旧コミットメッセージを、履歴再構築でローカル修正。
- Research Log を新規作成：
  - `log/research-log/2026-02-20_AST_NodeTaxonomy.md`

## まだ曖昧な点
- 履歴再構築後の `main` をどのタイミングで `--force-with-lease` 反映するか（運用判断）。
- Working Memo と Research Log の境界を、今後も一貫して保てるか。
- ASTノード最小集合のまま、実運用で必要な例外を吸収できるか。

## research-logに昇格する可能性があるもの
- Statementカテゴリ分類の確定規則（IF/EVALUATE/INSPECT/UNSTRING/MOVE CORRESPONDING）。
- DECLARATIVESのAST上の正式な責務定義。
