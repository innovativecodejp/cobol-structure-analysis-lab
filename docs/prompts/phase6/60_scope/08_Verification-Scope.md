あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/08_Verification-Scope.md

この文書の目的は、どの範囲に対して検証証拠が必要または十分とされるのかを Scope として定義することです。
これは一般的な testing coverage の話ではありません。
保証や移行判断を支えるために、どの領域を検証すべきかを定める構造理論です。

プロジェクト文脈:
- 50_guarantee では保証指向の抽象を定義済み
- 60_decision には verification framework がある
- 07 で impact scope を定義済み
- ここでは Verification Scope を、証拠収集と妥当性確認の対象範囲として形式化する必要がある

出力は日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. Verification Scope を定義すること
2. local verification / boundary verification / dependency verification を説明すること
3. impact scope と verification scope の関係を説明すること
4. verification range の adequacy を説明すること
5. verification evidence collection region を説明すること
6. under-verification と false confidence を説明すること
7. verification scope を guarantee support と decision evidence に接続すること

以下の構成を必ずこの順番で使用してください。

# Verification Scope

## 1. 問題設定
検証に独自の Scope 概念が必要な理由を説明する。

## 2. 中心命題
検証は、適切に定義された target scope に対してのみ妥当であることを述べる。

## 3. Verification Scope の形式的定義
Verification の対象領域を厳密に定義する。

## 4. Verification Scope の類型
最低でも以下を含めること:
- Local Verification Scope
- Boundary Verification Scope
- Dependency Verification Scope
- Extended Verification Scope

## 5. Impact Scope との関係
Verification Scope が Impact Scope と一致する場合、超える場合、遅れる場合を説明する。

## 6. Evidence Adequacy
検証範囲が十分であるとは何かを説明する。

## 7. Under-Verification のリスク
狭すぎる検証が invalid guarantees や weak decision evidence を生むことを説明する。

## 8. 移行判断上の意義
Verification Scope が feasibility、confidence、decision support にどう関わるかを説明する。

## 9. Mermaid 図
Impact Scope と Verification Scope の一致または不一致を示す Mermaid 図を追加する。

## 10. 暫定結論
この概念を要約する。

重要な制約:
- verification scope を test case 数と同一視しないこと
- 抽象度は構造的・判断理論的に保つこと
- 実行活動量ではなく、証拠の十分性を重視すること
- guarantee theory と整合させること

また、必ず次の趣旨の節を入れてください:
「Verification confidence is scoped, not absolute」