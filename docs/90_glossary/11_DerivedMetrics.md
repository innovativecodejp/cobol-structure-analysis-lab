# Glossary 11. Derived Metrics

This document defines quantitative metrics derived from structural analysis.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Structural Complexity** | Decision | プログラムの構造的複雑さを表す定量指標。制御フロー、データフロー、入れ子の深さなどから算出。 | $C_{struct} = f(CFG_{complexity}, DFG_{complexity}, nesting_{depth})$ | [[CFG]], [[DFG]], [[Control Nesting]] |
| **Cyclomatic Complexity** | Decision | CFG の線形独立な経路の数。制御フローの複雑さを表す古典的指標。 | $V(G) = E - N + 2$ where $E$ = edges, $N$ = nodes | [[CFG]], [[Structural Complexity]] |
| **Data Coupling** | Decision | モジュール間のデータ依存の強さ。共有データや引数の複雑さを測定。 | $Coupling = \frac{\|shared\_data\|}{\|total\_data\|}$ | [[DFG]], [[Cross-Scope Transfer]] |
| **Cohesion** | Decision | モジュール内の要素間の結合度。単一責任原則の達成度を測定。 | $Cohesion = \frac{internal\_relations}{total\_relations}$ | [[Scope]], [[Responsibility Boundary]] |
| **Migration Complexity** | Decision | システム移行の複雑さを表す合成指標。構造リスク、依存関係、保証要求から算出。 | $M_{complexity} = w_1 \cdot Risk + w_2 \cdot Dependencies + w_3 \cdot Guarantees$ | [[Migration Risk]], [[Structural Risk]] |
| **Guarantee Coverage** | Decision | システムの機能に対する保証の網羅率。未保証領域の特定に用いる。 | $Coverage = \frac{\|guaranteed\_functions\|}{\|total\_functions\|}$ | [[Guarantee]], [[Guarantee Unit]] |
| **Scope Completeness** | Decision | 影響分析や変更対象のスコープが完全に定義されている度合い。 | $Completeness = \frac{\|covered\_dependencies\|}{\|total\_dependencies\|}$ | [[Scope]], [[Impact Closure]] |
| **Risk Density** | Decision | 単位領域あたりのリスク要素の密度。高リスク領域の特定に用いる。 | $\rho_{risk} = \frac{\|risk\_elements\|}{area}$ | [[Migration Risk]], [[Structural Risk]] |
| **Dependency Fan-out** | Decision | あるモジュールが依存する他モジュールの数。結合度の指標。 | $FanOut(M) = \|\{M' \mid M \to M'\}\|$ | [[Structural Dependency]] |
| **Dependency Fan-in** | Decision | あるモジュールに依存する他モジュールの数。影響範囲の指標。 | $FanIn(M) = \|\{M' \mid M' \to M\}\|$ | [[Structural Dependency]] |
| **Path Complexity** | Decision | CFG 上の経路数やネストの複雑さ。テストケース数の見積りに用いる。 | $P_{complexity} = \|paths\| + nest\_penalty$ | [[CFG]], [[Path Structure]] |
| **Data Flow Complexity** | Decision | DFG の複雑さを表す指標。定義-使用関係の密度や範囲から算出。 | $DF_{complexity} = \frac{\|def\text{-}use\_chains\|}{\|data\_elements\|}$ | [[DFG]], [[Define-Use Chain]] |
| **Reachability Index** | Decision | CFG または DFG 上の到達可能性の指標。影響範囲の見積りに用いる。 | $R_{index} = \frac{\|reachable\_nodes\|}{\|total\_nodes\|}$ | [[Reachability]], [[Impact Closure]] |