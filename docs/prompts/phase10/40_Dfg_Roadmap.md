# Phase10｜40_DFG Roadmap

## 文書情報
- フェーズ名: **Phase10**
- 対象領域: **40_dfg**
- 文書名: **40_Dfg_Roadmap.md**
- 位置づけ:  
  本フェーズは、`10_ast`・`20_ir`・`30_cfg`・`50_guarantee`・`60_scope`・`70_cases` で整備してきた構造理論を受け、  
  **COBOL資産におけるデータ依存構造を、移行判断可能な抽象モデルとして定義する段階**である。

---

# 1. Phase10 の目的

`40_dfg` の目的は、COBOLプログラム内に存在する **値の生成・伝播・参照・上書き・集約・分岐横断利用** を、  
単なる変数参照一覧ではなく、**構造としての Data Flow Graph（DFG）** として定義することにある。

本研究で扱う DFG は、一般的なコンパイラ理論のデータフロー解析をそのまま導入するものではなく、  
**移行可否判断・変更影響分析・保証範囲評価** に耐えるための抽象化モデルとして設計する。

このため、Phase10 では次を明確にする。

- DFG の最小単位
- 値の定義（define）と利用（use）の構造
- MOVE / COMPUTE / INITIALIZE / STRING / UNSTRING / INSPECT などにおけるデータ生成規則
- 条件分岐・ループ・段落呼出しを横断する依存伝播
- COPY句・WORKING-STORAGE・LINKAGE・FILE 項目を含むデータ源泉の整理
- AST / IR / CFG / Guarantee / Scope との接続
- DFG を判断材料へ変換するための抽象指標

---

# 2. Phase10 の到達目標

Phase10 の完了時には、少なくとも以下を満たすことを到達目標とする。

## 2.1 構造層の到達目標
- DFG のノード種別・エッジ種別・境界概念が定義されている
- COBOL 特有のデータ更新構文に対する依存生成規則が定義されている
- CFG と DFG の関係が整理されている
- 文・段落・節・プログラム境界をまたぐ依存関係が抽象化されている

## 2.2 判断層の到達目標
- どの依存が移行困難性を増加させるかが説明可能である
- どの依存が変更影響を拡大するかが説明可能である
- どの依存が保証単位の独立性を弱めるかが説明可能である
- Scope と DFG を接続し、影響閉包の定義候補が示されている

## 2.3 研究成果物としての到達目標
- `40_dfg/` 配下の 01〜10 文書が相互整合している
- 各文書が「構文層／構造層／判断層」のどこを担うか明示されている
- 以後の変更影響分析・移行難易度評価・保証充足判定へ接続できる

---

# 3. Phase10 の基本視点

本フェーズでは、以下の視点を維持する。

## 3.1 構文ではなく依存構造を見る
DFG は「どの文が何をしているか」ではなく、  
**どの値が、どの値に依存し、どこへ伝播し、どこで観測されるか** を扱う。

## 3.2 制御構造と分離しすぎない
DFG は CFG と独立ではない。  
分岐・反復・段落遷移がある以上、データ依存は制御条件により有効域が変化する。  
したがって DFG は CFG から完全分離された静的グラフではなく、  
**CFG 上で成立する依存関係の抽象射影** として扱う。

## 3.3 移行判断に必要な単位で抽象化する
研究目的は最適化コンパイラの実装ではない。  
目的は、**移行時に危険な依存・分離可能な依存・閉包が必要な依存** を見極めることにある。  
そのため、細かすぎる SSA 的分解を無条件に採用せず、  
**判断に効く粒度** を優先する。

## 3.4 データ項目の意味境界を重視する
COBOL のデータは、単純変数ではなく以下の特徴を持つ。

- 階層項目
- REDEFINES
- OCCURS
- グループ項目と従属項目
- FILE レコード
- LINKAGE / USING
- COPY 由来項目
- 初期値と実行時更新の混在

したがって DFG は、名前単位ではなく **意味境界を持つデータ要素** を単位に定義する必要がある。

---

# 4. Phase10 の成果物構成

Phase10 は、以下の 10 文書で構成する。

1. `01_DFG-Core-Definition.md`
2. `02_DFG-Node-and-Edge-Taxonomy.md`
3. `03_DFG-Definition-and-Use-Model.md`
4. `04_DFG-Statement-Level-Transfer-Rules.md`
5. `05_DFG-Control-Sensitive-Propagation.md`
6. `06_DFG-Data-Structure-Boundary.md`
7. `07_DFG-Interprocedural-and-Paragraph-Level-Flow.md`
8. `08_DFG-Impact-and-Dependency-Closure.md`
9. `09_DFG-Verification-and-Consistency.md`
10. `10_DFG-Mapping-to-AST-IR-CFG-Guarantee-Scope.md`

---

# 5. 各文書の役割と完成条件

## 01_DFG-Core-Definition.md
### 目的
DFG とは何かを、本研究プロジェクトの文脈で定義する。  
特に、コンパイラ理論上の一般的 DFG との差異を明示し、  
**移行判断用 DFG** の定義を固定する。

### 主題
- DFG の研究目的
- 値・依存・伝播・観測の定義
- DFG の対象範囲
- 静的依存と判断用依存の違い
- Phase10 全体で採用する抽象レベル

### 完成条件
- DFG の定義文が一義的である
- AST / CFG と混同しない位置づけが明記されている
- 以後の文書で参照する基本用語が固定されている

---

## 02_DFG-Node-and-Edge-Taxonomy.md
### 目的
DFG を構成するノードとエッジの種類を体系化する。

### 主題
- ノード種別
  - Data Item Node
  - Value Instance Node
  - Operation Node
  - External Source Node
  - External Sink Node
  - Aggregate Node
- エッジ種別
  - Define Edge
  - Use Edge
  - Derive Edge
  - Copy Edge
  - Conditional Flow Edge
  - Overwrite / Kill Relation
  - Aggregate Dependency
- 粒度の選択基準

### 完成条件
- ノード／エッジの分類表がある
- 代表例が示されている
- 分析時に曖昧になりやすい境界が整理されている

---

## 03_DFG-Definition-and-Use-Model.md
### 目的
define / use / kill / reach / live といった基礎概念を、  
本研究の DFG 抽象に合わせて再定義する。

### 主題
- Define と Use の形式定義
- 上書きと残存値
- グループ項目と下位項目の定義衝突
- READ / ACCEPT / MOVE / COMPUTE 等による定義発生
- 条件式中の参照を Use とみなす基準
- 実行可能性と依存成立条件の関係

### 完成条件
- define/use の判断規則が文として記述されている
- COBOL 特有の曖昧さに対する方針が明記されている
- 04 以降の transfer rule を支える形式定義になっている

---

## 04_DFG-Statement-Level-Transfer-Rules.md
### 目的
主要 COBOL 文ごとに、どのような DFG 依存が生成されるかを定義する。

### 主題
- MOVE
- COMPUTE
- ADD / SUBTRACT / MULTIPLY / DIVIDE
- INITIALIZE
- STRING / UNSTRING
- INSPECT
- READ / WRITE / REWRITE / ACCEPT / DISPLAY
- SET / SEARCH / EVALUATE 内式参照
- 代入対象・参照元・副作用の定義

### 完成条件
- 文単位の依存生成ルール一覧がある
- 少なくとも主要な COBOL 文に対して抽象規則が示されている
- AST/IR 実装に依存しない記述になっている

---

## 05_DFG-Control-Sensitive-Propagation.md
### 目的
CFG と関係づけながら、条件分岐・反復・早期脱出などにより  
依存がどのように到達・分岐・合流するかを定義する。

### 主題
- IF / EVALUATE における分岐依存
- PERFORM / PERFORM UNTIL / PERFORM VARYING の反復依存
- GO TO / EXIT / NEXT SENTENCE 等の特殊遷移
- 合流点での依存統合
- 可能依存 / 必須依存 の区別
- 制御条件により有効域が限定される依存

### 完成条件
- CFG と DFG の対応関係が説明されている
- 条件依存を無視した単純 DFG との差が示されている
- 移行リスクの観点から重要な依存型が明示されている

---

## 06_DFG-Data-Structure-Boundary.md
### 目的
COBOL のデータ定義構造が DFG に与える影響を整理する。

### 主題
- WORKING-STORAGE と LOCAL-STORAGE
- LINKAGE / USING の外部入力依存
- FILE SECTION レコード
- グループ項目と従属項目
- REDEFINES
- OCCURS
- COPY 句由来項目
- 物理配置と論理項目境界の差

### 完成条件
- データ定義側の境界が DFG にどう影響するか整理されている
- 項目階層をどう DFG 粒度へ写像するか方針が示されている
- 境界曖昧性が移行リスクにどうつながるか説明されている

---

## 07_DFG-Interprocedural-and-Paragraph-Level-Flow.md
### 目的
段落・節・CALL・USING など、文単位を超える依存伝播を扱う。

### 主題
- 段落間依存
- PERFORM THRU による範囲依存
- CALL / USING / RETURNING
- サブプログラム境界
- グローバルデータと局所データ
- インターフェース依存
- 依存の要約表現（summary relation）

### 完成条件
- 文内 DFG から段落／プログラム間 DFG への拡張方針が示されている
- CALL 境界をまたぐ依存の抽象モデルがある
- 変更影響分析に必要な依存要約が定義されている

---

## 08_DFG-Impact-and-Dependency-Closure.md
### 目的
DFG を変更影響分析およびスコープ閉包へ接続する。

### 主題
- 起点項目変更時の影響伝播
- 依存閉包
- 逆依存閉包
- 出力到達性
- 観測可能な影響と内部影響
- Scope との接続
- 閉包の大きさと移行困難性

### 完成条件
- 変更影響の追跡単位が定義されている
- Scope の閉包概念との接続がある
- 判断材料として使える依存指標が整理されている

---

## 09_DFG-Verification-and-Consistency.md
### 目的
定義した DFG モデルが妥当かを検証する基準を整備する。

### 主題
- 構造整合性条件
- AST / IR / CFG との整合性
- 欠落依存・過剰依存の判定
- ケースベース検証
- 保証単位との矛盾検出
- モデル簡略化時の情報損失

### 完成条件
- DFG 妥当性の検査観点が一覧化されている
- ケース適用時の確認項目がある
- 今後の検証運用に転用できる形式になっている

---

## 10_DFG-Mapping-to-AST-IR-CFG-Guarantee-Scope.md
### 目的
DFG を、既存の各研究成果へ接続し、全体理論の中で位置づける。

### 主題
- AST から DFG を構成するための必要情報
- IR を介した DFG 生成可能性
- CFG との双方向関係
- Guarantee Unit と依存独立性
- Scope と依存閉包
- Cases における検証観点
- 今後の判断モデルへの接続

### 完成条件
- 既存フェーズとの関係図が言語化されている
- DFG が孤立理論ではないことが明確である
- 変更影響分析・移行判断理論への橋渡しができている

---

# 6. 実行順序

Phase10 の推奨実行順は以下の通り。

1. 01_DFG-Core-Definition  
2. 02_DFG-Node-and-Edge-Taxonomy  
3. 03_DFG-Definition-and-Use-Model  
4. 04_DFG-Statement-Level-Transfer-Rules  
5. 05_DFG-Control-Sensitive-Propagation  
6. 06_DFG-Data-Structure-Boundary  
7. 07_DFG-Interprocedural-and-Paragraph-Level-Flow  
8. 08_DFG-Impact-and-Dependency-Closure  
9. 09_DFG-Verification-and-Consistency  
10. 10_DFG-Mapping-to-AST-IR-CFG-Guarantee-Scope  

この順序は、以下の依存関係を前提とする。

- 01 は全体定義
- 02 は構成要素の固定
- 03 は define/use の基礎概念
- 04 は文単位ルール
- 05 は CFG 接続
- 06 は COBOL データ構造境界
- 07 は段落／CALL 境界拡張
- 08 は変更影響・閉包
- 09 は妥当性確認
- 10 は全研究への統合

---

# 7. 他フェーズとの接続

## 7.1 10_ast との接続
AST は DFG の直接表現ではないが、  
DFG を構成するための **構文的根拠の供給源** となる。

特に以下が重要である。

- 参照式の抽出
- 代入対象の抽出
- 条件式中の利用抽出
- グループ項目／要素項目の識別
- 文境界・段落境界の保持

## 7.2 20_ir との接続
IR は DFG 生成のための **中間意味層** として機能する。  
特に、MOVE / COMPUTE / STRING / UNSTRING / INSPECT 等を  
統一的な操作表現へ正規化できるなら、DFG 規則は IR 上で定義しやすくなる。

## 7.3 30_cfg との接続
CFG は DFG の依存成立条件を支える。  
どの define がどの use に到達可能か、  
どの経路でのみ依存が有効かは CFG なしに説明できない。

## 7.4 50_guarantee との接続
Guarantee Unit の独立性は、  
外部依存・共有依存・観測依存の強さに影響される。  
DFG は、保証単位がどの程度独立しているかを示す構造根拠となる。

## 7.5 60_scope との接続
Scope は作業・検証・変更の境界であり、  
DFG はその境界を越えて波及する依存を可視化する。  
したがって Scope の閉包定義には DFG が必要となる。

## 7.6 70_cases との接続
Cases は DFG モデルの妥当性を検証する現実接点である。  
特に以下のようなケースが有効である。

- 1項目の変更が複数出力へ波及するケース
- REDEFINES により意味境界が曖昧なケース
- PERFORM VARYING による反復更新ケース
- STRING / UNSTRING で複数項目へ分解されるケース
- FILE I/O を境界とした依存ケース

---

# 8. Phase10 で重点的に扱う構造的論点

## 8.1 単純代入ではないデータ更新
COBOL の更新は単純代入に還元できない場合が多い。  
たとえば STRING / UNSTRING / INSPECT / INITIALIZE は、  
複数項目・部分項目・条件依存を伴うため、  
DFG の依存モデルを豊かにする必要がある。

## 8.2 グループ項目と部分依存
グループ項目の MOVE は、下位項目全体への一括更新とみなせる一方、  
論理上は部分項目ごとの意味依存を保持したい場合もある。  
この二重性をどう抽象化するかは重要論点である。

## 8.3 REDEFINES の意味衝突
REDEFINES は同一記憶領域に複数意味を与える。  
これは DFG 上で「同じ場所の別名」以上の問題であり、  
**意味境界の競合** として扱う必要がある。

## 8.4 条件付き依存
ある依存が常に成立するのか、ある条件下でのみ成立するのかは、  
移行・テスト・保証の難しさに直結する。  
よって DFG には無条件依存と条件付き依存の区別が必要になる。

## 8.5 外部I/O境界
READ / WRITE / CALL / USING は、  
プログラム外との依存境界を形成する。  
ここを明示しない DFG は、影響分析や保証単位分解に使いにくい。

---

# 9. Phase10 の研究上の判断材料

Phase10 を通して、次のような判断材料を生成できることが望ましい。

- 変更起点からどの出力まで影響が届くか
- あるデータ項目がどれだけ多くの処理経路に関与するか
- 共有依存の強い項目がどこか
- 局所化しやすい依存と分離困難な依存の違い
- 検証対象の閉包範囲をどこまで取るべきか
- 保証単位を切り出したときに残る外部依存は何か

これらは、最終的に以下へ接続される。

- 移行優先順位
- 変更影響見積もり
- テスト範囲見積もり
- 分割移行可否
- ラップ移行／再実装／段階移行の判断補助

---

# 10. 推奨アウトプット形式

各文書は原則として以下の構成を推奨する。

1. 目的
2. 研究上の位置づけ
3. 問題設定
4. 定義
5. 構造モデル
6. 判断層への接続
7. 例示
8. 未解決論点
9. 次文書への接続

図が必要な場合は Mermaid を併用する。  
特に以下の図が有効である。

- データ依存の基本図
- define/use/kill の関係図
- CFG と DFG の重ね合わせ図
- 項目階層と依存粒度の対応図
- 変更起点からの影響閉包図

---

# 11. Phase10 完了判定

Phase10 は、以下を満たした時点で完了とみなす。

## 必須条件
- 01〜10 の文書が揃っている
- DFG の中心定義が一貫している
- define/use/kill/propagation の概念が整合している
- CFG・Scope・Guarantee との接続が明示されている
- COBOL 特有のデータ構造論点が無視されていない

## 望ましい条件
- Cases へ適用するための検証観点が定義されている
- 依存閉包から変更影響分析へ直接つながる
- 将来の Difficulty / Risk / Migration Decision モデルへ拡張可能である

---

# 12. このフェーズで得られる研究上の意味

DFG フェーズの意義は、  
「何が実行されるか」ではなく **「何が何に依存しているか」** を  
移行判断可能な形で言語化する点にある。

AST が構文の骨格、IR が意味操作の正規化、CFG が実行経路の骨格であるなら、  
DFG は **値の依存構造の骨格** である。

移行困難性は、多くの場合、以下に現れる。

- 値の起源が追いにくい
- 更新が局所化されていない
- 複数の意味が同一領域に重なっている
- 条件や反復により影響範囲が不透明である
- 出力や外部I/Oまでの依存経路が長く複雑である

したがって DFG は、単独の解析理論ではなく、  
**移行リスクを構造的に説明するための中核レイヤ** である。

---

# 13. 次アクション

Phase10 の実行開始時は、以下の順で進める。

1. `01_DFG-Core-Definition.md` を作成し、DFG の中心定義を固定する  
2. `02_DFG-Node-and-Edge-Taxonomy.md` で要素分類を固める  
3. `03_DFG-Definition-and-Use-Model.md` で基礎関係を定義する  
4. `04`〜`07` で COBOL 構造への適用規則を拡張する  
5. `08`〜`10` で影響分析・検証・全体接続を完成させる  

---

# 14. まとめ

Phase10 `40_dfg` は、  
COBOL 構造解析研究において、値の依存構造を明示し、  
その依存が **保証単位の独立性・スコープ閉包・変更影響・移行可否判断** に  
どう関与するかを示すためのフェーズである。

本フェーズにより、研究全体は次のように接続される。

- AST: 構文骨格
- IR: 意味操作骨格
- CFG: 実行経路骨格
- DFG: 値依存骨格
- Guarantee: 保証骨格
- Scope: 境界骨格
- Cases: 妥当性検証骨格

この意味で DFG は、  
**「値の流れ」を記述するだけの技術要素ではなく、移行判断を成立させる構造理論の中核** である。
