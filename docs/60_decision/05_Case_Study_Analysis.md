# 05. Case Study Analysis: Validation of the Migration Decision Model

**Phase 3: Migration Decision Model**  
**Document ID:** `docs/60_decision/05_Case_Study_Analysis.md`  
**Date:** 2026-03-05

---

## 1. Introduction

This document validates the **Migration Decision Model** (Tasks 1-4) by applying it to three representative COBOL program archetypes. The objective is to demonstrate that the abstract mathematical framework correctly categorizes distinct structural patterns into appropriate migration strategies.

### Methodology

For each case study, we perform the following analysis:
1.  **Structural Characterization**: Describe the AST (logic), CFG (control), and DFG (data) features.
2.  **Metric Estimation**: Estimate key parameters:
    *   **Migration Debt ($D_{debt}$)**: Missing critical guarantees ($G_{crit}$).
    *   **Structural Complexity ($C(S)$)**: The amplification factor for risk.
3.  **Risk Calculation**: Compute Structural Risk $R_{struct} = D_{debt} \times (1 + C(S))$.
4.  **Feasibility Check**: Estimate Minimum Cost $C_{min}$.
5.  **Strategic Decision**: Map the result to the Decision Boundary $\mathbb{D}$.

---

## 2. Case Study A: The "God Class" Monolith

### 2.1 Structural Characterization
*   **Description**: A massive batch program (e.g., 20,000 LOC) that handles multiple business functions (Billing, Reporting, Account Updates) in a single procedural flow.
*   **AST**: Huge, flat procedure division with thousands of paragraphs.
*   **CFG**: Low nesting depth but extremely long sequential flow. High fan-in/fan-out for internal paragraphs.
*   **DFG**: Uses a massive shared `WORKING-STORAGE` and multiple `COPYBOOKS` (e.g., `CUSTOMER-MASTER`, `TRANSACTION-record`). Global state dependency is near 100%.

### 2.2 Metric Estimation
*   **Migration Debt ($D_{debt}$)**: **High**. The monolithic structure violates modularity guarantees ($P_{mod}$) and data isolation guarantees ($P_{iso}$).
    *   $D_{debt} \approx 80$ (on a scale of 0-100).
*   **Structural Complexity ($C(S)$)**: **Very High** (Data Complexity).
    *   $C_{dfg}$ is extreme due to global state coupling.
    *   $C(S) \approx 4.0$ (Risk multiplier is 5x).

### 2.3 Risk & Feasibility
*   **Structural Risk ($R_{struct}$)**: $80 \times (1 + 4.0) = 400$. **Critical Risk**.
*   **Feasibility ($C_{min}$)**:
    *   To migrate safely, one must first **decompose** the monolith.
    *   Decomposition is blocked by the shared Data Coupling Cycle (Blocking Structure).
    *   $C_{min} \to \text{Very High}$.

### 2.4 Strategic Decision
*   **Quadrant**: **Rewrite / Rebuild** (or **Retire** if budget is low).
*   **Rationale**: Direct migration will result in an unmaintainable modern system ("Java Monolith"). Refactoring is too costly due to data entanglement. The best path is to extract business logic specs and rebuild services from scratch.

---

## 3. Case Study B: "Spaghetti Code" (Unstructured Logic)

### 3.1 Structural Characterization
*   **Description**: An older program (1970s style) with heavy use of `GOTO`, `ALTER`, and `PERFORM THRU`.
*   **AST**: unstructured paragraph sequences.
*   **CFG**: **Irreducible**. Contains multiple overlapping loops and entry/exit points that cannot be mapped to structured programming constructs (Sequence, Selection, Iteration).
*   **DFG**: Moderate. Local variables are often reused for different purposes (aliasing).

### 3.2 Metric Estimation
*   **Migration Debt ($D_{debt}$)**: **Medium**. The logic might be simple, but Control Flow Guarantees ($P_{flow}$) are absent.
    *   $D_{debt} \approx 40$.
*   **Structural Complexity ($C(S)$)**: **High** (Control Complexity).
    *   $C_{cfg}$ is high due to knots.
    *   $C(S) \approx 2.5$ (Risk multiplier is 3.5x).

### 3.3 Risk & Feasibility
*   **Structural Risk ($R_{struct}$)**: $40 \times (1 + 2.5) = 140$. **High Risk**.
*   **Feasibility ($C_{min}$)**:
    *   Automated translation tools often fail on irreducible CFGs or produce "goto-ridden" Java/C#.
    *   Structure-preserving migration is **Blocked**.

### 3.4 Strategic Decision
*   **Quadrant**: **Refactor First**.
*   **Rationale**: The logic is likely valuable and isolated enough to save.
    1.  **Step 1 (Refactor)**: Use automated restructuring tools (e.g., Rye's algorithm) to resolve GOTOs into structured loops/conditionals *within the COBOL environment*.
    2.  **Step 2**: Once $C_{cfg}$ is reduced, re-evaluate. Likely moves to **Direct Migration**.

---

## 4. Case Study C: Well-Structured Module

### 4.1 Structural Characterization
*   **Description**: A sub-program designed in the 1990s using structured COBOL (COBOL-85). Performs a specific calculation (e.g., Tax Calculation).
*   **AST**: Clean hierarchy of `PERFORM` sections.
*   **CFG**: **Reducible**. Matches standard structured programming patterns.
*   **DFG**: Explicit `LINKAGE SECTION` for inputs/outputs. No global side effects.

### 4.2 Metric Estimation
*   **Migration Debt ($D_{debt}$)**: **Low**. Most guarantees ($P_{mod}, P_{flow}, P_{iso}$) are already satisfied.
    *   $D_{debt} \approx 10$.
*   **Structural Complexity ($C(S)$)**: **Low**.
    *   $C(S) \approx 0.2$ (Risk multiplier is 1.2x).

### 4.3 Risk & Feasibility
*   **Structural Risk ($R_{struct}$)**: $10 \times (1 + 0.2) = 12$. **Low Risk**.
*   **Feasibility ($C_{min}$)**:
    *   Path to safety is short and clear.
    *   $C_{min} \approx \text{Low}$.

### 4.4 Strategic Decision
*   **Quadrant**: **Direct Migration**.
*   **Rationale**: The code structure is already compatible with modern paradigms. Automated translation will produce clean, maintainable code.

---

## 5. Comparative Summary

| Metric | Case A (Monolith) | Case B (Spaghetti) | Case C (Clean) |
| :--- | :--- | :--- | :--- |
| **Primary Structural Issue** | Data Coupling ($C_{dfg}$) | Control Flow ($C_{cfg}$) | None |
| **Migration Debt ($D_{debt}$)** | 80 (High) | 40 (Medium) | 10 (Low) |
| **Complexity ($C(S)$)** | 4.0 (Very High) | 2.5 (High) | 0.2 (Low) |
| **Structural Risk ($R_{struct}$)** | **400 (Critical)** | **140 (High)** | **12 (Low)** |
| **Feasibility Constraint** | Data Cycle (Blocking) | Irreducible CFG (Blocking) | None |
| **Optimal Strategy** | **Rewrite / Rebuild** | **Refactor First** | **Direct Migration** |

---

## 6. Conclusion

The application of the **Migration Decision Model** to these case studies demonstrates its validity:

1.  **Discrimination**: The model correctly distinguishes between "hard due to size" (Monolith) and "hard due to logic" (Spaghetti), assigning different mitigation strategies (Rewrite vs. Refactor).
2.  **Quantification**: It replaces vague terms like "messy code" with calculable metrics ($R_{struct}$), enabling objective comparison.
3.  **Actionability**: The model points directly to the specific blocking factor ($C_{dfg}$ vs $C_{cfg}$) that must be addressed.

This confirms that the theoretical framework (Tasks 1-4) is practically applicable to real-world COBOL migration scenarios.
