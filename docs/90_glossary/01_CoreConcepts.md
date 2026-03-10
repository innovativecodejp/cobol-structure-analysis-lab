# Glossary 1. Core Concepts

This document defines the fundamental concepts that form the backbone of the COBOL Structure Analysis Lab research.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Legacy System** | Structure / Decision | 事業運営に不可欠だが、古い技術やアーキテクチャに基づいている既存システム。本研究では特にCOBOLシステムを指す。 | $S_{legacy}$ | [[Target System]], [[Migration]] |
| **Target System** | Structure / Decision | 移行後の目標となるシステム状態。 | $S_{target}$ | [[Legacy System]] |
| **Migration** | Geometry / Decision | 重要な性質（Guarantee）を維持しながら、Legacy SystemをTarget Systemへ変換するプロセス。 | $P: [0,1] \to GS, \quad P(0)=S_{legacy}, \quad P(1)=S_{target}$ | [[Migration Geometry]], [[Guarantee]] |
| **Guarantee** | Logic / Guarantee | 移行プロセスにおいて維持または満たされるべきシステムの性質や振る舞い。「正しさ」の基本単位。 | $g \in [0,1]$<br>$G(S_{src}, S_{dst}) \iff \forall p \in P_{inv}, p(S_{src}) \equiv p(S_{dst})$ | [[Guarantee Space]], [[Guarantee Unit]] |
| **Guarantee Space** | Theory / Geometry | すべての可能な保証状態の集合が構成する数理的空間。包含関係による半順序構造（束）を持ち、移行プロセスはこの空間内の移動として表現される。 | $\mathcal{G} = (2^{\mathbb{P}}, \subseteq)$ or $GS = [0,1]^n$ | [[Migration Geometry]], [[Guarantee Lattice]] |
| **Structural Analysis** | Structure | ソースコードを文字列としてではなく、AST、CFG、DFGなどの構造モデルとして解析する手法。 | - | [[AST]], [[CFG]], [[DFG]] |
| **Migration Geometry** | Geometry | 移行プロセスを幾何学的な「経路（Path）」や「距離（Distance）」として扱うための理論フレームワーク。 | $\mathcal{M} = (GS, d, \mathcal{S}, \mathcal{F}, \phi)$ | [[Guarantee Space]], [[Migration Path]] |
