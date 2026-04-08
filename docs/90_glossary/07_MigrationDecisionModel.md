# Glossary 7. Migration Decision Model

This document defines concepts related to decision making in migration projects.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Migration Decision** | Decision | 評価されたメトリクスに基づいて、移行戦略を選択する形式的な行為。 | $D: Context \times Metrics \to Strategy$ | [[Migration Feasibility]], [[Decision Boundary]] |
| **Migration Feasibility** | Decision | 制約条件下で、特定の移行パスが実行可能かどうかの評価。 | $F(P, C) \in \{feasible, infeasible\}$ | [[Structural Risk]], [[Migration Path]] |
| **Structural Risk** | Decision | 既存システム（Legacy System）の内部構造（スパゲッティコード、密結合など）に起因する移行リスク。 | $R_{struct}(S) = f(\text{complexity}, \text{coupling}, \text{cohesion})$ | [[Migration Failure Pattern]], [[Legacy System]] |
| **Migration Strategy** | Decision | Big Bang、Strangler Fig、段階移行など、移行の実行方針や手法。 | $Strategy \in \{BigBang, StranglerFig, Phased, \ldots\}$ | [[Migration Path]], [[Migration Decision]] |
| **Decision Boundary** | Decision | 移行可否や戦略選択の境界条件。リスクやコストの閾値として定義。 | $B_{decision} = \{(risk, cost) \mid risk \leq R_{max} \land cost \leq C_{max}\}$ | [[Migration Decision]] |
| **Redesign Requirement** | Decision | 目標状態（Target State）を達成するために、システム構造を変更する必要性。 | - | [[Migration Decision]], [[Target System]] |
| **Migration Failure Pattern** | Decision | 移行失敗につながることが知られているアンチパターンや構造的条件。 | - | [[Structural Risk]], [[Migration Risk]] |
| **Case Study Analysis** | Decision | 具体的な移行事例を通じた分析手法。成功・失敗パターンの抽出。 | - | [[Migration Decision]], [[Verification Framework]] |
| **Guarantee Decision Space** | Decision | 保証レベルと移行判断の関係を表現する決定空間。 | $DS = GS \times \{go, no\-go, conditional\}$ | [[Guarantee Space]], [[Migration Decision]] |
| **Verification Framework** | Decision | 移行判断の妥当性を検証するための枠組み。検証手法や基準の体系。 | - | [[Migration Decision]], [[Guarantee]] |
| **Risk Tolerance** | Decision | 組織や プロジェクトが受け入れ可能なリスクレベル。意思決定の基準となる。 | $T_{risk} \in [0, 1]$ | [[Structural Risk]], [[Migration Decision]] |