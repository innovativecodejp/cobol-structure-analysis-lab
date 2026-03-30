# Phase10｜40_dfg 実行用 INDEX

## 文書情報
- フェーズ名: **Phase10**
- 対象領域: **40_dfg**
- 管理文書: **INDEX.md**
- 上位参照文書: **40_Dfg_Roadmap.md**

---

## 1. この INDEX の目的

本書は、Phase10 の 10 本の実行ファイルを **そのまま順番に運用するための実行管理文書** である。  
各ファイルについて、以下を一体で管理する。

- 実行順
- 目的
- 主な論点
- 完了条件
- 次ファイルへの受け渡し
- 実行後の Git commit 指示

本 Phase の理論的位置づけ、到達目標、各文書の研究上の役割は、必ず **`40_Dfg_Roadmap.md` を参照** して確認すること。  
本 INDEX は運用管理のための文書であり、理論の上位説明は Roadmap を基準とする。

---

## 2. 実行時の基本運用ルール

### 2.1 上位参照
各ファイルの実行前に、以下を参照すること。

- `40_Dfg_Roadmap.md`
- 既存フェーズ成果物
  - `10_ast`
  - `20_ir`
  - `30_cfg`
  - `50_guarantee`
  - `60_scope`
  - `70_cases`

### 2.2 実行対象
本 Phase の対象ファイルは以下の 10 本である。

1. `01_DFG-Core-Definition.md`
2. `02_DFG-Node-and-Edge-Taxonomy.md`
3. `03_Define-Use-and-Reaching-Definition-Model.md`
4. `04_Statement-Level-DataFlow-Rules.md`
5. `05_DFG-vs-CFG-Integration.md`
6. `06_DFG-Boundary-and-Scope-Model.md`
7. `07_Impact-Propagation-and-Closure-on-DFG.md`
8. `08_DFG-Verification-Model.md`
9. `09_DFG-Risk-Patterns-and-Migration-Implications.md`
10. `10_DFG-Connection-to-AST-IR-CFG-Guarantee-Scope-Cases.md`

### 2.3 commit ルール
**各実行処理で、ファイルが生成または更新された場合は、その都度 commit すること。**  
まとめて最後に commit するのではなく、**各実行単位ごとに commit** する。

推奨運用:

- 1ファイル実行
- 成果物確認
- 必要なら関連文書更新
- 差分確認
- commit

### 2.4 ログ作成ルール
Phase10 の 10 本の実行をすべて終了した後、以下を実施すること。

1. **research-log を作成し commit**
2. **working-log を作成し commit**

### 2.5 記述レベル
各ファイルは必ず以下の 3 層を意識して記述すること。

- **構文層**: COBOL 構文・要素・記法の整理
- **構造層**: DFG としての依存構造の定義
- **判断層**: 移行可否判断・変更影響分析・保証評価への接続

### 2.6 実装分離
本 Phase は研究・抽象モデル定義が目的である。  
実装コード、具体的アルゴリズム実装、最適化手法の詳細に寄りすぎないこと。  
常に **「構造が移行リスクにどう影響するか」** を判断材料として記述する。

---

## 3. 実行順一覧

| No. | ファイル名 | 主目的 | 完了条件の要点 |
|---|---|---|---|
| 01 | `01_DFG-Core-Definition.md` | DFG の中核定義固定 | DFG の目的・対象・抽象レベルが一義化されている |
| 02 | `02_DFG-Node-and-Edge-Taxonomy.md` | ノード/エッジ分類の体系化 | 主要分類と粒度基準が整理されている |
| 03 | `03_Define-Use-and-Reaching-Definition-Model.md` | define/use/reach の定義 | define/use/kill/reach の判断規則が明文化されている |
| 04 | `04_Statement-Level-DataFlow-Rules.md` | 文単位規則の整理 | 主要 COBOL 文の依存生成規則が整理されている |
| 05 | `05_DFG-vs-CFG-Integration.md` | CFG と DFG の接続 | 制御依存を伴う伝播・合流の説明がある |
| 06 | `06_DFG-Boundary-and-Scope-Model.md` | データ境界とスコープ接続 | 項目階層・REDEFINES・外部境界の扱いが整理されている |
| 07 | `07_Impact-Propagation-and-Closure-on-DFG.md` | 影響伝播・閉包 | 変更起点からの依存閉包が定義されている |
| 08 | `08_DFG-Verification-Model.md` | 検証モデル | DFG 妥当性の検証観点が一覧化されている |
| 09 | `09_DFG-Risk-Patterns-and-Migration-Implications.md` | リスク構造化 | 依存構造が移行困難性へ与える影響が整理されている |
| 10 | `10_DFG-Connection-to-AST-IR-CFG-Guarantee-Scope-Cases.md` | 全体統合 | 既存理論との接続が明文化されている |

---

## 4. 各ファイルの実行ガイド

---

### 01_DFG-Core-Definition.md

#### 目的
Phase10 全体の基礎として、DFG の定義を本研究文脈で固定する。  
一般的なコンパイラ理論の DFG との差異も明示し、**移行判断用 DFG** の立場を確立する。

#### 重点観点
- DFG の研究目的
- 値・依存・伝播・観測の定義
- AST / IR / CFG との差異
- 静的依存と判断用依存の違い
- 本 Phase で採用する抽象レベル

#### 完了条件
- DFG の定義文が一義的である
- AST / CFG / IR と混同しない
- 以降の 02〜10 で使う基本用語が固定されている

#### 次への受け渡し
- 02 のノード／エッジ分類の前提語彙を供給する
- 03 の define/use 定義の概念基盤になる

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

### 02_DFG-Node-and-Edge-Taxonomy.md

#### 目的
DFG を構成するノードとエッジを体系化し、以後の文書で用いる構成単位を固定する。

#### 重点観点
- Data Item / Value Instance / Operation / External Source / External Sink
- Define / Use / Derive / Copy / Conditional / Aggregate / Kill
- 粒度選択基準
- 曖昧境界の整理

#### 完了条件
- ノード分類表がある
- エッジ分類表がある
- 粒度を選ぶ判断基準がある
- 境界曖昧性が説明されている

#### 次への受け渡し
- 03 で define/use/reach を記述する単位を提供する
- 04 で文ごとの依存生成規則を記述するための語彙になる

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

### 03_Define-Use-and-Reaching-Definition-Model.md

#### 目的
define / use / kill / reach などの基礎概念を、COBOL と本研究の抽象レベルに合わせて定義する。

#### 重点観点
- define / use の形式定義
- 上書きと残存値
- グループ項目と下位項目の衝突
- READ / ACCEPT / MOVE / COMPUTE 等における定義発生
- 条件式中の use 判定
- 到達定義の扱い

#### 完了条件
- define / use / kill / reach の判断規則が明文化されている
- COBOL 固有の曖昧点に対する方針がある
- 04 の transfer rule を支える土台になっている

#### 次への受け渡し
- 04 の文単位データフロー規則の形式基盤となる
- 05 の制御敏感伝播の前提になる

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

### 04_Statement-Level-DataFlow-Rules.md

#### 目的
主要 COBOL 文ごとに、どの依存が生成されるかを整理し、文単位の DFG 生成規則を定義する。

#### 重点観点
- MOVE
- COMPUTE
- ADD / SUBTRACT / MULTIPLY / DIVIDE
- INITIALIZE
- STRING / UNSTRING
- INSPECT
- READ / WRITE / REWRITE / ACCEPT / DISPLAY
- SET / SEARCH / EVALUATE 内の参照

#### 完了条件
- 主要 COBOL 文の依存生成規則が一覧化されている
- 定義元・利用元・更新先・副作用が明示されている
- AST/IR の実装詳細に依存しない抽象規則になっている

#### 次への受け渡し
- 05 で CFG 上の伝播へ接続する具体的依存源になる
- 07, 08, 09 の分析対象を供給する

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

### 05_DFG-vs-CFG-Integration.md

#### 目的
DFG と CFG の関係を整理し、条件分岐・反復・特殊遷移を伴う依存成立条件を定義する。

#### 重点観点
- IF / EVALUATE における条件依存
- PERFORM / PERFORM UNTIL / PERFORM VARYING
- GO TO / EXIT / NEXT SENTENCE
- 合流点での依存統合
- 可能依存と必須依存
- 制御条件により限定される依存

#### 完了条件
- CFG と DFG の対応関係が説明されている
- 条件依存を無視した単純 DFG との差が示されている
- 移行リスクに効く制御敏感依存が明示されている

#### 次への受け渡し
- 07 の段落レベル・手続き間依存へ拡張する基盤となる
- 08 の影響伝播条件の基礎になる

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

### 06_DFG-Boundary-and-Scope-Model.md

#### 目的
COBOL データ構造の境界を DFG 上でどう扱うかを整理し、スコープ・外部境界との関係を定義する。

#### 重点観点
- WORKING-STORAGE / LOCAL-STORAGE
- LINKAGE / USING
- FILE SECTION
- グループ項目と従属項目
- REDEFINES
- OCCURS
- COPY 句由来項目
- 物理配置と論理境界の差

#### 完了条件
- データ構造境界が DFG 粒度へどう写像されるか整理されている
- 外部境界と内部境界の区別がある
- 境界曖昧性が移行リスクにつながる説明がある

#### 次への受け渡し
- 07 の段落／CALL 境界の依存整理につながる
- 08 の Scope 閉包の前提になる

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

### 07_Impact-Propagation-and-Closure-on-DFG.md

#### 目的
DFG 上での影響伝播、依存閉包、逆依存閉包を定義し、変更影響分析の骨格を作る。

#### 重点観点
- 起点変更からの影響伝播
- 依存閉包
- 逆依存閉包
- 出力到達性
- 観測可能影響と内部影響
- Scope との接続
- 閉包サイズと困難性

#### 完了条件
- 変更影響追跡の単位が定義されている
- 閉包の考え方が整理されている
- Scope の閉包概念へ接続している

#### 次への受け渡し
- 08 の検証モデルに検査対象を供給する
- 09 のリスク評価で使う依存構造を供給する

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

### 08_DFG-Verification-Model.md

#### 目的
定義した DFG モデルが妥当であるかを確認するための検証観点と整合性条件を整理する。

#### 重点観点
- 構造整合性条件
- AST / IR / CFG との整合性
- 欠落依存・過剰依存
- ケースベース検証
- 保証単位との矛盾検出
- 簡略化による情報損失

#### 完了条件
- DFG 妥当性の検証観点が一覧化されている
- 確認チェックポイントがある
- 今後のケース検証へ転用可能な形式になっている

#### 次への受け渡し
- 09 のリスク構造整理で、どの依存を信頼して扱えるかの基準になる
- 10 の全体統合で整合性根拠になる

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

### 09_DFG-Risk-Patterns-and-Migration-Implications.md

#### 目的
DFG 上の依存構造が、移行困難性・変更影響・保証独立性にどう影響するかを整理する。

#### 重点観点
- 高密度依存
- 条件依存の多層化
- REDEFINES を伴う意味衝突
- 外部境界依存
- 集約依存・分解依存
- 広域影響閉包
- 検証困難な依存パターン

#### 完了条件
- 危険な依存パターンが列挙されている
- それぞれが移行リスクへどう効くか説明されている
- 判断材料として読める構成になっている

#### 次への受け渡し
- 10 の全体接続で、DFG が判断理論へどう使われるかを示す材料になる

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

### 10_DFG-Connection-to-AST-IR-CFG-Guarantee-Scope-Cases.md

#### 目的
DFG を既存研究成果へ接続し、全体理論の中での位置づけを完結させる。

#### 重点観点
- AST から DFG を構成するための必要情報
- IR を介した DFG 生成可能性
- CFG との双方向関係
- Guarantee Unit と依存独立性
- Scope と依存閉包
- Cases における検証観点
- 今後の判断モデルへの接続

#### 完了条件
- 既存フェーズとの接続が明文化されている
- DFG が孤立理論でないことが示されている
- 今後の変更影響分析・移行判断理論へ橋渡しできている

#### 次への受け渡し
- Phase10 全体の統合作業完了
- 研究ログ・作業ログの作成へ進む

#### 実行後処理
- 生成・更新ファイルを確認する
- 差分を確認する
- **commit する**

---

## 5. 10 本完了後の必須処理

Phase10 の 01〜10 をすべて完了したら、以下を必ず実施すること。

### 5.1 research-log を作成し commit
研究成果の要約として、少なくとも以下を含めること。

- Phase10 の研究目的
- DFG として新たに定義した中心概念
- 既存フェーズとの接続点
- 重要な判断材料
- 今後の研究課題

**research-log を作成後、commit すること。**

### 5.2 working-log を作成し commit
実務的な実行記録として、少なくとも以下を含めること。

- 実行した 10 ファイル
- 各回で生成・更新したファイル
- 迷った論点
- 修正した点
- 次 Phase への注意事項

**working-log を作成後、commit すること。**

---

## 6. 推奨 commit 運用

commit メッセージは、内容が追跡できるように明示的にすること。  
以下は推奨例である。

- `phase10: add 01 DFG core definition`
- `phase10: add 02 DFG node and edge taxonomy`
- `phase10: add 03 define use and reaching definition model`
- `phase10: add 04 statement level data flow rules`
- `phase10: add 05 DFG vs CFG integration`
- `phase10: add 06 DFG boundary and scope model`
- `phase10: add 07 impact propagation and closure on DFG`
- `phase10: add 08 DFG verification model`
- `phase10: add 09 DFG risk patterns and migration implications`
- `phase10: add 10 DFG connection to existing theories`
- `phase10: add research log for 40_dfg`
- `phase10: add working log for 40_dfg`

---

## 7. 最終確認チェックリスト

Phase10 完了時に、以下を確認すること。

- [ ] `40_Dfg_Roadmap.md` を上位参照として整合している
- [ ] 01〜10 の各ファイルが生成または更新されている
- [ ] 各実行単位ごとに commit している
- [ ] DFG の定義・分類・規則・伝播・境界・閉包・検証・リスク・統合がそろっている
- [ ] AST / IR / CFG / Guarantee / Scope / Cases との接続が説明されている
- [ ] research-log を作成した
- [ ] research-log を commit した
- [ ] working-log を作成した
- [ ] working-log を commit した

---

## 8. 終了条件

Phase10 は、単に 10 本の文書を作成しただけでは完了としない。  
以下をすべて満たしたときに完了とみなす。

1. 01〜10 の文書が相互整合している
2. `40_Dfg_Roadmap.md` に対して位置づけの不整合がない
3. 各実行単位ごとに commit が存在する
4. research-log が作成・commit されている
5. working-log が作成・commit されている
6. DFG が今後の変更影響分析・移行判断理論へ接続可能な状態になっている

