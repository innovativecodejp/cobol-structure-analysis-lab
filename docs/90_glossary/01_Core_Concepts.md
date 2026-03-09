# 1. Core Concepts

## Legacy System

**Layer**: Structure / Decision

**Definition**:
An existing software system that is critical to business operations but may be based on obsolete technologies or architectures. In this context, it refers specifically to the COBOL system being analyzed and migrated.

**Formal Description**:
$$ S_{legacy} $$
The initial state of the system before migration.

**Related Concepts**:
- [[Target System]]
- [[Migration]]

**Example**:
A COBOL mainframe application running core banking logic.

---

## Migration

**Layer**: Geometry / Decision

**Definition**:
The process of transforming a Legacy System into a Target System while preserving critical properties (Guarantees).

**Formal Description**:
$$ P: [0,1] \to GS, \quad P(0)=S_{legacy}, \quad P(1)=S_{target} $$
A continuous path in Guarantee Space connecting the legacy state to the target state.

**Related Concepts**:
- [[Migration Geometry]]
- [[Guarantee]]

**Example**:
Rehosting a COBOL batch process to a Java container.

---

## Guarantee

**Layer**: Guarantee

**Definition**:
A property or behavior of the system that must be preserved or satisfied during migration. It is the fundamental unit of "correctness".

**Formal Description**:
$$ g \in [0,1] $$
A value representing the level of assurance that a property holds.

**Related Concepts**:
- [[Guarantee Space]]
- [[Guarantee Unit]]

**Example**:
"The output file format must be identical byte-for-byte."

---

## Guarantee Space

**Layer**: Geometry

**Definition**:
A multi-dimensional mathematical space where each dimension represents a specific type of guarantee (e.g., Control, Data, State). System states are points in this space.

**Formal Description**:
$$ GS = [0,1]^n $$
An $n$-dimensional hypercube.

**Related Concepts**:
- [[Guarantee Dimension]]
- [[Migration Geometry]]

**Example**:
A 5-dimensional space defined by Control, Data, State, Transaction, and Interface guarantees.

---

## Migration Geometry

**Layer**: Geometry

**Definition**:
The mathematical framework that models software migration as a geometric problem (path finding) within the Guarantee Space.

**Formal Description**:
$$ \mathcal{M} = (GS, d, \mathcal{S}, \mathcal{F}, \phi) $$
A tuple defining the space, metric, safe region, failure region, and utility function.

**Related Concepts**:
- [[Guarantee Space]]
- [[Migration Path]]

**Example**:
Optimizing the migration strategy by finding the shortest path in $\mathcal{M}$ that stays within $\mathcal{S}$.
