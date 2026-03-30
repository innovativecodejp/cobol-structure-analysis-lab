# 2026-03-31_02_DFGNodeAndEdgeTaxonomy

## 🎯 今日の研究焦点（1つだけ）
- DFG のノード種別・エッジ種別を、移行分析に効く **構造分類** として体系化する。

## 🏗 モデル仮説
- AST ノードの焼き直しではなく、「依存の端点」と「依存の向き」の語彙として分類する。
- 粒度は変数単位だけでなく、グループ／要素／ファイルレコードを切り替えうる。

## 🔬 構造設計
- ノード：Data Item、Literal、式結果、入出力端点、条件関連、集約／下位など。
- エッジ：define/use、overwrite、propagation、derived-from、aggregation/decomposition、input/output、condition-dependency、cross-scope transfer。
- 接続制約と Scope／Guarantee への影響を表で整理。

## ✅ 今日の決定事項
- 条件 use と値 use をエッジ種別で区別しうることを明記。
- 暗黙ノード（STRING 等）は任意だが方針の一貫性を要求。

## ⚠ 保留・未解決
- 式の中間結果ノード化の深さはツール方針で可変。

## 🧠 抽象度の到達レベル
→ L3：分類体系が `03` define/use の単位を供給。

## ⏭ 次の研究ステップ
- `03` で define/kill/reach の規則へ接続する。
