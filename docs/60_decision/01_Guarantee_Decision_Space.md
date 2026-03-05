# 01. Guarantee Space Formalization for Decision Making

**Phase 3: Migration Decision Model**  
**Document ID:** `docs/60_decision/01_Guarantee_Decision_Space.md`  
**Date:** 2026-03-05

---

## 1. Introduction

This document formalizes the **Guarantee Space ($\mathcal{G}$)** specifically as a mathematical domain for making binary migration decisions (Safe vs. Unsafe). While Phase 2 established $\mathcal{G}$ as a descriptive model of system properties, Phase 3 transforms it into a **Decision Space**.

The core objective is to define a **Safety Region** within the lattice of possible system states and provide a rigorous method for determining whether a proposed migration path remains within or reaches this region.

---

## 2. Formal Definitions: The Guarantee Lattice

### 2.1 The Guarantee Space as a Distributive Lattice

Let $\mathbb{P}$ be the finite set of all possible preservation properties (e.g., specific data flows, control logic, boundary values).
The **Guarantee Space** $\mathcal{G}$ is defined as the power set of $\mathbb{P}$, ordered by inclusion:

$$
\mathcal{G} = (\mathcal{P}(\mathbb{P}), \subseteq)
$$

This structure forms a **Boolean Lattice**. For any two states $S_1, S_2 \in \mathcal{G}$:
- **Join ($S_1 \cup S_2$)**: The state where properties from both $S_1$ and $S_2$ are preserved.
- **Meet ($S_1 \cap S_2$)**: The state where only common properties are preserved.

### 2.2 Dependency-Constrained Guarantee Space ($\mathcal{G}_{dep}$)

In reality, guarantees are not independent. A higher-level guarantee (e.g., "Calculate Interest") often depends on lower-level guarantees (e.g., "Variable Access"). Let $D \subseteq \mathbb{P} \times \mathbb{P}$ be the dependency relation where $(p, q) \in D$ means "$q$ requires $p$".

The **Valid Guarantee Space** is the set of all dependency-closed subsets (ideals) of $\mathbb{P}$:

$$
\mathcal{G}_{dep} = \{ S \in \mathcal{G} \mid \forall p \in S, \forall q \in \mathbb{P}, (q, p) \in D \implies q \in S \}
$$

$\mathcal{G}_{dep}$ is a **Distributive Sublattice** of $\mathcal{G}$. This is the actual state space for migration decisions.

---

## 3. Critical Guarantee Theory

Not all guarantees are equal. For a migration to be considered "successful" or "safe," a specific subset of properties *must* be preserved.

### 3.1 Definition of Critical Guarantees ($G_{crit}$)

Let $Req$ be the set of business requirements for the migrated system.
We define the **Critical Guarantee Set** $G_{crit} \subseteq \mathbb{P}$ as the minimal set of properties required to satisfy $Req$.

$$
G_{crit} = \{ p \in \mathbb{P} \mid p \text{ is essential for } Req \}
$$

**Crucially**, $G_{crit}$ must be **dependency-closed**. If a critical requirement depends on a lower-level property, that lower-level property is implicitly critical.

$$
G_{crit} \in \mathcal{G}_{dep}
$$

### 3.2 The Safety Function

We define a binary **Safety Function** $Safe: \mathcal{G}_{dep} \to \{0, 1\}$:

$$
Safe(S) = \begin{cases} 
1 & \text{if } G_{crit} \subseteq S \\
0 & \text{otherwise}
\end{cases}
$$

A state $S$ is **Safe** if and only if it contains all critical guarantees.

---

## 4. The Safety Sublattice

### 4.1 The Safety Region ($\mathcal{S}$)

The set of all safe states forms a specific region within the Guarantee Space, called the **Safety Region** $\mathcal{S}$:

$$
\mathcal{S} = \{ S \in \mathcal{G}_{dep} \mid G_{crit} \subseteq S \}
$$

**Theorem 1 (Filter Property):**
The Safety Region $\mathcal{S}$ is a **Filter** (dual ideal) within the lattice $\mathcal{G}_{dep}$.
*Proof:*
1.  If $S \in \mathcal{S}$ and $S \subseteq T$ (where $T \in \mathcal{G}_{dep}$), then $G_{crit} \subseteq S \subseteq T$, so $G_{crit} \subseteq T$. Thus $T \in \mathcal{S}$. (Upward Closed)
2.  If $S_1, S_2 \in \mathcal{S}$, then $G_{crit} \subseteq S_1$ and $G_{crit} \subseteq S_2$. Thus $G_{crit} \subseteq S_1 \cap S_2$. So $S_1 \cap S_2 \in \mathcal{S}$. (Closed under Meet)

### 4.2 Distance to Safety

For any unsafe state $S \notin \mathcal{S}$, we can define the **Migration Debt** or **Distance to Safety**:

$$
d_{safety}(S) = \mu(G_{crit} \setminus S)
$$

Where $\mu$ is the weighted measure of guarantee importance. This metric quantifies "how unsafe" a state is.

---

## 5. Structural Mapping: From Code to Lattice

How do we map a physical COBOL program to a point $S$ in $\mathcal{G}_{dep}$?

### 5.1 Mapping Function $\Phi$

Let $\mathbb{C}$ be the space of all possible code structures (ASTs).
We define a mapping function $\Phi: \mathbb{C} \to \mathcal{G}_{dep}$ that extracts the set of guarantees provided by a specific code structure $C$.

$$
S = \Phi(C)
$$

### 5.2 Structural Patterns and Lattice Regions

Different code patterns map to different regions of the lattice:

*   **Spaghetti Code**:
    *   Characterized by unstructured control flow (GOTOs).
    *   Maps to a state $S_{spaghetti}$ where control flow guarantees ($P_{flow}$) are weak or absent.
    *   Likely $S_{spaghetti} \notin \mathcal{S}$ if $P_{flow} \cap G_{crit} \neq \emptyset$.

*   **Monolithic Structure ("God Class")**:
    *   Characterized by high coupling and shared state.
    *   Maps to a state $S_{mono}$ where data isolation guarantees ($P_{data}$) are missing.

*   **Modular Structure**:
    *   Characterized by clear interfaces and scope.
    *   Maps to a state $S_{mod}$ high in the lattice, preserving both $P_{flow}$ and $P_{data}$.

### 5.3 The Migration Trajectory

Migration is a transformation of code $C_0 \to C_1 \to \dots \to C_{target}$.
This corresponds to a trajectory in the Guarantee Space:
$S_0 \to S_1 \to \dots \to S_{target}$.

The **Decision Criterion** is:
Does the trajectory eventually reach $\mathcal{S}$?
i.e., is $S_{target} \in \mathcal{S}$?

---

## 6. Conclusion

We have formalized the Guarantee Space for decision making by:
1.  Defining $\mathcal{G}_{dep}$ as a distributive lattice of valid states.
2.  Identifying $G_{crit}$ as the set of essential properties.
3.  Defining the **Safety Region** $\mathcal{S}$ as the filter generated by $G_{crit}$.
4.  Establishing the **Distance to Safety** $d_{safety}(S)$ as a key metric.

This formalization provides the "coordinate system" for the **Structural Risk Model** (Task 2), which will quantify the probability of transitioning successfully into $\mathcal{S}$.
