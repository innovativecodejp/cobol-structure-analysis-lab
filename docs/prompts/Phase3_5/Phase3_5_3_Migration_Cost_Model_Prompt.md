# Phase3.5-3 Execution Prompt

Migration Cost Model COBOL Structure Analysis Laboratory

Date: 2026-03-05

------------------------------------------------------------------------

# Objective

Define a **Cost Model** for migration transitions.

Each transformation must have a cost estimate.

------------------------------------------------------------------------

# Cost Definition

Cost(S → S') = base_effort × risk_factor

Where:

base_effort = engineering effort risk_factor = amplification from
structural complexity

------------------------------------------------------------------------

# Risk Factors

Derived from:

• Control flow complexity\
• Data coupling\
• Dependency depth\
• Module size

------------------------------------------------------------------------

# Cost Aggregation

Migration path cost:

Cost(path) = Σ Cost(S_i → S_i+1)

------------------------------------------------------------------------

# Expected Output

1.  Cost function definition
2.  Risk amplification model
3.  Example cost calculations
4.  Interpretation for planning

------------------------------------------------------------------------

# Output File

docs/70_planning/03_Migration_Cost_Model.md
