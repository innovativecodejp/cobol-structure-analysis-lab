あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/06_Scope-vs-Migration-Unit.md

これは Phase 6 における第2の主要な差分定義文書です。
この文書の目的は、Scope と Migration Unit を区別することです。

プロジェクト文脈:
- 60_decision では migration feasibility と structural risk を扱っている
- 01 では Scope を定義している
- 05 では Scope と Guarantee Unit の違いを定義した
- ここではさらに、実際の移行実行または移行パッケージングに使われる単位と Scope を区別しなければならない

この文書では、分析スコープと移行実行単位はしばしば一致しないことを説明してください。
この不一致は、実際の移行判断において重要です。

出力は日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. Migration Unit を形式的に定義すること
2. それが Scope とどう異なるかを説明すること
3. analysis unit と execution unit の違いを説明すること
4. scope mismatch を説明すること
5. packaging constraints を説明すること
6. cutover feasibility への含意を説明すること
7. structural coherence と operational feasibility が乖離しうることを示すこと
8. この区別を migration planning logic に接続すること

以下の構成を必ずこの順番で使用してください。

# Scope vs Migration Unit

## 1. 問題設定
分析対象範囲と実行可能な移行単位を分離しなければならない理由を説明する。

## 2. Scope の再確認
Scope を簡潔に再定義する。

## 3. Migration Unit の形式的定義
Migration Unit を、移行における実務的または運用的な実行単位として定義する。

## 4. 中核的差異
以下の違いを説明する:
- analytical scope
- migration execution unit

## 5. Scope Mismatch
分析スコープの方が小さい場合、大きい場合を含めて説明する。

## 6. Packaging と Cutover への含意
移行グルーピング、リリースパッケージング、カットオーバー設計への影響を説明する。

## 7. 構造と運用の緊張関係
構造的には整合した Scope が、そのまま移行単位として実行できるとは限らないことを説明する。

## 8. 移行判断上の意義
この区別を無視すると feasibility judgment がなぜ崩れるかを説明する。

## 9. Mermaid 図
複数の Scope が1つの Migration Unit に束ねられる場合、または1つの Scope が複数の Migration Unit に分割される場合を示す Mermaid 図を追加する。

## 10. 暫定結論
この区別とその含意を要約する。

重要な制約:
- プロジェクト管理論に流れないこと
- 議論は構造的・判断理論的レベルに保つこと
- 逸話ではなく形式的区別にすること
- mismatch を移行リスクの構造的源として強調すること

また、必ず次の趣旨の節を入れてください:
「Analytical coherence does not guarantee migration executability」