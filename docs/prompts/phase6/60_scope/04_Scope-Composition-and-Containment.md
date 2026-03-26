あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/04_Scope-Composition-and-Containment.md

この文書の目的は、Scope 同士の構造関係を形式化することです。
具体的には、containment、nesting、overlap、intersection、union / composition、partition を、Scope 上の形式的な関係または操作として定義してください。

このファイルは Phase 6: Scope Theory に属します。

プロジェクト文脈:
- 01 で Scope を定義済み
- 02 で Scope taxonomy を定義済み
- 03 で Boundary を定義済み
- 後続文書では impact propagation、verification range、completeness を扱う

この文書では、Scope を孤立した対象ではなく、相互に含み合い、重なり、構成される構造的対象として扱ってください。

出力は日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. scope containment を定義すること
2. nested scope を定義すること
3. scope overlap を定義すること
4. scope intersection を定義すること
5. scope union または composition を定義すること
6. scope partition を定義すること
7. composition が意味を保つ場合と、分析精度を壊す場合を説明すること
8. scope structure が migration packaging や verification design にどう効くかを説明すること

以下の構成を必ずこの順番で使用してください。

# Scope Composition and Containment

## 1. 問題設定
孤立した Scope 定義だけでは不十分な理由を説明する。

## 2. 中心命題
Scope は孤立した対象領域ではなく、関係構造を成すことを述べる。

## 3. Containment
1つの Scope が別の Scope を含む条件を定義する。

## 4. Nesting
階層的または埋め込み的な Scope を説明する。

## 5. Overlap
部分重複を定義し、なぜそれが分析上重要かを説明する。

## 6. Intersection
2つの Scope の共有領域とその意味を定義する。

## 7. Union / Composition
Scope を結合できる場合と、その際のリスクを説明する。

## 8. Partition
大きな Scope を小さな Scope に分割することを説明する。

## 9. 構造的解釈
containment と composition を control / data / dependency structure に接続する。

## 10. 移行判断上の意義
composition と containment が migration packaging、cutover design、verification planning にどう関わるかを説明する。

## 11. Mermaid 図
nested、overlapping、intersecting、composed scopes を示す Mermaid 図を追加する。

## 12. 暫定結論
この文書で確立した構造操作を要約する。

重要な制約:
- 議論は形式的かつ構造的にすること
- 単なる集合論の説明にしないこと（ただし集合的言語を補助的に使うのは可）
- 各関係の意味的側面を説明すること
- careless composition が無効な migration grouping を生むことを示すこと

また、必ず次の主題を明示的に論じる節を入れてください:
「結合された Scope が分析的一貫性を失うのはどのような場合か」