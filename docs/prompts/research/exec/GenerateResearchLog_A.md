# GenerateResearchLog_A

## 目的
TEMPLATE_A_General.md を使用して、
研究ログを生成し、指定パスに保存する。

---

## 入力パラメータ（毎回変更する）

- OutputPath: log/research-log/<YYYY-MM-DD>_<ThemeName>.md
- ThemeName: <ThemeName>
- TemplatePath: log/research-log/TEMPLATE_A_General.md

---

## 本文（以下をログ内容に反映する）

<ここに研究設計の確定内容を貼る>

---

## 本文に必ず含める項目

1. 🎯 今日の研究焦点（1つだけ）
2. 🏗 モデル仮説
3. 🔬 構造設計（触った層を明示：AST / IR / CFG / DFG）
4. ✅ 今日の決定事項（明確に列挙）
5. ⚠ 保留・未解決（明確に列挙）
6. 📊 Mermaid図（最大1枚）
7. 🧠 抽象度到達レベル（L1〜L5の明示）
8. ⏭ 次の研究ステップ

---

## 出力制約

- TEMPLATE_A_General.md の全セクションを必ず埋める
- Markdown形式で出力する
- 決定事項と保留事項を混在させない
- Mermaid図は最大1枚まで
- 文章は簡潔に（設計決定の記録に徹する）
- 生成後、OutputPathへ保存する

---

## 注意事項

- 実装ログにしない
- 複数テーマを混在させない
- 推測ではなく確定した設計のみ記載する
