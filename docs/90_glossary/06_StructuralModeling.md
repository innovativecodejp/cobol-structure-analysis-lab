# Glossary 6. Structural Modeling

This document defines concepts for modeling software structure.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Scope** | Structure | 特定の解析や移行ステップにおいて検討対象となるコードやシステム機能の範囲。 | $Scope \subseteq System$ | [[Scope Boundary]], [[Granularity]] |
| **Scope Boundary** | Structure | Scopeの内側と外側を分ける境界線またはインターフェース。 | $\partial Scope$ | [[Scope]], [[Responsibility Boundary]] |
| **Scope Taxonomy** | Structure | スコープの種類や分類体系。文レベル、段落レベル、プログラムレベルなど。 | - | [[Scope]], [[Granularity]] |
| **Scope Composition** | Structure | 複数のスコープを組み合わせて、より大きなスコープを構成する操作。 | $Scope_1 \cup Scope_2 \cup \ldots$ | [[Scope]] |
| **Scope Closure** | Structure | スコープが影響分析や保証の観点で「閉じている」状態。外部依存が制御されている。 | $\text{closure}(Scope) = Scope \cup \text{dependencies}(Scope)$ | [[Impact Closure]], [[Scope]] |
| **Granularity** | Structure | 構造解析や移行を行う際の詳細レベルや単位の大きさ（例：ファイル、セクション、パラグラフ、文）。 | - | [[Guarantee Unit]], [[Scope]] |
| **Structural Dependency** | Structure | ある構造要素が別の要素に依存している関係（例：AがBを呼ぶ、Aが変数Xを使用する）。 | $A \to B$ | [[Data Dependency]], [[Control Dependency]] |
| **Responsibility Boundary** | Structure / Decision | システム内の異なる機能的責務を分ける概念的な境界線。移行では構造的境界をこの責務境界に一致させることが目指される。 | - | [[Scope Boundary]] |
| **Impact Scope** | Structure | 変更や修正が影響を与える範囲。データ依存や制御依存を通じて伝播する。 | $\text{impact}(change) = \{elements \mid affected\_by(change, elements)\}$ | [[Impact Closure]], [[Scope]] |
| **Verification Scope** | Structure | 保証や検証を行う対象範囲。テストやレビューの境界を定義。 | - | [[Scope]], [[Guarantee]] |
| **Migration Unit** | Structure / Decision | 移行作業の最小単位。一括で移行される機能やコンポーネントの範囲。 | - | [[Scope]], [[Migration]] |