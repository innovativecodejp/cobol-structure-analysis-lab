# Glossary 8. Control Structure Model

This document defines concepts related to control flow.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Control Structure** | Structure | プログラム内での制御フロー要素（順次、選択、反復）の配置や構成。 | - | [[CFG]] |
| **Control Nesting** | Structure | 入れ子になった制御構造（ネストされたIFやPERFORMループなど）の深さと複雑さ。 | - | [[Structural Complexity]] |
| **Control Dependency** | Structure | ある命令の実行が、別の命令（条件分岐など）の実行結果によって決定される関係。 | - | [[Structural Dependency]] |
| **Control Flow Region** | Structure | 単一の入口と単一の出口を持つCFGの部分グラフ。多くの場合、論理的なブロックに対応する。 | - | [[Guarantee Unit]] |
