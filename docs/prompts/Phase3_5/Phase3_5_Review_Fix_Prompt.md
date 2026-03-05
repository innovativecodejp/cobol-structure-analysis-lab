# Phase3.5 Review Fix Execution Prompt

Document Set: 10_Invariant_Semantics_Model.md
11_Reachable_State_Space.md 12_Invariant_Types_Model.md
13_Invariant_Algebra.md

Objective: Apply the research‑level review corrections to strengthen the
theoretical foundations of Phase3.5.

------------------------------------------------------------------------

# Task 1 --- Semantics Extraction Model Correction

Update section describing invariant extraction.

Add explicit **sound but incomplete** definition:

Φ(C) ⊆ invariants(Semantics(C))

∃p ∈ invariants(Semantics(C)) : p ∉ Φ(C)

Explain that AST/CFG/DFG based extraction is **sound but incomplete
semantic approximation**.

Add subsection:

7.3 Soundness and Incompleteness of Structural Analysis

Explain: • static analysis approximates semantics\
• some invariants require runtime observation or theorem proving

------------------------------------------------------------------------

# Task 2 --- Dominance Pruning Safety

Update dominance pruning rule in 11_Reachable_State_Space.md

Current rule:

S1 ⊆ S2 and Cost(S1) ≥ Cost(S2)

Replace with safe dominance rule:

Dominance pruning is allowed only if:

1.  S1 ⊆ S2
2.  Cost(path_S1) ≥ Cost(path_S2)
3.  S2 can reach the Safe Region

Add section:

3.5 Feasibility‑Preserving Dominance

Explain risk of pruning states that lead to feasible solutions.

------------------------------------------------------------------------

# Task 3 --- Soft Invariant Relaxation Formalization

Extend the Soft Invariant section.

Introduce relaxation function:

ρ : I → {0,1}

ρ(p)=1 → preserve invariant\
ρ(p)=0 → relax invariant

Explain that migration planning becomes:

Minimize:

MigrationCost + RiskPenalty(ρ)

Subject to:

∀p ∈ Ihard → ρ(p)=1

Add subsection:

3.4 Relaxation Decision Model

------------------------------------------------------------------------

# Task 4 --- Dependency Aware Distance Metric

Extend Invariant Algebra metric section.

Add new metric:

Dependency‑aware distance:

d_dep(S1,S2) = Σ depth(p) for p ∈ (S1 △ S2)

Where:

depth(p) = level in dependency poset.

Explain:

Removing deep invariants costs more because many derived invariants
depend on them.

Add subsection:

5.5 Dependency‑Weighted Migration Distance

------------------------------------------------------------------------

# Output Requirements

Update the following files:

docs/70_planning/10_Invariant_Semantics_Model.md
docs/70_planning/11_Reachable_State_Space.md
docs/70_planning/12_Invariant_Types_Model.md
docs/70_planning/13_Invariant_Algebra.md

Ensure:

• mathematical notation preserved • new subsections clearly marked •
theoretical consistency maintained
