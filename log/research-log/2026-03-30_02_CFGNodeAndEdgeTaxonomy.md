# 2026-03-30_02_CFGNodeAndEdgeTaxonomy

## 🎯 今日の研究焦点（1つだけ）
- CFG のノード型・辺型の分類体系を、移行判断・危険構造識別・保証・境界説明に直結する軸で確定する。

## 🏗 モデル仮説
- 分類は実装都合ではなく、制御到達層として「何が観測点か・何が実効遷移として辺化されるか」を固定するための共通語彙である。
- ノードは分割・観測・再統合の点、辺は実効遷移であり、同一構文要素が両方を要請しうるが役割を混同しない。
- structured / non-structured の差は辺型でグラフ上に明示し、判断層では密度・merge 欠如・多出口などのリスク指標に読み替えうる。

## 🔬 構造設計（触った層：CFG ノード／辺・AST/IR 接続）
- **ノード型**：Entry、Exit/Terminal、Sequential/Plain、Branch、Merge、Loop header、Procedure boundary、Jump anchor、Exception/interrupt hook 等を定義した。
- **辺型**：Normal/fall-through、Conditional、Back edge、Call-like、Paragraph transition、Section boundary、Non-structured jump、Abnormal 等を定義した。
- **Structured edge**：branch/merge/loop/procedure により経路の再統合または終端が説明できる遷移。
- **Non-structured edge**：上記型付けに局所的に回収できない遷移（典型：GO TO）。
- **COBOL**：PERFORM THRU の範囲遷移、EXIT/GOBACK/STOP RUN と Exit/Terminal 系の接続を整理した。

## ✅ 今日の決定事項
- 三軸（制御役割・遷移様式・paragraph/section/PERFORM 文脈）で taxonomy を与えた。
- AST はラベルではなく根拠観測、IR は意味骨格、CFG は具体配置、DFG とは辺意味が異なる、と接続を明記した。
- 移行判断向けの質問に答える語彙として位置づけた。

## ⚠ 保留・未解決
- 例外フローを同一 CFG に統合する粒度。
- 動的制御を辺型に写す具体規約。

## 🧠 抽象度の到達レベル
L1: 構文  
L2: 制御  
L3: データ  
L4: 保証  
L5: 判断  

→ 今日の到達：
- L2：ノード／辺の型体系と structured / non-structured 判別基準を固定した。
- L4 / L5：taxonomy を保証分割・リスク読み取りの共通語彙として接続した。

## ⏭ 次の研究ステップ
- `03` 基本ブロック／制御領域、`05` 分岐・合流・経路で taxonomy を分割・経路論に接続する。
