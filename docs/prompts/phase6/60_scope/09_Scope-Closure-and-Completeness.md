あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/09_Scope-Closure-and-Completeness.md

この文書の目的は、分析・保証帰属・検証・移行判断のために、Scope がいつ十分に closed であり、十分に complete であると見なせるかを形式化することです。

プロジェクト文脈:
- 03 で Boundary を定義済み
- 04 で containment と composition を定義済み
- 07 で Impact Scope を定義済み
- 08 で Verification Scope を定義済み
- 60_decision では feasibility と verification reasoning を扱っている

この文書では、closure と completeness を Scope に対する形式的 adequacy condition として定義してください。

出力は日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. Scope Closure を定義すること
2. Structural Completeness を定義すること
3. Dependency Completeness を定義すること
4. Guarantee Completeness を定義すること
5. Verification Completeness を定義すること
6. どのような Scope が判断に不十分かを説明すること
7. 不完全な Scope が false feasibility judgment を生むことを説明すること
8. completeness を decision adequacy に接続すること

以下の構成を必ずこの順番で使用してください。

# Scope Closure and Completeness

## 1. 問題設定
Scope を定義しただけでは不十分である理由を説明する。

## 2. 中心命題
Scope は、その intended analytical use に対して adequate、closed、sufficiently complete でなければならないことを述べる。

## 3. Scope Closure
関連する構造関係および依存関係に対する closure を定義する。

## 4. Structural Completeness
構造内容が十分に含まれている条件を定義する。

## 5. Dependency Completeness
依存関係上重要な要素が十分に含まれている条件を定義する。

## 6. Guarantee Completeness
意味ある guarantee attribution を支えられる条件を定義する。

## 7. Verification Completeness
十分な verification evidence を支えられる条件を定義する。

## 8. Decision Adequacy
closure と completeness が migration feasibility judgment にどう影響するかを説明する。

## 9. Incomplete Scope のリスク
不完全な analysis target が理論的・実務的にどのようなリスクを持つかを説明する。

## 10. Mermaid 図
incomplete scope と closed / complete scope を対比する Mermaid 図を追加する。

## 11. 暫定結論
この文書で定義した adequacy condition を要約する。

重要な制約:
- completeness を単なるサイズや coverage percentage に還元しないこと
- completeness を relation-sensitive かつ purpose-sensitive に扱うこと
- 議論は形式的かつモデル指向に保つこと
- closure を dependency と propagation に明示的に接続すること

また、必ず次の趣旨の小節を入れてください:
「Scope は bounded であっても inadequate でありうる」