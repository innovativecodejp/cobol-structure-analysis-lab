# Phase3.5-0 Execution Prompt

Semantic Guarantee Definition COBOL Structure Analysis Laboratory

Date: 2026-03-05

------------------------------------------------------------------------

# Research Context

This research belongs to the **COBOL Structure Analysis Laboratory**.

Previous phases established the following framework:

Program Structure → Guarantee Space → Safety Region → Structural Risk →
Migration Feasibility → Decision Boundary

Phase3.5 introduces **Migration Planning Theory**.

Before planning migration trajectories, the concept of **Guarantee**
must be formally defined as a semantic invariant.

------------------------------------------------------------------------

# Objective

Define the **Semantic Guarantee Model**.

A Guarantee represents a **semantic invariant preserved during system
migration**.

This task must:

1.  Define the meaning of semantic invariants.
2.  Define the taxonomy of guarantees.
3.  Define how guarantees are extracted from program structure.
4.  Define dependency relationships between guarantees.
5.  Define the weighting system used for migration risk and cost.

The output must become the foundation for the Phase3.5 planning model.

------------------------------------------------------------------------

# Formal Definition Task

Define:

Guarantee p:

p = semantic invariant preserved during migration

Examples:

-   Control flow invariants
-   Data integrity invariants
-   State transition invariants
-   Input/output invariants

Define the invariant set:

I = set of semantic invariants

Guarantee Space:

G = P(I)

Where P(I) is the power set of invariants.

------------------------------------------------------------------------

# Guarantee Taxonomy

Construct a classification of guarantees.

Required categories:

1.  Control Flow Guarantees
2.  Data Integrity Guarantees
3.  State Transition Guarantees
4.  Interface / IO Guarantees

For each category define:

-   formal description
-   structural indicators
-   extraction method from AST/CFG/DFG
-   migration relevance

------------------------------------------------------------------------

# Structural Extraction Model

Define mapping function:

Φ : Code Structure → Guarantee Set

Input:

-   AST
-   CFG
-   DFG

Output:

S ⊆ I

Where S represents the guarantees satisfied by the system.

Explain how invariants are detected using structural patterns.

------------------------------------------------------------------------

# Guarantee Dependency Model

Define dependency relation:

D ⊆ I × I

Where:

(p,q) ∈ D means q depends on p.

Guarantee sets must be **dependency-closed**.

Explain how dependency structure forms:

G_dep

(the valid guarantee space).

------------------------------------------------------------------------

# Guarantee Weighting

Define weighting function:

w : I → ℝ⁺

Weights represent:

-   business criticality
-   verification difficulty
-   migration impact

Explain how weights influence:

Migration Debt Risk Amplification Migration Cost

------------------------------------------------------------------------

# Expected Output Structure

The generated document must include:

1.  Semantic Invariant Definition
2.  Guarantee Taxonomy
3.  Structural Extraction Method
4.  Dependency Structure
5.  Guarantee Weighting Model
6.  Implications for Migration Planning

------------------------------------------------------------------------

# Output File

docs/70_planning/00_Semantic_Guarantee_Definition.md

------------------------------------------------------------------------

# Validation Requirements

Ensure that:

1.  Guarantees represent **semantic invariants** rather than syntactic
    properties.
2.  The taxonomy supports analysis of legacy systems such as COBOL.
3.  The model integrates with the previously defined Guarantee Space.
4.  The definitions allow later computation of migration trajectories.

------------------------------------------------------------------------

# Expected Research Outcome

A formal definition of **Semantic Guarantees** that connects:

Program Structure → Semantic Invariants → Guarantee Space → Migration
Planning

This document becomes the theoretical foundation for:

Phase3.5-1 Guarantee State Graph Phase3.5-2 Transformation Model
Phase3.5-3 Migration Cost Model
