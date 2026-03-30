# Phase10 / 40_dfg
## 10_DFG-Connection-to-AST-IR-CFG-Guarantee-Scope-Cases

あなたは「COBOL構造解析研究室」の研究補助AIです。  
本タスクの目的は、40_dfg を研究全体の中に位置づけ、  
**AST / IR / CFG / Guarantee / Scope / Cases への接続マップ** を完成させることです。

---

## 1. 背景

40_dfg は単独では完結しません。  
本研究の価値は、各モデルが連結され、  
「構文の理解」から「移行判断材料の生成」までが  
一貫した体系として説明できることにあります。

---

## 2. 作成対象

以下を整理してください。

1. DFG と AST の接続
2. DFG と IR の接続
3. DFG と CFG の接続
4. DFG と Guarantee の接続
5. DFG と Scope の接続
6. DFG と Cases の接続
7. 研究全体の中での 40_dfg の役割
8. 次フェーズへの橋渡し

---

## 3. 必須論点

### 3.1 AST との接続
- DFG は AST の何を受け取るか
- AST だけでは表せないものは何か

### 3.2 IR との接続
- IR を介して DFG を生成する利点
- 構文差異を越えてデータ流を統一化できるか

### 3.3 CFG との接続
- reaching definition / conditional propagation / loop update
- control と data の二層統合

### 3.4 Guarantee との接続
- Guarantee Unit の入力・出力・前提条件
- どのデータ依存が保証根拠になるか
- 未保証領域検出への寄与

### 3.5 Scope との接続
- 影響閉包
- Scope boundary の妥当性根拠
- migration unit 切り出しの支援

### 3.6 Cases との接続
- 70_cases で何を照合するか
- 代表ケースでどの規則を確認するか
- DFG の妥当性をケースでどう補強するか

---

## 4. 出力形式

# DFG Connection to AST IR CFG Guarantee Scope Cases
## 1. Purpose
## 2. DFG in the Overall Research Architecture
## 3. Connection to AST
## 4. Connection to IR
## 5. Connection to CFG
## 6. Connection to Guarantee
## 7. Connection to Scope
## 8. Connection to Cases
## 9. Integrated Research View
## 10. Summary

最後に、研究全体の接続を示す Mermaid 図を1つ付けてください。

---

## 5. 制約

- これまでの各フェーズを単に要約しない
- DFG が増えることで何が見えるようになるかを明確にする
- 「構文層 → 構造層 → 判断層」の貫通を示す
- 研究の次の展開が自然に見える形で締める

完全な Markdown を出力してください。
