# Glossary 8. Control Structure Model

This document defines concepts related to control flow and CFG (Control Flow Graph).

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Control Structure** | Structure | プログラム内での制御フロー要素（順次、選択、反復）の配置や構成。実行順序を決定する構文要素の組み合わせパターン。 | $CS = \{Sequential, Branch, Loop\} \subseteq CFG$ | [[CFG]] |
| **Basic Block** | Structure | 単一入口・単一出口の連続した文の列。最初の文が実行されれば最後まで必ず実行される CFG の最小解析単位。 | $BB = (s_1, \ldots, s_n)$ where $\forall i, succ(s_i) = \{s_{i+1}\}$ | [[CFG]] |
| **Control Region** | Structure | 単一の入口と単一の出口を持つCFGの部分グラフ。多くの場合、論理的なブロックに対応する。構造化プログラミングの単位となる。 | $CR = (V_{sub}, E_{sub})$ where $|\{v \in V_{sub} \mid \text{entry}(v)\}| = 1$ | [[Guarantee Unit]], [[Basic Block]] |
| **Dominance** | Structure | CFG 上で、あるノード A を経由しなければノード B に到達できない関係。A は B を支配する（A dominates B）。 | $A \text{ dom } B$ | [[CFG]], [[Reachability]] |
| **Post-Dominance** | Structure | CFG 上で、ノード B から終端に至るすべての経路がノード A を通過する関係。A は B を後支配する。 | $A \text{ pdom } B$ | [[CFG]], [[Dominance]] |
| **Reachability** | Structure | CFG 上で、あるノードから別のノードへの経路が存在するかどうか。実行可能性の基礎概念。 | $\text{reach}(A, B) \iff \exists \text{path } A \to^* B$ | [[CFG]], [[Path Closure]] |
| **Path Closure** | Structure | CFG 上の経路集合の閉包。すべての到達可能な経路を含む。 | $\text{closure}(v) = \{ u \mid v \to^* u \}$ | [[CFG]], [[Reachability]] |
| **Loop Structure** | Structure | 反復（PERFORM UNTIL, PERFORM VARYING 等）を表す CFG 上のサイクル構造。バックエッジを持つ。 | $Loop = (header, body, backedge)$ where $backedge: body \to header$ | [[CFG]], [[Control Region]] |
| **Back Edge** | Structure | CFG 上で、ループの終端からループヘッダへ戻るエッジ。自然ループを識別する。 | $BE = \{(v, u) \in E \mid u \text{ dominates } v\}$ | [[Loop Structure]] |
| **Non-Structured Control** | Structure | GO TO、ALTER、EXIT 等による構造化されていない制御遷移。CFG 上で非還元性を引き起こしうる。移行時の高リスク要素。 | $NSC = \{edges \mid \neg reducible(CFG)\}$ | [[CFG]], [[Structural Risk]] |
| **Branch-Merge Pattern** | Structure | 分岐と合流の組み合わせパターン。IF-THEN-ELSE、EVALUATE などの制御構造。 | $BMP = (branch\_node, \{path_i\}, merge\_node)$ | [[CFG]], [[Path Structure]] |
| **Control Nesting** | Structure | 入れ子になった制御構造（ネストされたIFやPERFORMループなど）の深さと複雑さ。 | $Nesting(v) = \max\{depth(path) \mid v \in path\}$ | [[Structural Complexity]] |
| **Control Dependency** | Structure | ある命令の実行が、別の命令（条件分岐など）の実行結果によって決定される関係。 | $v \text{ cd } u \iff v \text{ pdom one but not all successors of } u$ | [[Structural Dependency]] |
| **Control Risk Pattern** | Decision | CFG 上に現れる移行困難性を増加させる制御構造パターン（多層 GO TO、ループ内分岐集中など）。 | $CRP = \{pattern \mid complexity(pattern) > threshold\}$ | [[Migration Risk]], [[Non-Structured Control]] |
| **Path Structure** | Structure | CFG 上の経路の形状と特性。直線的、分岐的、循環的などの経路パターンを表現する。テストケース設計や複雑度測定の基礎となる。 | $PS = \{Linear, Branching, Cyclic, Complex\}$ | [[CFG]], [[Branch-Merge Pattern]], [[Path Closure]] |