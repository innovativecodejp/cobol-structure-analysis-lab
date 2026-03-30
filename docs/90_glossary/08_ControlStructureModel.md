# Glossary 8. Control Structure Model

This document defines concepts related to control flow and CFG (Control Flow Graph).

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Control Structure** | Structure | プログラム内での制御フロー要素（順次、選択、反復）の配置や構成。 | - | [[CFG]] |
| **Control Nesting** | Structure | 入れ子になった制御構造（ネストされたIFやPERFORMループなど）の深さと複雑さ。 | - | [[Structural Complexity]] |
| **Control Dependency** | Structure | ある命令の実行が、別の命令（条件分岐など）の実行結果によって決定される関係。 | - | [[Structural Dependency]] |
| **Control Flow Region** | Structure | 単一の入口と単一の出口を持つCFGの部分グラフ。多くの場合、論理的なブロックに対応する。 | - | [[Guarantee Unit]] |
| **Basic Block** | Structure | 単一入口・単一出口の連続した文の列。最初の文が実行されれば最後まで必ず実行される CFG の最小解析単位。 | $BB = (s_1, \ldots, s_n)$ | [[CFG]] |
| **Dominance** | Structure | CFG 上で、あるノード A を経由しなければノード B に到達できない関係。A は B を支配する（A dominates B）。 | $A \text{ dom } B$ | [[CFG]], [[Reachability]] |
| **Post-Dominance** | Structure | CFG 上で、ノード B から終端に至るすべての経路がノード A を通過する関係。A は B を後支配する。 | $A \text{ pdom } B$ | [[CFG]], [[Dominance]] |
| **Reachability** | Structure | CFG 上で、あるノードから別のノードへの経路が存在するかどうか。 | $\text{reach}(A, B) \iff \exists \text{path } A \to^* B$ | [[CFG]], [[Path Closure]] |
| **Path Closure** | Structure | CFG 上の経路集合の閉包。すべての到達可能な経路を含む。 | $\text{closure}(v) = \{ u \mid v \to^* u \}$ | [[CFG]], [[Reachability]] |
| **Loop Structure** | Structure | 反復（PERFORM UNTIL, PERFORM VARYING 等）を表す CFG 上のサイクル構造。バックエッジを持つ。 | - | [[CFG]], [[Control Region]] |
| **Back Edge** | Structure | CFG 上で、ループの終端からループヘッダへ戻るエッジ。自然ループを識別する。 | - | [[Loop Structure]] |
| **Non-Structured Control** | Structure | GO TO、ALTER、EXIT 等による構造化されていない制御遷移。CFG 上で非還元性を引き起こしうる。 | - | [[CFG]], [[Structural Risk]] |
| **Control Risk Pattern** | Decision | CFG 上に現れる移行困難性を増加させる制御構造パターン（多層 GO TO、ループ内分岐集中など）。 | - | [[Migration Risk]], [[Non-Structured Control]] |
