# 6. Structural Modeling

## Scope

**Layer**: Structure

**Definition**:
The extent of code or system functionality under consideration for a specific analysis or migration step.

**Formal Description**:
$$ Scope \subseteq System $$

**Related Concepts**:
- [[Scope Boundary]]
- [[Granularity]]

**Example**:
"The scope of this migration is the Payroll Module."

---

## Scope Boundary

**Layer**: Structure

**Definition**:
The interface or delimitation that separates what is inside the scope from what is outside.

**Formal Description**:
$$ \partial Scope $$

**Related Concepts**:
- [[Scope]]
- [[Responsibility Boundary]]

**Example**:
The API endpoints of a microservice.

---

## Granularity

**Layer**: Structure

**Definition**:
The level of detail or size of the units being analyzed or migrated (e.g., File, Section, Paragraph, Statement).

**Formal Description**:
N/A

**Related Concepts**:
- [[Guarantee Unit]]

**Example**:
"Statement-level granularity" vs "Program-level granularity".

---

## Structural Dependency

**Layer**: Structure

**Definition**:
A relationship where one structural element relies on another (e.g., A calls B, A uses variable X).

**Formal Description**:
$$ A \to B $$

**Related Concepts**:
- [[Data Dependency]]
- [[Control Dependency]]

**Example**:
Program A `CALL`s Program B.

---

## Responsibility Boundary

**Layer**: Structure / Decision

**Definition**:
The conceptual line dividing different functional responsibilities within the system. Migration often aims to align Structural Boundaries with Responsibility Boundaries.

**Formal Description**:
N/A

**Related Concepts**:
- [[Scope Boundary]]

**Example**:
Separating UI logic from Business Logic.
