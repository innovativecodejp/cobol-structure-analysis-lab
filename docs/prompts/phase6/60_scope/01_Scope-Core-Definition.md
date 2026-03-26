あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/01_Scope-Core-Definition.md

このファイルは Phase 6: Scope Theory の最初の文書です。

この文書の目的は、「Scope」を研究モデルにおける中核概念として形式的に定義することです。
これは日常語としての「範囲」や「領域」の説明ではありません。
Scope を、AST・Guarantee・Decision を接続する、構造的かつ判断理論上重要な概念として定義してください。

プロジェクト文脈:
- 10_ast では構文単位、AST のスコープ、粒度、ノード分類を定義している
- 50_guarantee では Guarantee Unit、Guarantee Space、dependent / weighted / metric / lattice / dynamics を定義している
- 60_decision では decision space、structural risk、migration feasibility、decision boundary、case-study analysis、verification framework を定義している

この文書では、なぜこれらの後に Scope が必要になるのかを説明しなければなりません。

出力は英語ではなく、日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. Scope を、解析・保証適用・移行判断のための「有界な意味的対象領域」として定義すること
2. Scope と Boundary の違いを明確にすること
3. Scope と Unit の違いを明確にすること
4. Scope と Region の違いを明確にすること
5. Scope と Context の違いを明確にすること
6. Scope がなぜ移行解析に本質的なのかを説明すること
7. Scope の初期的な形式的性質を述べること
8. Scope を AST、Guarantee Unit、Decision Model に接続すること
9. Scope が曖昧だと、どのように構造理論および移行判断理論が破綻するかを説明すること

以下の構成を必ずこの順番で使用してください。

# Scope Core Definition

## 1. 問題設定
Scope の形式化がなぜ必要かを説明する。

## 2. なぜこの段階で Scope が必要になるのか
AST、Guarantee、Decision だけではなぜ不十分なのかを説明する。

## 3. 中心命題
この文書の中心となる主張を述べる。

## 4. Scope の形式的定義
Scope の定義を厳密に与える。

## 5. 他概念との区別
### 5.1 Scope と Boundary
### 5.2 Scope と Unit
### 5.3 Scope と Region
### 5.4 Scope と Context

## 6. Scope の構造的役割
構文構造、保証適用、移行判断のあいだで Scope が果たす役割を説明する。

## 7. Scope の初期形式的性質
少なくとも以下を含めること:
- boundedness
- containment
- traceability
- applicability
- composability
- closure relevance

## 8. 移行判断上の意義
Scope の明確さが、移行実現性、影響分析、検証にどう効くかを説明する。

## 9. 曖昧性のリスク
Scope が曖昧なままだと、どのような理論的・実務的破綻が起きるかを説明する。

## 10. Mermaid 図
AST / Guarantee / Decision の接続層として Scope を示す Mermaid 図を1つ追加する。

## 11. 暫定結論
この文書で固定した定義と、後続文書で何を洗練するかをまとめる。

重要な執筆制約:
- 文体は正式で研究志向にすること
- 実装詳細に流れないこと
- プログラミング技法の話をしないこと
- 抽象度を明示的に保つこと
- ツールではなく構造的意味を重視すること
- Scope を第一級の形式概念として扱うこと
- Scope を単なる構文的範囲に還元しないこと

また、短い明示的な節として、次の主張を必ず含めてください:
「Scope は Guarantee Unit と同一ではなく、Migration Unit とも同一ではない。これらの区別は後続文書で形式化される。」

文書は、この 60_scope ディレクトリ全体の土台となるよう、十分に厚みがあり、一貫性があり、研究文書として成立するものにしてください。