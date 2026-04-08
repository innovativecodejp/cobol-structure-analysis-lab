# Glossary 9. Data Structure Model

This document defines concepts related to data flow and DFG (Data Flow Graph).

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Data Structure** | Structure | システム内のデータ要素（変数、レコード、ファイル）の構成と配置。 | $DS = (Elements, Relations, Layout)$ where $Elements \subseteq Variables$ | [[DFG]] |
| **Define (def)** | Structure | データ要素が新たな値を持つ操作。代入、算術結果の格納、READ、INITIALIZE など。 | $\text{def}(v, p)$ where $v$ is variable, $p$ is program point | [[DFG]], [[Define-Use]] |
| **Use** | Structure | データ要素の値を参照する操作。右辺参照、条件、出力、引数など。 | $\text{use}(v, p)$ where $v$ is variable, $p$ is program point | [[DFG]], [[Define-Use]] |
| **Kill** | Structure | 同一の論理ストレージ上で、後続の define により先行する定義が無効化されること。 | $\text{kill}(d, p)$ where $d$ is definition, $p$ is kill point | [[Reaching Definition]] |
| **Reaching Definition** | Structure | ある use に到達しうる define の集合。CFG 経路上で kill されなかった定義のみが到達する。 | $\text{reach}(v, p) = \{d \mid d \in def(v) \land path(d, p) \land \neg killed(d, p)\}$ | [[DFG]], [[CFG]] |
| **Define-Use Chain** | Structure | define から use への依存関係の連鎖。DFG のエッジを構成する。 | $DUC = \{(d, u) \mid d \in def(v) \land u \in use(v) \land reach(d, u)\}$ | [[DFG]], [[Use-Define Chain]] |
| **Use-Define Chain** | Structure | use から、その値を供給する define への逆参照。 | $UDC = \{(u, d) \mid u \in use(v) \land d \in reach(u)\}$ | [[DFG]], [[Define-Use Chain]] |
| **Data Dependency** | Structure | あるデータ要素が別のデータ要素から導出される、あるいは影響を与える関係。 | $DD = \{(v_1, v_2) \mid \exists path: def(v_1) \to use(v_2)\}$ | [[Structural Dependency]] |
| **Data Propagation** | Structure | define から use への、または中間結果を経由した依存の連鎖。 | $Propagate: def(v_1) \to^* use(v_n)$ through intermediate variables | [[DFG]], [[Impact Closure]] |
| **Impact Closure** | Structure / Decision | 変更起点から DFG 上の依存エッジを辿って到達しうるノード・文・境界の集合。 | $\text{closure}(v) = \{u \mid v \to^* u \text{ on DFG}\}$ | [[DFG]], [[Scope]] |
| **Reverse Closure** | Structure / Decision | ある観測点に影響しうる原因側の集合。回帰テストの範囲決定に用いる。 | $\text{rev-closure}(v) = \{u \mid u \to^* v \text{ on DFG}\}$ | [[Impact Closure]] |
| **Cross-Scope Transfer** | Structure | CALL 引数、ファイル I/O、共有領域など、スコープ境界をまたぐデータ依存。 | $CST = \{(v_1, v_2) \mid scope(v_1) \neq scope(v_2) \land dependency(v_1, v_2)\}$ | [[DFG]], [[Scope Boundary]] |
| **Aggregation Edge** | Structure | 複数のデータ要素から一つへの依存（グループ MOVE、複合式など）。 | $AE = \{(\{v_1, v_2, \ldots\}, v_{target}) \mid aggregate\_operation\}$ | [[DFG]], [[Decomposition Edge]] |
| **Decomposition Edge** | Structure | 一つのデータ要素から複数への依存（UNSTRING、部分参照など）。 | $DE = \{(v_{source}, \{v_1, v_2, \ldots\}) \mid decompose\_operation\}$ | [[DFG]], [[Aggregation Edge]] |
| **Condition-Dependency Edge** | Structure | データが条件式の真偽に関与する依存。CFG の分岐と連動。 | $CDE = \{(v, condition) \mid v \in operands(condition)\}$ | [[DFG]], [[CFG]] |
| **Data Boundary** | Structure | データ依存が止まる境界（文、段落、プログラム、ファイル、外部インタフェース）。 | $DB = \{b \mid \forall v_1, v_2: dependency(v_1, v_2) \implies \neg crosses(b, v_1, v_2)\}$ | [[Scope]], [[DFG]] |
| **Data Lifetime** | Structure | データ要素が有効な値を保持している期間またはスコープ。 | $Lifetime(v) = [create(v), destroy(v)]$ | [[Data Scope]] |
| **Data Scope** | Structure | コード内でデータ要素が参照可能（可視）である範囲。 | $DataScope(v) = \{location \mid visible(v, location)\}$ | [[Scope]] |
| **Data Risk Pattern** | Decision | DFG 上に現れる移行困難性を増加させるパターン（高再定義密度、境界越え集中、広域閉包など）。 | $DRP = \{pattern \mid risk\_level(pattern) > acceptable\_threshold\}$ | [[Migration Risk]], [[Impact Closure]] |