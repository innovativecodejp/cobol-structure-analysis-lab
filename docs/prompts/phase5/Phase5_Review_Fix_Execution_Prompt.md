
# Phase5 レビュー指摘対応 実行プロンプト
# 対象: Gemini / Cursor
# 目的: Migration Geometry 理論の精密化・補強

## Role

You are an advanced research AI working in the COBOL Structure Analysis Lab.

Your task is to revise and strengthen the Phase5 theoretical documents for Migration Geometry based on the review findings.

You must work as a theoretical research editor, not as an implementation assistant.

Priorities:

1. preserve conceptual consistency
2. strengthen mathematical rigor
3. improve abstraction quality
4. clarify future extensibility
5. avoid unnecessary implementation details

---

## Research Context

The current Phase5 document set defines Migration Geometry as a mathematical framework for reasoning about software migration.

Current documents:

- 20_Migration_Geometry_Definition.md
- 21_Migration_State_Model.md
- 22_Migration_Distance_Metric.md
- 23_Migration_Path_Model.md
- 24_Migration_Strategy_Space.md
- 25_Migration_Optimization_Model.md

The current theory is already strong, but the review identified several important issues that must now be addressed.

---

## Review Findings to Reflect

### Finding 1: Guarantee Space is currently modeled as [0,1]^n

This assumes guarantee dimensions are orthogonal and independent.

However, real migration guarantees are often structurally coupled.

Example:

- Transaction depends on State
- State depends on Data
- Interface constraints may affect Control migration

Therefore the current model should be clarified as:

- a first‑order approximation
- an idealized orthogonal model
- a baseline for later extension into non‑orthogonal spaces

---

### Finding 2: State evaluation function

Introduce a scalar evaluation for states.

Examples:

- State Quality
- Guarantee Score
- State Utility

This summarizes overall desirability or system health.

It must be distinguished from:

- distance
- risk
- cost

---

### Finding 3: Distance vs Cost

Clarify the difference.

distance = geometric displacement in guarantee space

cost = operational effort accumulated along a path

risk = exposure caused by system position near failure regions

Weighted metrics are surrogate models, not full cost models.

---

### Finding 4: Explicit future geometry extensions

Future research directions should be explicitly opened:

- non‑orthogonal guarantee space
- ordered guarantee space
- lattice guarantee model
- Riemannian geometry
- graph‑based migration topology

---

## Main Task

Revise the Phase5 theory to make the model more rigorous and extensible.

---

## Required Outputs

### Output 1 – Revised Phase5 summary

Explain:

- Migration Geometry definition
- meaning of Guarantee Space
- why [0,1]^n is used
- interaction of Safe Region, Failure Region, Path, Optimization

---

### Output 2 – Document revision notes

For each document provide strengthening notes.

20_Migration_Geometry_Definition
- clarify orthogonality assumption
- define baseline geometry

21_Migration_State_Model
- introduce state evaluation function

22_Migration_Distance_Metric
- distinguish distance and cost

23_Migration_Path_Model
- clarify path safety vs efficiency

24_Migration_Strategy_Space
- explain strategies as path families

25_Migration_Optimization_Model
- refine objective function

---

### Output 3 – Model Assumptions Section

Add a new section explaining:

1. orthogonal guarantee model assumption
2. metric as approximation
3. possibility of coupled dimensions
4. future generalizations

---

### Output 4 – Mathematical clarification

Define clearly:

State
Distance
Cost
Risk
Utility

---

### Output 5 – Future research roadmap

Candidate themes:

- Guarantee Space mathematical structure
- non‑orthogonal geometry
- lattice guarantee models
- curved migration space
- geometry‑to‑decision mapping

---

## Output Style

Research writing style.

Requirements:

- formal
- abstract
- mathematically precise
- no programming code
- no implementation discussion

Markdown format.

Mermaid diagrams allowed when useful.

---

## Constraints

Do not discard the [0,1]^n model.

Instead:

- preserve it as the baseline
- clarify its assumptions
- extend the theory carefully

Avoid unnecessary complexity.

---

## Final Goal

Strengthen Phase5 so the Migration Geometry framework becomes:

- more rigorous
- more defensible
- more extensible
- closer to a publishable research model

Begin.
