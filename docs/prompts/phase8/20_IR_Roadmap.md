# Phase8｜20_ir ロードマップ
作成日: 2026-03-29

---

## 1. 位置づけ

Phase8 では、`20_ir` を研究対象とし、COBOL 構造解析研究における **IR（Intermediate Representation：中間表現）** の定義を確立する。  
ここで扱う IR は、単なる変換中間コードではなく、**AST で抽出した構文構造を、制御・データ・保証・判断へ接続可能な構造表現へ昇格させる抽象層** として定義する。

本研究空間における IR は、次の橋渡しを担う。

- AST 層で観測された構文ノードを、解析可能な意味単位へ整理する
- CFG / DFG 構築の前提となる制御作用・データ作用を表現する
- Guarantee / Scope / Decision と接続可能な「判断可能な構造単位」を提供する
- 移行可否判断に必要な「構造的根拠」の中間媒体となる

したがって `20_ir` は、構文木の次に置かれる実装都合の層ではなく、**移行判断のための構造抽象層** である。

---

## 2. Phase8 の研究目的

### 主目的
COBOL 資産を対象として、移行判断に耐える IR の抽象モデルを定義する。

### 副目的
- AST から IR への射影規則を定義する
- IR を CFG / DFG / Guarantee / Scope / Decision に接続可能な形式へ整える
- COBOL 特有の構造（PERFORM, EVALUATE, MOVE, READ, WRITE, CALL など）を、分析単位として統一的に扱えるようにする
- 変換実装依存ではない IR の理論的独立性を確保する
- 将来の「構造差分」「影響分析」「移行単位分割」に利用できる基盤を整える

---

## 3. 抽象度の明示

Phase8 では、IR を次の 3 層で扱う。

### 構文層
- COBOL ソースの文法構成
- AST ノードとしての文・句・節の表現
- 字句・構文由来の構造

### 構造層
- 実行意味を持つ単位への再編成
- 制御作用、データ作用、境界作用、副作用の抽出
- 依存関係分析のための抽象化

### 判断層
- どの IR 単位が保証対象か
- どの IR 単位が移行リスクを持つか
- どの IR 単位が Scope / Guarantee / Decision の基準点になるか

Phase8 の中心は **構造層の定義** にある。  
ただし、判断層への接続可能性を常に確保した設計とする。

---

## 4. Phase8 完了時の到達目標

Phase8 完了時には、最低限次を満たすことを目標とする。

1. IR の定義目的が明文化されている
2. IR の構成単位（命令単位・制御単位・境界単位・データ単位など）が分類されている
3. AST → IR の写像規則が整理されている
4. IR → CFG / DFG の接続方針が定義されている
5. IR → Guarantee / Scope / Decision の接続可能性が記述されている
6. COBOL 特有構文に対する IR 変換方針が列挙されている
7. IR の完全性・閉包性・粒度方針が定義されている
8. 次フェーズ（CFG / DFG / 影響分析）へ進める基盤文書が整っている

---

## 5. Phase8 の中核問い

Phase8 では、次の問いに答える形で文書を構成する。

- IR は AST と何が違うのか
- IR は何を失い、何を得るのか
- IR の最小単位は何か
- IR の単位は「命令」か「作用」か「判断可能構造」か
- COBOL の paragraph / section / statement / clause をどの粒度で IR に写すべきか
- PERFORM や EVALUATE は、IR ではどのような制御抽象として表すべきか
- MOVE / COMPUTE / READ / WRITE / CALL は、IR 上でどのような作用単位とみなすべきか
- IR は CFG / DFG の前段としてどこまで情報を保持すべきか
- Guarantee / Scope / Decision から見て、IR はどのような保証単位・判断単位になるべきか

---

## 6. 推奨ディレクトリ構成

`cobol-structure-analysis-lab` における `20_ir` 配下の想定構成は次のとおり。

```text
docs/
  20_ir/
    01_IR-Core-Definition.md
    02_IR-Design-Principles.md
    03_IR-Unit-Taxonomy.md
    04_AST-to-IR-Mapping.md
    05_IR-Control-Abstraction.md
    06_IR-Data-Operation-Model.md
    07_IR-Boundary-and-SideEffect-Model.md
    08_IR-Composition-and-Normalization.md
    09_IR-Connection-to-CFG-DFG.md
    10_IR-Connection-to-Guarantee-Scope-Decision.md
```

ログ類は次を想定する。

```text
log/
  research-log/
    2026-03-29_Phase8_20_IR_Roadmap.md
```

---

## 7. 文書一覧と役割

Phase8 は、次の 10 文書で構成する。

### 01_IR-Core-Definition.md
IR の目的、定義、研究上の位置づけを記述する。
- IR は何か
- AST と何が異なるか
- なぜ IR が必要か
- 何を表し、何を表さないか

### 02_IR-Design-Principles.md
IR 設計の原則を定義する。
- 構文従属を避ける
- 実装依存を避ける
- 判断接続可能性を保つ
- CFG / DFG 生成可能性を保つ
- 粒度一貫性を保つ

### 03_IR-Unit-Taxonomy.md
IR の構成単位を分類する。
- Control Unit
- Data Operation Unit
- State Transition Unit
- Boundary Interaction Unit
- Invocation Unit
- Composite Unit
- Guard / Condition Unit
- Exceptional / Terminal Unit

### 04_AST-to-IR-Mapping.md
AST ノードから IR 単位へ写像する規則を定義する。
- 1対1写像
- 1対多写像
- 多対1写像
- 構文補助ノードの吸収
- paragraph / section の扱い
- clause の正規化方針

### 05_IR-Control-Abstraction.md
制御構造の IR 抽象化を扱う。
- IF
- EVALUATE
- PERFORM
- GO TO
- NEXT SENTENCE
- STOP RUN / GOBACK
- condition / branch / loop / dispatch の抽象化

### 06_IR-Data-Operation-Model.md
データ操作の IR 抽象化を扱う。
- MOVE
- COMPUTE
- ADD / SUBTRACT / MULTIPLY / DIVIDE
- INITIALIZE
- STRING / UNSTRING
- INSPECT
- assignment / transformation / aggregation / decomposition の観点

### 07_IR-Boundary-and-SideEffect-Model.md
外部境界と副作用を扱う。
- READ / WRITE / REWRITE / DELETE / START
- ACCEPT / DISPLAY
- CALL
- SORT / MERGE
- file, external system, procedure boundary, environment access の抽象化

### 08_IR-Composition-and-Normalization.md
IR を比較可能・解析可能にするための正規化規則を定義する。
- 複合文の分解
- 入れ子構造の平準化
- 条件表現の正規化
- 制御終端の明示
- データ作用の最小単位化

### 09_IR-Connection-to-CFG-DFG.md
IR から CFG / DFG を構築する接続規則を整理する。
- ノード生成単位
- 辺生成単位
- branch / loop / join
- def-use 観点
- control dependence / data dependence への橋渡し

### 10_IR-Connection-to-Guarantee-Scope-Decision.md
IR を判断モデルへ接続する。
- Guarantee Unit と IR Unit の関係
- Scope Unit と IR Unit の関係
- Migration Decision に必要な IR 情報
- リスク観点の接続
- 変更影響分析の接続起点

---

## 8. 実行順序

推奨実行順序は次のとおり。

1. 01_IR-Core-Definition.md
2. 02_IR-Design-Principles.md
3. 03_IR-Unit-Taxonomy.md
4. 04_AST-to-IR-Mapping.md
5. 05_IR-Control-Abstraction.md
6. 06_IR-Data-Operation-Model.md
7. 07_IR-Boundary-and-SideEffect-Model.md
8. 08_IR-Composition-and-Normalization.md
9. 09_IR-Connection-to-CFG-DFG.md
10. 10_IR-Connection-to-Guarantee-Scope-Decision.md

この順序の意図は次のとおり。
- まず IR の存在理由と原則を固定する
- 次に IR 単位を分類する
- その後 AST からの写像を明示する
- ついで制御・データ・境界を個別に定義する
- 最後に接続先（CFG / DFG / Guarantee / Scope / Decision）へ橋をかける

---

## 9. 各文書の必須観点

すべての文書で、可能な限り次の観点を明示する。

### A. 定義
対象概念を一文で定義する。

### B. 必要性
なぜこの概念が移行判断に必要かを述べる。

### C. 境界
何を含み、何を含まないかを明確にする。

### D. 粒度
どの粒度で扱うかを固定する。

### E. 接続
前後の層（AST / CFG / DFG / Guarantee / Scope / Decision）との関係を書く。

### F. リスク
この定義が曖昧だと何が起きるかを書く。

### G. 例
COBOL 構造に対する簡易例を示す。

---

## 10. Phase8 の設計原則

Phase8 では、次の原則を強く維持する。

### 原則1：IR は構文の写しではなく、構造作用の表現である
AST のノードをそのまま言い換えるだけでは IR にならない。  
IR は、解析・保証・判断に必要な作用単位へ再構成された表現でなければならない。

### 原則2：IR は実装変換専用モデルではない
C# 生成の都合だけで IR を設計すると、研究基盤としての独立性が失われる。  
IR は、生成より前の「理解・比較・判断」のための層として定義する。

### 原則3：IR は CFG / DFG の母体である
後段グラフを別個の偶発生成物にしないため、IR 時点で制御作用・データ作用を整理しておく。

### 原則4：IR は Guarantee / Scope / Decision に接続される
IR の単位が判断単位にならないなら、移行研究における価値が弱い。  
どの IR 単位が保証対象か、どの IR 単位がスコープ境界か、どの IR 単位が移行困難性を高めるか、を説明できる必要がある。

### 原則5：正規化可能であること
同じ意味構造が異なる表記揺れで現れても、IR 上では比較可能な形に寄せられる必要がある。

---

## 11. 主要な研究論点

### 11.1 IR の最小単位
候補は次の三つがある。
- 文単位
- 作用単位
- 判断単位

本研究では、**文単位を基礎としつつ、必要に応じて作用単位へ分解する方式** が有力である。  
理由は、COBOL の一文が複数作用を内包する場合があり、そのままでは DFG / Guarantee 接続が粗くなるためである。

### 11.2 paragraph / section の扱い
paragraph / section は AST 上では構文的コンテナだが、IR 上では
- entry boundary
- callable region
- control destination
- scope container
として意味を持つ場合がある。

したがって単なる入れ物ではなく、**制御上の境界単位** として扱う必要がある。

### 11.3 PERFORM の抽象
PERFORM は COBOL における重要な制御構造であり、
- 手続呼出
- 範囲実行
- 反復
- 条件付き継続
の複合性を持つ。

IR ではこれを
- invoke
- iterate
- bounded-range-execute
のどの観点で表すかを整理する必要がある。

### 11.4 EVALUATE の抽象
EVALUATE は多分岐選択であり、単純な switch 的構造を超える場合がある。  
ALSO や THRU を含むと、条件空間分割として扱う方が自然な場合がある。  
IR では単なる case 群ではなく、**条件領域分割モデル** として扱う余地がある。

### 11.5 データ操作の正規化
MOVE / COMPUTE / INSPECT / STRING / UNSTRING は、見た目の構文差よりも、
- 値代入
- 変換
- 集約
- 分解
- 位置依存処理
といった作用差で整理する必要がある。

### 11.6 境界作用の分離
READ / WRITE / CALL は、内部計算と異なり境界越えを伴う。  
移行リスク上も重要であるため、IR では通常の Data Operation Unit とは別種に分離した方がよい。

---

## 12. 各文書の成果物イメージ

各文書では、最終的に少なくとも次を含めるとよい。

- 概念定義
- 位置づけ
- 図式（Mermaid）
- 例
- 前後層との接続
- 将来の研究への接続点
- 未確定論点

---

## 13. 推奨 Mermaid テーマ

Phase8 では、文書ごとに少なくとも 1 図を入れることを推奨する。

### 推奨図の例
- AST → IR → CFG / DFG の層関係図
- IR Unit taxonomy の分類図
- PERFORM / EVALUATE 抽象化図
- Data Operation taxonomy 図
- Boundary / Side Effect model 図
- Guarantee / Scope / Decision への接続図

---

## 14. 受入基準

Phase8 の受入基準は次のとおり。

### 必須
- 10 文書が存在する
- 各文書に定義・必要性・境界・接続がある
- IR の単位分類が定義されている
- AST → IR の写像方針がある
- IR → CFG / DFG の接続方針がある
- IR → Guarantee / Scope / Decision の接続方針がある

### 推奨
- 各文書に Mermaid 図がある
- 主要 COBOL 構造に対する例がある
- 将来のリスク・未確定論点が書かれている
- 粒度に関する判断理由が明記されている

---

## 15. Phase8 実行時の注意

### 注意1：実装変換へ寄りすぎない
IR を C# コード生成都合で定義しすぎると、研究の汎用性が損なわれる。

### 注意2：AST と役割重複しない
AST は構文構造、IR は作用構造であり、役割分離を明確にする。

### 注意3：CFG / DFG を先取りしすぎない
IR は CFG / DFG の前段だが、グラフそのものではない。  
ノード候補・辺候補の源泉として設計する。

### 注意4：Guarantee 理論との接続を忘れない
IR は、後に保証空間・判断空間へ接続される。  
そのため、単なる中間表現ではなく「保証可能単位の候補」として見ておく。

### 注意5：Scope 研究との整合をとる
どの IR 単位が閉じた範囲を持つか、どの IR 単位が影響伝播の起点になるか、という観点を常に保持する。

---

## 16. 次フェーズへの接続

Phase8 完了後は、次の方向へ自然接続できる。

### 30_cfg
- IR 上の制御作用をノード・辺へ展開
- branch / loop / join / exit の明示
- paragraph / section / PERFORM の制御表現精緻化

### 40_dfg
- IR 上の def-use / transformation / propagation の明示
- データ依存と副作用依存の整理

### 50_guarantee との再接続
- Guarantee Unit を IR Unit に対応づける
- 保証困難領域を IR パターンとして記述する

### 60_scope / 70_decision との連携
- Scope 境界の候補単位として IR Unit を利用する
- 移行可否判断の根拠を IR 構造特徴として整理する

---

## 17. Phase8 のまとめ

Phase8 は、AST の次に置かれる単なる中間段ではない。  
それは、**COBOL の構文を「移行判断に耐える構造単位」へ再編する研究フェーズ** である。

このフェーズが曖昧なままだと、
- CFG は局所図に終わりやすく
- DFG は表層的になりやすく
- Guarantee は対象単位を失い
- Scope は境界根拠を弱め
- Decision は説明責任を持てなくなる

逆に、IR が確立されれば、
- 制御
- データ
- 境界
- 保証
- 判断
を接続する共通基盤が得られる。

したがって Phase8 は、`20_ir` を通じて  
**「構文から判断へ向かうための中間構造理論」を確立するフェーズ** と位置づける。

---

## 18. 実行用ファイル名案

実行時は以下のファイル名で作成すると整合がよい。

```text
docs/20_ir/01_IR-Core-Definition.md
docs/20_ir/02_IR-Design-Principles.md
docs/20_ir/03_IR-Unit-Taxonomy.md
docs/20_ir/04_AST-to-IR-Mapping.md
docs/20_ir/05_IR-Control-Abstraction.md
docs/20_ir/06_IR-Data-Operation-Model.md
docs/20_ir/07_IR-Boundary-and-SideEffect-Model.md
docs/20_ir/08_IR-Composition-and-Normalization.md
docs/20_ir/09_IR-Connection-to-CFG-DFG.md
docs/20_ir/10_IR-Connection-to-Guarantee-Scope-Decision.md
```

---

## 19. 補足メモ

このロードマップは、次の既存研究の延長線上に置く。

- 10_ast における粒度方針
- 50_guarantee における保証単位と保証空間
- 60_scope における境界・閉包・伝播
- 70_decision における移行判断根拠

つまり `20_ir` は、それらを分断しないための中間層である。  
Phase8 では、この中間層を独立理論として成立させることが目的となる。
