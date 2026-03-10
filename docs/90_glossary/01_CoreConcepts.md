# Glossary 1. Core Concepts

This document defines the fundamental concepts that form the backbone of the COBOL Structure Analysis Lab research.

---

## Migration Guarantee

**Layer**: Logic / Decision
**Status**: Defined

**Definition**:
移行前後におけるシステムの振る舞いや性質が「保存」されていることの論理的・数学的保証。単なるテスト通過ではなく、不変条件（Invariant）の維持として定義される。

**Formal Description**:
$G(S_{src}, S_{dst}) \iff \forall p \in P_{invariant}, p(S_{src}) \equiv p(S_{dst})$

**Related Concepts**: Guarantee Space, Invariant

**Example**:
「移行後も会計計算の結果が1円単位で一致すること（Semantic Guarantee）」

---

## Guarantee Space

**Layer**: Theory
**Status**: Defined

**Definition**:
すべての可能な保証状態の集合が構成する数理的空間。包含関係による半順序構造（束）を持ち、移行プロセスはこの空間内の移動として表現される。

**Formal Description**:
$\mathcal{G} = (2^{\mathbb{P}}, \subseteq)$ where $\mathbb{P}$ is the set of guarantee properties.

**Related Concepts**: Migration Geometry, Guarantee Lattice

**Example**:
構文のみ保証された状態 $S_{syn}$ から、意味も保証された状態 $S_{sem}$ への移動。

---

## Structural Analysis

**Layer**: Structure
**Status**: Defined

**Definition**:
ソースコードを文字列としてではなく、AST、CFG、DFGなどの構造モデルとして解析する手法。

**Related Concepts**: AST, Control Flow Graph, Data Flow Graph

**Example**:
COBOLの `PERFORM` 文を、呼び出しグラフ上のエッジとして解析する。

---

## Migration Geometry

**Layer**: Geometry
**Status**: Defined

**Definition**:
移行プロセスを幾何学的な「経路（Path）」や「距離（Distance）」として扱うための理論フレームワーク。

**Related Concepts**: Guarantee Space, Migration Path

**Example**:
現状システムから目標システムまでの「距離」を定義し、最短経路を探索する。
