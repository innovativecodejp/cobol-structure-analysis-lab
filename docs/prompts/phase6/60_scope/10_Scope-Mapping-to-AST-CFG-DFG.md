あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/10_Scope-Mapping-to-AST-CFG-DFG.md

これは Phase 6 の統合文書です。
この文書の目的は、Scope 理論を研究プロジェクトの主要構造モデルへ写像することです。

プロジェクト文脈:
- 10_ast は AST 指向の構造と粒度を定義している
- 30_cfg は制御フロー構造を扱う予定である
- 40_dfg は依存 / データフロー構造を扱う予定である
- 50_guarantee は保証抽象を定義している
- 60_decision は判断抽象を定義している
- 60_scope の 01〜09 では Scope 理論そのものを定義済みである

この文書では、Scope が AST、CFG、DFG、Guarantee、Decision の各層で異なる仕方で現れつつも、理論上は整合していることを説明してください。

出力は日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. AST-facing Scope を定義すること
2. CFG-facing Scope を定義すること
3. DFG-facing Scope を定義すること
4. Guarantee-facing Scope を定義すること
5. Decision-facing Scope を定義すること
6. cross-model correspondence を説明すること
7. 1つの Scope 概念がモデルごとに異なる現れ方をする理由を説明すること
8. Phase 6 から後続構造フェーズへの橋渡し文書とすること

以下の構成を必ずこの順番で使用してください。

# Scope Mapping to AST CFG DFG

## 1. 問題設定
Scope 理論を構造モデルへ写像しなければならない理由を説明する。

## 2. 中心命題
Scope は principle 上は model-invariant だが、manifestation においては model-specific であることを述べる。

## 3. AST における Scope
syntax-oriented tree structure において Scope がどう現れるかを説明する。

## 4. CFG における Scope
control reachability や branching structure において Scope がどう現れるかを説明する。

## 5. DFG における Scope
dependency と data propagation の構造において Scope がどう現れるかを説明する。

## 6. Guarantee 理論における Scope
guarantee applicability と coverage を Scope がどう枠づけるかを説明する。

## 7. Decision 理論における Scope
feasibility、evidence、judgment boundary を Scope がどう枠づけるかを説明する。

## 8. Cross-Model Correspondence
各モデル間での写像関係と概念整合を説明する。

## 9. 移行判断上の意義
cross-model scope alignment が reliable migration reasoning に不可欠であることを説明する。

## 10. Mermaid 図
1つの抽象 Scope が AST / CFG / DFG / Guarantee / Decision 各層に投影される様子を示す Mermaid 図を追加する。

## 11. 暫定結論
この統合文書で達成した接続を要約する。

重要な制約:
- すべてのモデルが Scope を同一表現するかのように書かないこと
- 単純な equivalence ではなく correspondence を強調すること
- 議論はアーキテクチャ / 理論レベルに保つこと
- Phase 6 の締めくくり文書としてふさわしいものにすること

また、必ず次の趣旨の節を入れてください:
「Model-specific manifestation and theory-level invariance」