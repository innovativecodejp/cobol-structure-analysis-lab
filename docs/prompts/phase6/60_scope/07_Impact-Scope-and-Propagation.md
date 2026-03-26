あなたは「COBOL Structural Analysis Lab」プロジェクト内で作業しています。

今回のタスクは、次のファイルを作成することです。

60_scope/07_Impact-Scope-and-Propagation.md

この文書の目的は、変更影響と伝播の到達範囲として Scope を形式化することです。
これは scope theory と、後続の dependency / propagation / impact analysis をつなぐ橋渡し文書です。

プロジェクト文脈:
- 03 で Boundary を形式化済み
- 04 で Scope 間の関係を形式化済み
- 40_dfg では後に dependency flow をより詳細に扱う
- 60_decision では structural risk と feasibility reasoning を扱っている

この文書では、変更がどのように構造を通じて広がり、その結果として到達領域が Impact Scope を成すかを定義してください。

出力は日本語で、正式な研究用 Markdown 文書として作成してください。

必須要件:
1. change origin を定義すること
2. propagation path を定義すること
3. impact reachability を定義すること
4. Impact Scope を定義すること
5. control、data、dependency が伝播をどう駆動するかを説明すること
6. local impact scope と extended impact scope を説明すること
7. impact closure を説明すること
8. impact scope を risk と migration feasibility に接続すること

以下の構成を必ずこの順番で使用してください。

# Impact Scope and Propagation

## 1. 問題設定
変更影響分析に scope の形式化が必要な理由を説明する。

## 2. 中心命題
影響とは、単なる影響ノードの一覧ではなく、伝播によって形成される Scope であることを述べる。

## 3. Change Origin
変更の出発点を定義する。

## 4. Propagation Path
影響が構造関係を通って伝わる経路を定義する。

## 5. Reachability
影響に関係する structural reachability を定義する。

## 6. Impact Scope
意味のある伝播によって到達された領域を形式的に定義する。

## 7. Local vs Extended Impact Scope
即時影響範囲と伝播後の拡張影響範囲を区別する。

## 8. Impact Closure
Impact Scope が閉じたと見なせる条件を説明する。

## 9. 移行判断上の意義
Impact Scope が risk、packaging、verification、feasibility にどう効くかを説明する。

## 10. Mermaid 図
change origin から control/data/dependency edge を通って impact scope に至る伝播図を追加する。

## 11. 暫定結論
この文書で確立したモデルを要約する。

重要な制約:
- モデルは構造的に保ち、実装依存にしないこと
- 影響を単なるテキスト参照数に還元しないこと
- impact propagation を意味的な structural reachability として扱うこと
- 将来の CFG / DFG と整合する概念基盤にすること

また、必ず次の趣旨の小節を含めてください:
「Impact は平坦な影響物一覧ではなく、Scope を持つ現象である」