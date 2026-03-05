# 04. Optimal Migration Path

**Phase 3.5: Migration Planning Theory**  
**Document ID:** `docs/70_planning/04_Optimal_Migration_Path.md`  
**Date:** 2026-03-05

---

## 1. Introduction

Given the Guarantee State Graph $G_{state}$ (P3.5-1) with edge weights from the Migration Cost Model (P3.5-3), migration planning reduces to a **shortest-path problem**. This document defines the graph formulation, suitable algorithms, and planning implications.

---

## 2. Graph Formulation

### 2.1 Weighted Graph

$$
G_{state}^{w} = (V, E, c)
$$

- **$V$**: Guarantee states (dependency-closed subsets of $I$).
- **$E$**: Valid transitions $(S, S')$ where $S \lessdot S'$.
- **$c: E \to \mathbb{R}_{\ge 0}$**: Edge weight $c(S, S') = Cost(S \to S')$.

### 2.2 Problem Instance

- **Source**: $S_{start} = \Phi(AST, CFG, DFG)$ (initial state from code).
- **Target set**: $\mathcal{S}$ (Safety Region).
- **Goal**: Find a path $S_{start} \to \dots \to S_{target}$ with $S_{target} \in \mathcal{S}$ that minimizes total cost.

### 2.3 Single vs. Multiple Targets

Since $\mathcal{S}$ is a filter, any $S \in \mathcal{S}$ is acceptable. We can:
- **Option A**: Add a virtual sink node connected to all $S \in \mathcal{S}$ with weight 0.
- **Option B**: Treat the first state in $\mathcal{S}$ reached as the target (Dijkstra/A* naturally handle this).

---

## 3. Optimization Algorithms

### 3.1 Dijkstra's Algorithm

**When to use**: General case. Non-negative edge weights. No heuristic available.

**Procedure**:
1. Initialize $dist[S_{start}] = 0$, $dist[S] = \infty$ for $S \neq S_{start}$.
2. Use a priority queue (min-heap) keyed by $dist$.
3. Extract minimum, relax outgoing edges.
4. Terminate when a state $S \in \mathcal{S}$ is extracted (first time we reach safety).

**Complexity**: $O(|V| \log |V| + |E|)$ with binary heap. $|V|$ can be exponential in $|I|$; practical use may require state-space pruning.

### 3.2 A* Algorithm

**When to use**: When a **heuristic** $h(S)$ underestimates the cost from $S$ to $\mathcal{S}$.

**Admissible heuristic**:
$$
h(S) \le d^*(S, \mathcal{S}) \quad \forall S
$$

**Example heuristic**:
$$
h(S) = \sum_{p \in G_{crit} \setminus S} w(p)
$$

This is the Migration Debt $D_{debt}(S)$. It is admissible if edge costs are at least $w(p)$ for acquiring $p$ (which holds when $R_{factor} \ge 1$).

**Procedure**: Same as Dijkstra, but priority = $dist[S] + h(S)$.

**Benefit**: Expands fewer nodes when $h$ is informative.

### 3.3 Dynamic Programming (Topological Order)

**When to use**: $G_{state}$ is a DAG. We can process states in topological order (e.g., by $\mu(S)$ or $|S|$).

**Procedure**:
1. Topologically sort $V$.
2. For each $S$ in order: $dist[S] = \min_{(T,S) \in E} \{ dist[T] + c(T, S) \}$.
3. Base: $dist[S_{start}] = 0$.

**Benefit**: No priority queue; single pass. Suitable when the state space is small or structured.

### 3.4 Algorithm Selection

| Scenario | Algorithm |
| :--- | :--- |
| Small state space, no heuristic | Dijkstra |
| Large state space, good heuristic | A* |
| DAG with clear topological order | DP |
| Need all shortest paths to $\mathcal{S}$ | Dijkstra (run to completion) |

---

## 4. Path Interpretation

### 4.1 Optimal Path as Migration Plan

An optimal path $S_0 \to S_1 \to \dots \to S_n$ ($S_n \in \mathcal{S}$) specifies:
1. **Sequence of invariants** to acquire: $S_{i+1} \setminus S_i = \{p_i\}$.
2. **Order**: Respects dependency relation $D$ (implicit in $G_{state}$).
3. **Cost**: Total effort and risk exposure.

### 4.2 Transformation Sequence

Each edge $(S_i, S_{i+1})$ maps to a transformation from the Transformation Model (P3.5-2):
- Control flow restructuring (if $p_i \in I_{flow}$).
- Module decomposition (if $p_i \in I_{data}$ or $I_{io}$).
- etc.

### 4.3 Non-Uniqueness

Multiple paths may have the same cost. Tie-breaking (e.g., prefer fewer steps, or lower peak risk) can be added.

---

## 5. Migration Planning Implications

1. **Feasibility**: If no path exists from $S_{start}$ to $\mathcal{S}$, the system is structurally infeasible (Phase 3).
2. **Budget**: If $Cost(path_{opt}) > Budget$, the project is resource-infeasible.
3. **Sensitivity**: Small changes in $c$ (e.g., revised complexity estimates) may change the optimal path; re-run when estimates update.
4. **Incremental planning**: The path can be executed step-by-step; after each step, $S_{start}$ updates and the plan can be recomputed.

---

## 6. Conclusion

The Optimal Migration Path:
1. Formulates migration as a weighted shortest-path problem on $G_{state}^{w}$.
2. Supports Dijkstra, A*, and DP depending on state-space size and heuristic availability.
3. Produces a sequence of transformations that minimize total cost.
4. Integrates with the Migration Strategy Synthesis (P3.5-5) for full plan generation.
