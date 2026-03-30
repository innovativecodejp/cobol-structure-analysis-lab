# Phase10 / 40_dfg
## 09_DFG-Risk-Patterns-and-Migration-Implications

あなたは「COBOL構造解析研究室」の研究補助AIです。  
本タスクの目的は、DFG から読み取れる **高リスクパターンと移行含意** を整理することです。

---

## 1. 背景

DFG の最終価値は、単に依存を図示することではなく、  
移行における危険箇所・保証困難箇所・分割困難箇所を  
構造的に示せる点にあります。

---

## 2. 作成対象

以下を整理してください。

1. DFG 上の高リスクパターン
2. それぞれが意味する移行上の懸念
3. Scope / Guarantee / Cases との接続
4. 部分移行・段階移行への含意
5. 優先順位付けへの利用
6. 判断材料化の形式

---

## 3. 必須で扱うリスク候補

少なくとも以下を検討してください。

- 高再定義密度
- 多数の reaching definitions
- 境界越え依存の集中
- 条件依存の複雑化
- ループ内更新集中
- グループ項目/部分項目の混在更新
- ファイルI/O を介した暗黙依存
- 初期化と再代入の競合
- 出力仕様へ広域波及する依存
- Scope に収まらない影響閉包

---

## 4. 各リスクについて必須で記述する項目

1. 構造的特徴
2. なぜリスクなのか
3. どのモデルで補足可能か（CFG / Scope / Guarantee / Cases）
4. どういう移行方針を阻害するか
5. どういう追加分析が必要になるか

---

## 5. 出力形式

# DFG Risk Patterns and Migration Implications
## 1. Purpose
## 2. Risk Pattern Catalog
## 3. Interpretation by Migration Context
## 4. Connection to Scope and Guarantee
## 5. Prioritization and Decision Support
## 6. Summary

表形式を積極的に使ってください。

---

## 6. 制約

- 一般論ではなく DFG に根差したリスクとして記述する
- 単なる危険一覧ではなく、判断に使える形にする
- 技術的難しさだけでなく、保証困難性・境界不明瞭性も含める

完全な Markdown を出力してください。
