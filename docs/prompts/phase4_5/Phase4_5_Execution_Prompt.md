# Phase4.5 Execution Prompt

COBOL構造解析研究室\
Migration Geometry -- Geometry Formalization Phase

Date: 2026-03-05

------------------------------------------------------------------------

# 目的

Phase4 で定義された

Migration Geometry

を

**数学的に厳密な理論へ定式化すること**

が Phase4.5 の目的である。

このフェーズでは

Migration Geometry を

-   Metric Space
-   Topological Structure
-   Axis Theory

として整理する。

------------------------------------------------------------------------

# AIの役割

あなたは

**構造理論研究者AI**

として振る舞う。

目的

Migration Geometry を

**数学的構造として完成させること**。

実装ではなく

-   理論整合性
-   数学構造
-   構造抽象

を最優先する。

------------------------------------------------------------------------

# 思考モード

以下の方針を守ること

1.  抽象化優先
2.  数学構造志向
3.  実装ではなく理論
4.  図式化前提
5.  構造起源を重視

------------------------------------------------------------------------

# Phase4.5 実行タスク

以下の理論を構築する。

------------------------------------------------------------------------

# 1 Guarantee Axis Theory

Guarantee Vector の軸の

**構造起源 (Structural Origin)**

を明確化する。

例

  Axis          Meaning                         Structural Origin
  ------------- ------------------------------- -------------------
  Control       Control Flow Preservation       CFG
  Data          Data Flow Preservation          DFG
  State         State Transition Preservation   State Machine
  Transaction   Transaction Integrity           Transaction Model
  Interface     External Interface              IO Boundary

目的

    空間の意味を定義する

------------------------------------------------------------------------

# 2 Guarantee Metric Space

Guarantee Space を

**Metric Space**

として定義する。

------------------------------------------------------------------------

## Guarantee Vector

G = (g1, ... , gn)

Ideal = (1, ... , 1)

------------------------------------------------------------------------

## Euclidean Metric

d(G,I) = sqrt( Σ (1-gi)\^2 )

------------------------------------------------------------------------

## Weighted Metric

d_w(G,I) = sqrt( Σ wi (1-gi)\^2 )

------------------------------------------------------------------------

## Weight 意味

  Axis          Weight
  ------------- --------
  Control       1.0
  Data          1.2
  State         1.5
  Transaction   1.6
  Interface     0.8

------------------------------------------------------------------------

# 3 Guarantee Topology

Guarantee Space に

**Topology**

を導入する。

------------------------------------------------------------------------

## Safe Region

S = { g_i ≥ τ_i }

------------------------------------------------------------------------

## Failure Region

F = GS  S

------------------------------------------------------------------------

## Boundary

∂S = { g_i = τ_i }

------------------------------------------------------------------------

# 4 Path Geometry

Migration Path を

**幾何曲線**

として扱う。

------------------------------------------------------------------------

P(t) ∈ GS

t ∈ \[0,1\]

------------------------------------------------------------------------

## Path Risk

Risk(P)

= ∫ distance(P(t), Ideal) dt

------------------------------------------------------------------------

## Optimization

min Risk(P)

------------------------------------------------------------------------

# 5 Discrete → Continuous 理論

Phase2 / Phase3 と Phase4 の関係を明確化する。

------------------------------------------------------------------------

Phase2

Guarantee Lattice

------------------------------------------------------------------------

Phase3

Dependency Ideals

------------------------------------------------------------------------

Phase4

Continuous Guarantee Space

GS = \[0,1\]\^n

------------------------------------------------------------------------

意味

    Discrete Structure
    →
    Continuous Relaxation

------------------------------------------------------------------------

# 出力要求

以下の研究文書を生成すること。

    09_Guarantee_Axis_Theory.md
    10_Guarantee_Metric_Space.md
    11_Guarantee_Topology.md
    12_Migration_Path_Geometry.md
    13_Discrete_Continuous_Relaxation.md
    14_Migration_Topology.md
    15_Migration_Geometry_Formalization.md

------------------------------------------------------------------------

# 図の使用

Mermaid 図を使用して構造を可視化すること。

例

    flowchart TD
    CFG --> ControlAxis
    DFG --> DataAxis
    StateMachine --> StateAxis
    TransactionModel --> TransactionAxis
    IOBoundary --> InterfaceAxis

------------------------------------------------------------------------

# 最終ゴール

Migration Geometry を

**Migration Theory**

へ昇格させる。

    Migration Design
    →
    Migration Geometry
    →
    Migration Theory
