あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/02_Scope-Taxonomy.md

これは Phase 6: Scope Theory の第2文書です。

この文書の目的は、Scope の分類体系を確立することです。
Scope を単一で未分化な概念として扱ってはいけません。
この文書では、研究モデルに必要な主要な Scope の種別を定義し、それらを首尾一貫した分類体系として整理してください。

プロジェクト文脈:
- 10_ast は構文単位と AST 粒度を定義している
- 50_guarantee は保証指向の構造抽象を定義している
- 60_decision は移行判断の抽象を定義している
- 01_Scope-Core-Definition.md では Scope を「有界な意味的対象領域」として定義済みである

この文書では、異なる抽象層にまたがる Scope の分類体系を与えてください。

出力は日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. Scope の分類体系がなぜ必要かを定義すること
2. Scope を主要カテゴリに分類すること
3. 構文、構造、保証、判断に関わる Scope を分離すること
4. 複数の Scope 種別がどのように重なり、相互作用しうるかを説明すること
5. 異なる Scope 種別が異なる分析目的を持つことを示すこと
6. 後続の boundary、containment、impact、verification、completeness 文書の基礎を準備すること

以下の構成を必ずこの順番で使用してください。

# Scope Taxonomy

## 1. 問題設定
Scope を単一概念のままにできない理由を説明する。

## 2. 分類原理
どの基準で Scope を分類するのかを説明する。

## 3. 主要な Scope 類型
最低でも次を含めること:
- Syntactic Scope
- Structural Scope
- Control Scope
- Data Scope
- Dependency Scope
- Guarantee Scope
- Decision Scope
- Verification Scope
- Impact Scope
- Migration Scope

## 4. 各 Scope 類型の記述
各 Scope 類型について、以下を含めること:
- 定義
- 主目的
- 抽象層
- 他の Scope との代表的関係

## 5. 層横断的解釈
構文層 / 構造層 / 判断層をまたぐ Scope の性質を説明する。

## 6. Scope の重なりと緊張関係
異なる Scope が重複・乖離・部分衝突しうることを説明する。

## 7. 移行判断上の意義
分類体系が移行設計や実現性分析にどう効くかを説明する。

## 8. Mermaid 図
Scope の分類体系を層状または階層状に表す Mermaid 図を追加する。

## 9. 暫定結論
分類結果を要約し、次の文書群への接続を示す。

重要な制約:
- 分類は場当たり的ではなく、原理的であること
- すべての Scope をひとつに潰さないこと
- 単なる例示集にしないこと
- 理論的に安定した分類にすること
- 先行文書と整合する用語を用いること

また、短い小節として、
「どの Scope 類型が syntax-facing か、どれが structure-facing か、どれが judgment-facing か」
を明示してください。