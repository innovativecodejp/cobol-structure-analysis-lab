# Glossary 6. Structural Modeling

This document defines concepts for modeling software structure.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Scope** | Structure | 特定の解析や移行ステップにおいて検討対象となるコードやシステム機能の範囲。 | $Scope \subseteq System$ | [[Scope Boundary]], [[Granularity]] |
| **Scope Boundary** | Structure | Scopeの内側と外側を分ける境界線またはインターフェース。 | $\partial Scope$ | [[Scope]], [[Responsibility Boundary]] |
| **Granularity** | Structure | 構造解析や移行を行う際の詳細レベルや単位の大きさ（例：ファイル、セクション、パラグラフ、文）。 | - | [[Guarantee Unit]] |
| **Structural Dependency** | Structure | ある構造要素が別の要素に依存している関係（例：AがBを呼ぶ、Aが変数Xを使用する）。 | $A \to B$ | [[Data Dependency]], [[Control Dependency]] |
| **Responsibility Boundary** | Structure / Decision | システム内の異なる機能的責務を分ける概念的な境界線。移行では構造的境界をこの責務境界に一致させることが目指される。 | - | [[Scope Boundary]] |
