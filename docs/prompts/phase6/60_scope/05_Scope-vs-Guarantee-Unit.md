あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/05_Scope-vs-Guarantee-Unit.md

これは Phase 6 における重要な差分定義文書の1つです。
この文書の目的は、Scope と Guarantee Unit を厳密に区別することです。

プロジェクト文脈:
- 50_guarantee ではすでに Guarantee Unit が定義され、Guarantee Space 理論が展開されている
- 01_Scope-Core-Definition.md では Scope を定義済みである
- ここでは、Scope と Guarantee Unit が密接に関係していても同一ではないことを明確にしなければならない

この区別は本質的です。
Scope は適用範囲であり、Guarantee Unit は評価単位です。
この差を厳密かつ安定した形で定義してください。

出力は日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. Scope の意味を再確認すること
2. Guarantee Unit の意味を再確認すること
3. 両者が同一でない理由を説明すること
4. 1つの Scope の内部に複数の Guarantee Unit が存在しうることを説明すること
5. Guarantee が Scope の一部しか覆わない場合を説明すること
6. Scope と Guarantee coverage の関係を説明すること
7. 両者を混同すると保証理論がどう不安定化するかを示すこと
8. この区別を guarantee attribution と migration decision に接続すること

以下の構成を必ずこの順番で使用してください。

# Scope vs Guarantee Unit

## 1. 問題設定
なぜこの区別が必要なのかを説明する。

## 2. Scope の再確認
Scope を簡潔に再定義する。

## 3. Guarantee Unit の再確認
既存理論に基づいて Guarantee Unit を簡潔に再定義する。

## 4. 中核的差異
以下の違いを明確に定義する:
- Scope は target range である
- Guarantee Unit は evaluative unit である

## 5. 構造的関係
以下の関係可能性を説明する:
- 1つの Scope が複数の Guarantee Unit を含む
- 1つの Guarantee Unit が複数の内部構造にまたがる
- Scope に対して部分的な Guarantee coverage しかない場合

## 6. Guarantee Coverage と Scope
Guarantee の適用と Scope の区切りがどう相互作用するかを説明する。

## 7. 混同のリスク
Scope と Guarantee Unit を conflation した場合に何が破綻するかを説明する。

## 8. 移行判断上の意義
この区別が migration feasibility や guarantee-based reasoning にどう影響するかを説明する。

## 9. Mermaid 図
1つの Scope の中に複数の Guarantee Unit があり、保証被覆が部分的・不均一である様子を示す Mermaid 図を追加する。

## 10. 暫定結論
この区別とその重要性を要約する。

重要な制約:
- metric の議論だけに流れないこと
- 構造中心の議論にすること
- 既存の guarantee theory と整合した言葉遣いにすること
- Scope は「保証されるものそのもの」と同じではないことを強調すること

また、必ず次の趣旨の小節を入れてください:
「Guarantee applicability は Scope identity を定義しない」