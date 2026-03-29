# Phase8｜20_ir 実行管理 INDEX
作成日: 2026-03-29

---

## 1. この INDEX の目的

この文書は、Phase8 として実施する `20_ir` 研究を、**実行順序・目的・依存関係・完了確認** の観点から管理するための INDEX である。

単なる目次ではなく、次の用途を持つ。

- 10 本の研究文書をどの順番で実行するかを固定する
- 各文書の役割と到達点を簡潔に把握する
- 前段・後段との依存関係を確認する
- 進行中／完了の管理に使う
- Phase8 完了判定の基準を共有する

---

## 2. Phase8 の位置づけ

Phase8 は `20_ir` を対象とし、COBOL 構造解析研究における **IR（Intermediate Representation）理論の中核確立フェーズ** と位置づける。

このフェーズの目的は、AST で抽出された構文構造を、次の層へ接続可能な **構造作用単位** として再編成することである。

接続対象:
- CFG
- DFG
- Guarantee
- Scope
- Decision

したがって Phase8 は、単なる「AST の次の層」ではなく、**構文から判断へ向かうための中間構造理論を定義するフェーズ** である。

---

## 3. 実行対象ファイル一覧

```text
docs/20_ir/
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

---

## 4. 実行順序と依存関係

Phase8 の推奨実行順序は以下のとおり。

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

この順番の意図は次のとおり。

- まず IR の定義を固定する
- 次に設計原則を固定する
- その後、IR を構成する単位分類を与える
- AST から IR への写像規則を与える
- 作用の主要領域（制御・データ・境界）を個別定義する
- IR の比較可能性を支える合成・正規化を定義する
- 最後に CFG / DFG / 判断モデルへの接続を定義する

---

## 5. 実行管理テーブル

| No. | ファイル名 | 主目的 | 前提 | 完了条件 |
|---|---|---|---|---|
| 01 | IR-Core-Definition | IR の定義と位置づけを確立する | Phase7 までの AST / Guarantee / Scope の理解 | IR の一文定義、AST との差分、責務範囲、接続先が明示されている |
| 02 | IR-Design-Principles | IR 設計原則を固定する | 01 完了 | 原則一覧、必要性、破綻リスク、トレードオフが整理されている |
| 03 | IR-Unit-Taxonomy | IR Unit の分類体系を与える | 01, 02 完了 | Unit 定義、分類軸、各 Unit の責務、後続接続が記述されている |
| 04 | AST-to-IR-Mapping | AST→IR 写像規則を定義する | 01〜03 完了 | 主要 COBOL 構造の写像規則と写像パターンが整理されている |
| 05 | IR-Control-Abstraction | 制御構造の IR 抽象を定義する | 03, 04 完了 | IF / EVALUATE / PERFORM などの制御抽象と CFG 接続がある |
| 06 | IR-Data-Operation-Model | データ操作の IR 抽象を定義する | 03, 04 完了 | MOVE / COMPUTE / INSPECT / STRING / UNSTRING 等が分類されている |
| 07 | IR-Boundary-and-SideEffect-Model | 境界作用と副作用を分離して定義する | 03, 04 完了 | I/O, CALL, ACCEPT/DISPLAY 等の境界分類とリスクが整理されている |
| 08 | IR-Composition-and-Normalization | 合成規則と正規化規則を定義する | 03〜07 完了 | 合成規則、正規化対象、限界、比較可能性が記述されている |
| 09 | IR-Connection-to-CFG-DFG | IR から CFG / DFG への接続を定義する | 05〜08 完了 | ノード生成、辺生成、制御依存・データ依存の橋渡しがある |
| 10 | IR-Connection-to-Guarantee-Scope-Decision | IR を判断モデルへ接続する | 01〜09 完了 | Guarantee / Scope / Decision 接続、リスク指標、判断単位条件が整理されている |

---

## 6. 各ファイルの役割メモ

### 01_IR-Core-Definition.md
Phase8 全体の基礎。  
ここで IR の定義が曖昧だと、以後の文書すべてがぶれる。

### 02_IR-Design-Principles.md
IR 設計のルールブック。  
定義だけでなく、「どう設計してよいか」「何を避けるべきか」を固定する。

### 03_IR-Unit-Taxonomy.md
IR を構成する単位群の分類表。  
この文書がないと、写像も接続も不安定になる。

### 04_AST-to-IR-Mapping.md
AST と IR の橋渡し文書。  
Phase10_ast の成果を Phase8 に接続する中核文書。

### 05_IR-Control-Abstraction.md
制御構造の抽象化。  
後の CFG に最も強く関係する。

### 06_IR-Data-Operation-Model.md
データ作用の抽象化。  
後の DFG や保証分析に強く関係する。

### 07_IR-Boundary-and-SideEffect-Model.md
外部境界と副作用の抽象化。  
移行リスク上、非常に重要な論点。

### 08_IR-Composition-and-Normalization.md
比較可能性と差分分析可能性の基礎。  
IR を理論として安定化させる文書。

### 09_IR-Connection-to-CFG-DFG.md
IR をグラフ理論側へ接続する文書。  
次フェーズの入口となる。

### 10_IR-Connection-to-Guarantee-Scope-Decision.md
IR を判断理論へ接続する総括文書。  
Phase8 の価値を最終的に定義する。

---

## 7. 進捗管理チェックリスト

以下は実行管理用のチェックリストである。

- [ ] 01_IR-Core-Definition.md
- [ ] 02_IR-Design-Principles.md
- [ ] 03_IR-Unit-Taxonomy.md
- [ ] 04_AST-to-IR-Mapping.md
- [ ] 05_IR-Control-Abstraction.md
- [ ] 06_IR-Data-Operation-Model.md
- [ ] 07_IR-Boundary-and-SideEffect-Model.md
- [ ] 08_IR-Composition-and-Normalization.md
- [ ] 09_IR-Connection-to-CFG-DFG.md
- [ ] 10_IR-Connection-to-Guarantee-Scope-Decision.md

---

## 8. 各文書で共通して確認すべき観点

すべての文書で、最低限次を確認すること。

### A. 定義
対象概念が一文で定義されているか。

### B. 必要性
なぜその概念が移行判断研究に必要かが書かれているか。

### C. 境界
何を含み、何を含まないかが明確か。

### D. 粒度
どの粒度で扱うかが固定されているか。

### E. 接続
前後層への接続が書かれているか。

### F. リスク
曖昧さや設計失敗時の問題が記述されているか。

### G. 可視化
Mermaid 図など、図式化が含まれているか。

---

## 9. Phase8 完了判定

Phase8 が完了したとみなすための条件は次のとおり。

### 必須条件
- 10 本の文書がすべて存在する
- 各文書に定義・必要性・境界・接続・リスクがある
- IR の単位分類が確立している
- AST→IR 写像規則が整理されている
- IR→CFG / DFG 接続が整理されている
- IR→Guarantee / Scope / Decision 接続が整理されている

### 推奨条件
- 各文書に Mermaid 図がある
- COBOL 構造例が含まれている
- 未確定論点や今後の研究課題が書かれている
- 10 文書間の用語整合が取れている

---

## 10. 実行時の注意

### 注意1
IR を実装中間形式として狭く定義しないこと。  
本研究における IR は、構造理解と判断接続のための抽象層である。

### 注意2
AST と役割を重複させないこと。  
AST は構文構造、IR は作用構造として役割を分ける。

### 注意3
CFG / DFG を先取りしすぎないこと。  
IR はグラフそのものではなく、その前提となる構造単位である。

### 注意4
Guarantee / Scope / Decision への接続を常に意識すること。  
Phase8 は後段理論を支える中間層である。

### 注意5
用語のぶれを避けること。  
Unit / Structure / Boundary / Operation / Control / Side Effect などの語を一貫して使う。

---

## 11. 推奨成果物セット

Phase8 で最終的に揃うとよい成果物は次のとおり。

```text
docs/20_ir/
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
  INDEX.md
```

---

## 12. 次フェーズへの接続

Phase8 の完了後は、次のように進めると整合がよい。

- `30_cfg`：制御構造のグラフ化
- `40_dfg`：データ依存構造のグラフ化
- `50_guarantee`：IR Unit を Guarantee Unit と対応づける再整理
- `60_scope`：IR 境界を Scope 境界候補として再評価
- `70_decision`：IR 特徴量を移行判断材料へ昇格

---

## 13. まとめ

この INDEX は、Phase8 `20_ir` を **研究実行可能な単位に分解し、順序・依存・完了条件を明示する運用文書** である。

Phase8 の本質は、COBOL の構文をそのまま扱うことではなく、  
**移行判断に耐える構造作用単位として再編成すること** にある。

その意味で `20_ir` は、AST の次段であると同時に、  
CFG / DFG / Guarantee / Scope / Decision を接続する中心層である。

この INDEX を基準に進めることで、Phase8 を「文書群」ではなく、  
**理論として整合した研究フェーズ** として実行できる。
