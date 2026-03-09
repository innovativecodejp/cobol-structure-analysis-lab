# 2026-02-19

## 今日考えたこと
- COBOL解析エンジンの設計において、実装よりも先に「構造の正しさ」を定義する必要がある
- 実装記録と設計記録を分離しないと、後から「なぜこの設計になったか」が追えなくなる
- Research Log と Working Memo の2層構造にすることで、思考の発散と収束を管理できる
- ASTの責務を「構文の忠実な写像」に限定し、意味解析をIRに逃がすことで、パーサの複雑性を排除できる

## 疑問
- ASTで `PERFORM THRU` や `ALTER` のような複雑な制御構造をどう表現するか？（構文木としてそのまま残すか、ある程度脱糖するか）
- `COPY` 展開はパース前に行うべきか、AST構築時に行うべきか？（ソース位置情報の維持との兼ね合い）

## 試したこと
- README.md の更新（Mermaid図を用いたアーキテクチャ記述への差し替え）
- `log/research-log` ディレクトリの作成と運用規約 (`README.md`) の策定
- `log/working-log` ディレクトリの作成と運用規約 (`README.md`) の策定
- Research Log テンプレート (`TEMPLATE_A_General.md`) の作成
- Research Log 生成プロンプト (`GenerateResearchLog_A.md`) の作成
- ASTの責務定義に関するResearch Logの作成
  - `2026-02-19_AST_ScopeDefinition.md`
  - `2026-02-19_AST_ScopeFormalization.md`

## まだ曖昧な点
- IRの具体的な形式定義（CFG/DFGとの関係性）
- Symbol Table の構築タイミング（AST構築時 vs IR変換時）
- エラー回復戦略（パースエラー時のAST構築）

## research-logに昇格する可能性があるもの
- IRの責務定義（ScopeFormalizationと同レベルの厳密定義）
- Symbol解決の戦略決定
