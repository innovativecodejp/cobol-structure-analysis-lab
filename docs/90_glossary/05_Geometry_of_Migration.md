# 5. Geometry of Migration

## Migration Geometry

**Layer**: Geometry

**Definition**:
The study of migration processes using geometric methods in Guarantee Space.

**Formal Description**:
Tuple $\mathcal{M} = (GS, d, \mathcal{S}, \mathcal{F}, \phi)$

**Related Concepts**:
- [[Guarantee Space]]

**Example**:
Visualizing a Strangler Fig migration as a path that spirals towards the target.

---

## Migration Distance

**Layer**: Geometry

**Definition**:
The geometric displacement between the current state and the target state.

**Formal Description**:
$$ d_w(S_{current}, S_{target}) $$

**Related Concepts**:
- [[Migration Cost]]

**Example**:
Distance is 0.5, meaning half the geometric ground remains to be covered.

---

## Migration Path

**Layer**: Geometry

**Definition**:
A continuous (or discrete sequence of) trajectory connecting the Legacy State to the Target State.

**Formal Description**:
$$ P(t): [0,1] \to GS $$

**Related Concepts**:
- [[Shortest Migration Path]]

**Example**:
Legacy $\to$ Rehost $\to$ Refactor $\to$ Target.

---

## Shortest Migration Path

**Layer**: Geometry

**Definition**:
The path that minimizes the total Migration Cost (Distance + Risk + Effort) while staying within the Safe Region.

**Formal Description**:
$$ \min_P \int cost(P(t)) dt \quad \text{s.t.} \quad P(t) \in \mathcal{S} $$

**Related Concepts**:
- [[Migration Cost]]

**Example**:
The optimal sequence of refactoring steps.

---

## Migration Cost

**Layer**: Geometry / Decision

**Definition**:
The effort or resources required to traverse a Migration Path. Distinct from geometric distance (which is just displacement).

**Formal Description**:
$$ J(P) = \int (Effort + Risk - Utility) dt $$

**Related Concepts**:
- [[Migration Distance]]
- [[Structural Risk]]

**Example**:
Person-hours, computing resources, or business risk exposure.
