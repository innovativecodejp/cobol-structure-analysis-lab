# Phase10 / 40_dfg
## 06_DFG-Boundary-and-Scope-Model

あなたは「COBOL構造解析研究室」の研究補助AIです。  
本タスクの目的は、DFG における **境界・スコープ・閉包単位** を定義することです。

---

## 1. 背景

データ依存はしばしば文や段落を越えて伝播します。  
そのため、どこまでを1つの DFG とみなすか、  
どこで境界を切るか、  
どこまで追跡すれば「影響範囲が閉じた」と判断できるか、  
を定義する必要があります。

---

## 2. 作成対象

以下を整理してください。

1. DFG の境界候補
2. 文スコープ / 段落スコープ / 手続きスコープ / プログラムスコープ
3. ファイルI/O 境界
4. 外部呼出し・COPY・共有領域の境界
5. Scope モデルとの対応
6. 境界横断時の保証困難性
7. 閉包判定の考え方

---

## 3. 必須論点

### 3.1 境界候補
- Statement boundary
- Paragraph boundary
- Section boundary
- Procedure Division boundary
- Program boundary
- External interface boundary
- File boundary

### 3.2 Scope との接続
以下を必ず含めてください。

- Scope を DFG からどう支えるか
- Scope 閉包条件にデータ依存をどう使うか
- Scope 不足をどう検知するか
- Guarantee Unit とのサイズ不一致が起きる場合の考え方

### 3.3 境界横断の高リスク要素
- ファイルレコード経由
- グローバル相当領域
- 再定義が頻繁な項目
- CALL 越しデータ受け渡し
- コピー句依存の構造共有

---

## 4. 出力形式

# DFG Boundary and Scope Model
## 1. Purpose
## 2. Boundary Candidates
## 3. Scope Levels
## 4. Boundary Crossing Relations
## 5. Closure Conditions
## 6. Connection to Guarantee and Migration Units
## 7. Risk Interpretation
## 8. Summary

必要に応じて表を使ってください。

---

## 5. 制約

- 実装単位の都合ではなく、構造的必然性から境界を論じる
- Scope フェーズとの重複ではなく、DFG 側から見た支援モデルとして書く
- 変更影響分析に使える形で記述する

完全な Markdown を出力してください。
