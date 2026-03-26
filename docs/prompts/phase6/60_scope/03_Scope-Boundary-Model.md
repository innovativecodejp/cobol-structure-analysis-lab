あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/03_Scope-Boundary-Model.md

これは Phase 6: Scope Theory の第3文書です。

この文書の目的は、Scope と Boundary の関係を形式化することです。
これは非常に重要な文書です。
Scope は有界でなければなりませんが、Boundary は Scope と同一ではありません。
この文書では、その差異を厳密に定義してください。

プロジェクト文脈:
- 01_Scope-Core-Definition.md で Scope を定義済み
- 02_Scope-Taxonomy.md で Scope の類型を整理済み
- 60_decision には decision boundary の概念が含まれる
- 50_guarantee には guarantee applicability や空間構造が含まれる

この文書では、Boundary がどのように Scope を定め、制約し、露出させ、リスク化するかを説明してください。

出力は日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. Boundary を形式的に定義すること
2. Scope と Boundary の関係を明確にすること
3. 明示境界と暗黙境界を説明すること
4. 内部境界と外部境界を説明すること
5. 境界横断を定義すること
6. 境界違反を定義すること
7. 境界の曖昧さが移行リスクの源になることを説明すること
8. 後続の impact や verification 文書への接続をつけること

以下の構成を必ずこの順番で使用してください。

# Scope Boundary Model

## 1. 問題設定
Scope に境界モデルが必要な理由を説明する。

## 2. 中心命題
「Scope は有界であるが、Boundary は Scope とは別概念である」という主張を述べる。

## 3. Boundary の形式的定義
Boundary を厳密に定義する。

## 4. Scope と Boundary
以下を説明する:
- Boundary がどのように Scope を区切るか
- なぜ Boundary は Scope と同一でないのか
- 1つの Scope を複数の Boundary が定めうること

## 5. Boundary の類型
最低でも以下を含めること:
- Explicit Boundary
- Implicit Boundary
- Internal Boundary
- External Boundary
- Structural Boundary
- Judgment Boundary

## 6. Boundary Crossing
制御、データ、依存、保証適用が境界をまたぐとはどういうことかを定義する。

## 7. Boundary Violation
境界違反がどのように解析や移行判断を不安定化させるかを説明する。

## 8. 移行判断上の意義
正しい scope-boundary alignment が移行実現性にどう効くかを説明する。

## 9. Mermaid 図
1つの Scope、その周囲の Boundary、そこを横断する経路を示す Mermaid 図を追加する。

## 10. 暫定結論
この文書で固定した内容と、後続文書への接続をまとめる。

重要な制約:
- Boundary を単なる線引きとして扱わないこと
- Boundary に構造的・分析的意味を持たせること
- containment と delimitation を区別すること
- 不明確な境界が誤った影響分析や保証帰属を生むことを示すこと

また、簡潔な小節として、
「Boundary ambiguity as a precursor of migration failure」
に相当する議論を必ず含めてください。