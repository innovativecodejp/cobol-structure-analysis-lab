# 4. Guarantee Space Theory

## Guarantee Space (GS)

**Layer**: Geometry

**Definition**:
The fundamental domain for Migration Geometry. An $n$-dimensional bounded space where each axis corresponds to a guarantee dimension.

**Formal Description**:
$$ GS = [0,1]^n $$
Typically $n=5$ in the standard model.

**Related Concepts**:
- [[Migration Geometry]]

**Example**:
The coordinate system for plotting migration progress.

---

## Guarantee Dimension (Axis)

**Layer**: Geometry

**Definition**:
An orthogonal axis in the Guarantee Space representing a specific aspect of system correctness.

**Formal Description**:
$$ g_i \in \{ g_{control}, g_{data}, g_{state}, g_{transaction}, g_{interface} \} $$

**Related Concepts**:
- [[Guarantee Space]]

**Example**:
The "Transaction Axis" measures how well transaction boundaries (commit/rollback) are preserved.

---

## Dependent Guarantee Space

**Layer**: Geometry

**Definition**:
A refinement of the Guarantee Space where axes are not independent but have structural dependencies (e.g., State implies Data).

**Formal Description**:
$$ g_j \to g_i $$
A change in $g_j$ may constrain or affect $g_i$.

**Related Concepts**:
- [[Guarantee Space]]
- [[Structural Dependency]]

**Example**:
Improving "State Guarantee" generally requires "Data Guarantee" to be high.

---

## Weighted Guarantee Space

**Layer**: Geometry

**Definition**:
A Guarantee Space equipped with a weighted metric, acknowledging that some dimensions are "harder" or more critical to move in than others.

**Formal Description**:
$$ (GS, d_w) $$
where $d_w$ uses weights $w_i$.

**Related Concepts**:
- [[Guarantee Metric]]
- [[Migration Distance]]

**Example**:
Moving 0.1 units in Data space might cost more than 0.1 units in Interface space.

---

## Guarantee Metric

**Layer**: Geometry

**Definition**:
A function that defines the distance between two points in Guarantee Space.

**Formal Description**:
$$ d: GS \times GS \to \mathbb{R}_{\ge 0} $$

**Related Concepts**:
- [[Migration Distance]]

**Example**:
Weighted Euclidean Distance.
