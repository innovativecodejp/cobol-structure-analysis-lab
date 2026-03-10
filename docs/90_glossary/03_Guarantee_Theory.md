# 3. Guarantee Theory

## Guarantee

**Layer**: Guarantee

**Definition**:
A quantifiable assurance that a specific property of the system is preserved.

**Formal Description**:
$$ g \in [0,1] $$

**Related Concepts**:
- [[Guarantee Space]]

**Example**:
Control Flow Guarantee ($g_1$), Data Flow Guarantee ($g_2$).

---

## Guarantee Unit

**Layer**: Guarantee / Structure

**Definition**:
The minimal structural component of the source code for which a guarantee can be defined and verified independently.

**Formal Description**:
$$ U \subseteq AST $$
A subset of the AST that forms a coherent unit (e.g., a Paragraph, a Section).

**Related Concepts**:
- [[Scope]]
- [[Granularity]]

**Example**:
A COBOL `SECTION` performing a specific calculation.

---

## Guarantee Composition

**Layer**: Guarantee

**Definition**:
The process or result of combining guarantees from smaller units to form a guarantee for a larger scope.

**Formal Description**:
$$ G(Parent) = \bigwedge_{child \in Children} G(child) $$
Often defined by the "weakest link" (minimum) or a weighted average.

**Related Concepts**:
- [[Guarantee Unit]]
- [[Guarantee Lattice]]

**Example**:
A program is only guaranteed if all its subroutines are guaranteed.

---

## Guarantee Order

**Layer**: Guarantee

**Definition**:
A strict ordering of guarantees based on their strength or strictness.

**Formal Description**:
$$ g_a \le g_b $$
Guarantee $b$ implies guarantee $a$.

**Related Concepts**:
- [[Guarantee Lattice]]

**Example**:
Bitwise Identity > Logical Equivalence > Functional Similarity.

---

## Guarantee Equivalence

**Layer**: Guarantee

**Definition**:
The condition where two system states or components provide the same level of guarantee.

**Formal Description**:
$$ S_A \equiv S_B \iff G(S_A) = G(S_B) $$

**Related Concepts**:
- [[Guarantee]]

**Example**:
A Java method is equivalent to a COBOL paragraph if it produces the same outputs for all inputs.
