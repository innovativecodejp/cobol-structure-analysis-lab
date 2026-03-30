# 2026-03-30_02_CFGNodeAndEdgeTaxonomy

## 🎯 今日の目的
- `docs/30_cfg/02_CFG-Node-and-Edge-Taxonomy.md` に沿い、CFG の **ノード型・辺型** の分類体系を作業ログに要約する。
- 実装都合ではなく、**移行判断・危険構造・保証・境界説明** に直結する軸であることを押さえる。

## 🛠 実施内容
- 分類原則（制御役割・遷移様式・COBOL コンテキスト）と、ノードを混同しない **観測点 vs 実効遷移** の区別を整理した。
- ノード型（Entry、Exit/Terminal、Sequential、Branch、Merge、Loop header、Procedure boundary、Jump anchor 等）の要旨を一覧化した。
- 辺型（normal/fall-through、conditional、back edge、call-like、paragraph transition、section boundary、non-structured jump、abnormal 等）を整理した。
- **Structured edge** と **Non-structured edge** の判別基準を確認した。
- paragraph / section / PERFORM THRU / 終了系が辺・ノード分類にどう載るかを読んだ。

## 🔍 結果
- AST カテゴリ名と **同一視しない** 共通語彙として、CFG 上の観測点と遷移が型で固定された。
- non-structured・abnormal が多い領域は merge 欠如と相まって **保証分割・テスト設計** を複雑にしうる、というリスク観が言語化された。

## 💡 学び
- taxonomy は「ラベル付け」ではなく、**どこで分岐しどこで再統合されるか** を読むための判断用オントロジーだと理解した。
- 同一構文要素がノード化と辺化の両方を要請しうるが、**役割の混同を禁じる** のが一貫性の鍵。

## 🧠 思考整理
- IR の branch/join/loop/jump が、CFG では **具体配置＋辺型** まで落ちるイメージで `01` と接続した。
- 例外フローの統合粒度・動的制御の辺型は **未解決** として残る。

## 🧭 抽象レベル
- ノード・辺の **意味分類（taxonomy）** — DFG や型システムは対象外。

## ⚖ 移行判断への示唆
- 「非構造が局所か横断か」「保証を経路単位で割る必要がある箇所」といった **質問テンプレ** に答える語彙が揃った。
- リスク指標として、non-structured の密度・merge の有無・多出口が読み取れる土台になった。

## ⏭ 次のアクション
- `03` で基本ブロック／制御領域へ落とし、分割点と領域の言語を接続する。
- `07` で non-structured の詳細類型を必要に応じて拡張する前提をメモする。
