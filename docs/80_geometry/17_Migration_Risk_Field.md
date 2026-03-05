# 17. Migration Risk Field

**Phase 4.5: Geometry Formalization**  
**Document ID:** `docs/80_geometry/17_Migration_Risk_Field.md`  
**Date:** 2026-03-05

---

## 1. Introduction

The **Migration Risk Field** (Cost Field) assigns a local risk value to each point in the Guarantee Space. Path risk is the integral of this field along the migration path.

---

## 2. Cost Field Definition

$$
cost: GS \to \mathbb{R}_{\ge 0}, \quad cost(G) = d_w(G, Ideal)
$$

- **Risk Density**: 局所的移行リスク
- **Cost Field**: 空間上のリスク分布

---

## 3. Risk Field Diagram

```mermaid
flowchart LR
    subgraph GS
        G1[G1]
        G2[G2]
        Ideal[Ideal]
    end
    
    subgraph Cost
        c1[cost G1]
        c2[cost G2]
        c0[cost Ideal = 0]
    end
    
    G1 --> c1
    G2 --> c2
    Ideal --> c0
```

---

## 4. Gradient

$$
\nabla cost(G) = \text{risk increase direction}
$$

The gradient points toward higher risk. Migration paths should avoid moving along the gradient when possible.

---

## 5. Path Risk

$$
Risk(P) = \int_0^1 cost(P(t)) \, dt
$$

The path risk is the integral of the cost field along the path.

---

## 6. Geometry Structure

```mermaid
flowchart TD
    subgraph Migration
        Legacy[Legacy]
        Target[Target]
        Path[Path P]
    end
    
    subgraph RiskField
        CostField[Cost Field]
        Gradient[Gradient]
    end
    
    Legacy --> Path
    Path --> Target
    Path --> CostField
    CostField --> Gradient
```

---

## 7. Conclusion

Migration Risk Field formalizes local risk as a scalar field on GS. It connects Path Geometry (12) with Metric Space (10) and supports optimization of migration paths.
