# Glossary 1. Core Concepts

This document defines the fundamental concepts that form the backbone of the COBOL Structure Analysis Lab research.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **COBOL Structure Analysis Lab** | Structure | COBOL資産の構造解析と移行判断のための理論研究・実装プロジェクト。構文だけでなく抽象モデル（AST/IR/CFG/DFG）を積み上げ、移行可否の構造的根拠を生成する。 | $Project: \{AST, IR, CFG, DFG\} \to Evidence_{migration}$ | [[Structural Analysis]], [[Migration]] |
| **Legacy System** | Structure / Decision | 事業運営に不可欠だが、古い技術やアーキテクチャに基づいている既存システム。本研究では特にCOBOLシステムを指す。 | $S_{legacy}$ | [[Target System]], [[Migration]] |
| **Target System** | Structure / Decision | 移行後の目標となるシステム状態。 | $S_{target}$ | [[Legacy System]], [[Migration]] |
| **Migration** | Geometry / Decision | 重要な性質（Guarantee）を維持しながら、Legacy SystemをTarget Systemへ変換するプロセス。 | $P: [0,1] \to GS, \quad P(0)=S_{legacy}, \quad P(1)=S_{target}$ | [[Migration Geometry]], [[Guarantee]] |
| **Guarantee** | Guarantee | 移行プロセスにおいて維持または満たされるべきシステムの性質や振る舞い。「正しさ」の基本単位。 | $g \in [0,1]$ | [[Guarantee Space]], [[Guarantee Unit]] |
| **Guarantee Space** | Geometry | すべての可能な保証状態の集合が構成する数理的空間。包含関係による半順序構造（束）を持ち、移行プロセスはこの空間内の移動として表現される。 | $\mathcal{G} = (2^{\mathbb{P}}, \subseteq)$ or $GS = [0,1]^n$ | [[Migration Geometry]], [[Guarantee Lattice]] |
| **Structural Analysis** | Structure | ソースコードを文字列としてではなく、AST、CFG、DFGなどの構造モデルとして解析する手法。 | $Analysis: Source \to \{AST, IR, CFG, DFG\}$ | [[AST]], [[CFG]], [[DFG]] |
| **Migration Geometry** | Geometry | 移行プロセスを幾何学的な「経路（Path）」や「距離（Distance）」として扱うための理論フレームワーク。 | $\mathcal{M} = (GS, d, \mathcal{S}, \mathcal{F}, \phi)$ | [[Guarantee Space]], [[Migration Path]] |
| **Structural Evidence** | Structure / Decision | 移行可否判断や変更影響分析に使える、構造解析から得られる根拠・材料。構文の羅列ではなく、判断に接続可能な抽象情報。 | $Evidence = f(Structure) \mid f: \text{analyzable} \land \text{actionable}$ | [[Migration Decision]], [[Impact Analysis]] |
| **Abstraction Level** | Structure | 本研究で扱う抽象の階層。構文層（Syntax Layer）、構造層（Structure Layer）、判断層（Decision Layer）など。 | $Levels = \{L_{syntax}, L_{structure}, L_{guarantee}, L_{geometry}, L_{decision}\}$ | [[Layer Architecture]] |