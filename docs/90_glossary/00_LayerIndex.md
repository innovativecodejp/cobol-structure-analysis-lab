# Layer別索引 (Index by Layer)

用語を**抽象層（Layer）別**で整理します。

## Syntax Layer (構文層) — 1用語

| Term | File | Formal Description |
|------|------|-------------------|
| **AST (Abstract Syntax Tree)** | `02`, `TermsAstIrCfgDfg` | Tree $T = (V, E, \lambda)$ |

## Structure Layer (構造層) — 32用語

### 基礎構造
| Term | File | Formal Description |
|------|------|-------------------|
| **IR (Intermediate Representation)** | `02`, `TermsAstIrCfgDfg` | $IR = (U, \Sigma, \delta)$ |
| **CFG (Control Flow Graph)** | `02`, `TermsAstIrCfgDfg` | Graph $G = (V, E, s, t)$ |
| **DFG (Data Flow Graph)** | `02`, `TermsAstIrCfgDfg` | Graph $G = (V, E, \tau)$ |
| **Structural Layer Stack** | `02` | AST → IR → CFG/DFG → Guarantee/Scope/Decision |

### 制御構造
| Term | File | Formal Description |
|------|------|-------------------|
| **Basic Block** | `08`, `TermsAstIrCfgDfg` | $BB = (s_1, \ldots, s_n)$ |
| **Control Structure** | `08` | $CS = \{Sequential, Branch, Loop\} \subseteq CFG$ |
| **Control Region** | `08` | $CR = (V_{sub}, E_{sub})$ |
| **Dominance** | `08` | $A \text{ dom } B$ |
| **Post-Dominance** | `08` | $A \text{ pdom } B$ |
| **Reachability** | `08` | $\text{reach}(A, B) \iff \exists \text{path } A \to^* B$ |
| **Path Closure** | `08` | $\text{closure}(v) = \{ u \mid v \to^* u \}$ |
| **Loop Structure** | `08` | $Loop = (header, body, backedge)$ |
| **Back Edge** | `08` | $BE = \{(v, u) \in E \mid u \text{ dominates } v\}$ |
| **Non-Structured Control** | `08` | $NSC = \{edges \mid \neg reducible(CFG)\}$ |
| **Branch-Merge Pattern** | `08` | $BMP = (branch\_node, \{path_i\}, merge\_node)$ |
| **Control Nesting** | `08` | $Nesting(v) = \max\{depth(path) \mid v \in path\}$ |
| **Control Dependency** | `08` | $v \text{ cd } u \iff v \text{ pdom one but not all successors of } u$ |
| **Path Structure** | `08` | $PS = \{Linear, Branching, Cyclic, Complex\}$ |

### データ構造
| Term | File | Formal Description |
|------|------|-------------------|
| **Data Structure** | `09` | $DS = (Elements, Relations, Layout)$ |
| **Define (def)** | `09` | $\text{def}(v, p)$ |
| **Use** | `09` | $\text{use}(v, p)$ |
| **Kill** | `09` | $\text{kill}(d, p)$ |
| **Reaching Definition** | `09`, `TermsAstIrCfgDfg` | $\text{reach}(v, p) = \{d \mid \ldots\}$ |
| **Define-Use Chain** | `09` | $DUC = \{(d, u) \mid \ldots\}$ |
| **Use-Define Chain** | `09` | $UDC = \{(u, d) \mid \ldots\}$ |
| **Data Dependency** | `09` | $DD = \{(v_1, v_2) \mid \ldots\}$ |
| **Data Propagation** | `09` | $Propagate: def(v_1) \to^* use(v_n)$ |
| **Cross-Scope Transfer** | `09` | $CST = \{(v_1, v_2) \mid scope(v_1) \neq scope(v_2)\}$ |
| **Aggregation Edge** | `09` | $AE = \{(\{v_1, v_2, \ldots\}, v_{target})\}$ |
| **Decomposition Edge** | `09` | $DE = \{(v_{source}, \{v_1, v_2, \ldots\})\}$ |
| **Condition-Dependency Edge** | `09` | $CDE = \{(v, condition) \mid v \in operands(condition)\}$ |
| **Data Boundary** | `09` | $DB = \{b \mid \forall v_1, v_2: \ldots\}$ |
| **Data Lifetime** | `09` | $Lifetime(v) = [create(v), destroy(v)]$ |
| **Data Scope** | `09` | $DataScope(v) = \{location \mid visible(v, location)\}$ |
| **Variable Scope** | `TermsAstIrCfgDfg` | $\text{scope}(v) \subseteq \text{ProgramPoints}$ |

### スコープ・モデリング
| Term | File | Formal Description |
|------|------|-------------------|
| **Scope** | `06` | $Scope \subseteq System$ |
| **Scope Boundary** | `06` | $\partial Scope$ |
| **Scope Taxonomy** | `06` | $ScopeTypes = \{S_{statement}, \ldots\}$ |
| **Scope Composition** | `06` | $Scope_1 \cup Scope_2 \cup \ldots$ |
| **Scope Closure** | `06` | $\text{closure}(Scope) = Scope \cup \text{dependencies}(Scope)$ |
| **Granularity** | `06` | $G: \mathbb{N} \to Units$ |
| **Structural Dependency** | `06` | $A \to B$ |
| **Impact Scope** | `06` | $\text{impact}(change) = \{elements \mid affected\_by(change, elements)\}$ |
| **Verification Scope** | `06` | $VS \subseteq System$ |

### 分類・アーキテクチャ
| Term | File | Formal Description |
|------|------|-------------------|
| **Node Taxonomy** | `02` | $NodeTypes = \{N_{ast}, N_{cfg}, N_{dfg}\}$ |
| **Edge Taxonomy** | `02` | $EdgeTypes = \{E_{control}, E_{data}, E_{dependency}\}$ |
| **Layer Architecture** | `02` | $Architecture = (Layers, Dependencies, Interfaces)$ |

## Guarantee Layer (保証層) — 10用語

| Term | File | Formal Description |
|------|------|-------------------|
| **Guarantee** | `01`, `03` | $g \in [0,1]$ |
| **Guarantee Unit** | `03` | $U \subseteq Program$ |
| **Guarantee Composition** | `03` | $G(Parent) = \bigwedge_{child} G(child)$ |
| **Guarantee Order** | `03` | $g_a \leq g_b \iff b \implies a$ |
| **Guarantee Equivalence** | `03` | $S_A \equiv S_B \iff G(S_A) = G(S_B)$ |
| **Guarantee Layer** | `03` | $L_i$ where $i \in \{1,2,3,4,5\}$ |
| **Guarantee Violation** | `03` | $\neg G(S)$ |
| **Guarantee Verification** | `03` | $Verify: (G, S) \to \{true, false, unknown\}$ |
| **Invariant** | `03` | $I: State \to Boolean$ |
| **Semantic Equivalence** | `03` | $S_1 \equiv_sem S_2$ |
| **Verification Strategy** | `03` | $VS = (Methods, Coverage, Criteria)$ |

## Geometry Layer (幾何層) — 29用語

### 保証空間
| Term | File | Formal Description |
|------|------|-------------------|
| **Guarantee Space** | `01`, `04`, `TermsGuaranteeSpace` | $GS = [0,1]^n$ or $(2^{\mathbb{P}}, \subseteq)$ |
| **Guarantee Dimension** | `04` | $g_i \in \{ g_{ctrl}, g_{data}, g_{state}, g_{txn}, g_{if} \}$ |
| **Guarantee Vector** | `04`, `TermsGuaranteeSpace` | $\vec{g} = (g_1, g_2, \ldots, g_n) \in GS$ |
| **Guarantee Axis** | `04`, `TermsGuaranteeSpace` | $axis_i: \text{保証観点}_i$ |
| **Dependent Guarantee Space** | `04` | $\mathcal{G}_{dep} = \{ S \in \mathcal{G} \mid S \text{ satisfies dependencies} \}$ |
| **Weighted Guarantee Space** | `04` | $(GS, d_w)$ |
| **Guarantee Metric** | `04` | $d: GS \times GS \to \mathbb{R}_{\geq 0}$ |
| **Guarantee Lattice** | `04` | $(G, \leq, \vee, \wedge)$ |
| **Guarantee Topology** | `04` | $(GS, \mathcal{T})$ |

### 移行幾何学
| Term | File | Formal Description |
|------|------|-------------------|
| **Migration Path** | `05`, `TermsGuaranteeSpace` | $P: [0,1] \to GS$ |
| **Migration State** | `05`, `TermsGuaranteeSpace` | $S(t) \in GS$ |
| **Migration Distance** | `05`, `TermsGuaranteeSpace` | $d: GS \times GS \to \mathbb{R}_{\geq 0}$ |
| **Safe Region** | `05`, `TermsGuaranteeSpace` | $\mathcal{S} = \{S \in GS \mid \forall g_i, S_i \geq threshold_i\}$ |
| **Failure Region** | `05`, `TermsGuaranteeSpace` | $\mathcal{F} = \{S \in GS \mid \exists g_i, S_i < critical_i\}$ |
| **Ideal State** | `05`, `TermsGuaranteeSpace` | $S_{ideal} = (1, 1, \ldots, 1) \in GS$ |
| **Migration Topology** | `05` | $(GS, \mathcal{T}_{migration})$ |
| **Migration Field** | `05` | $\vec{F}: GS \to T(GS)$ |
| **Migration Barrier** | `05` | $B \subset GS$ |
| **Migration Optimization** | `05` | $\min_{P} \{Cost(P), Risk(P)\}$ |

### 束論・順序
| Term | File | Formal Description |
|------|------|-------------------|
| **Lattice** | `10` | $(L, \leq, \vee, \wedge)$ |
| **Partial Order** | `10` | $(S, \leq)$ |
| **Total Order** | `10` | $\forall x, y \in S: x \leq y \lor y \leq x$ |
| **Join Operation** | `10` | $a \vee b = \sup\{a, b\}$ |
| **Meet Operation** | `10` | $a \wedge b = \inf\{a, b\}$ |
| **Complete Lattice** | `10` | $\forall S \subseteq L, \exists \sup S, \inf S$ |
| **Distributive Lattice** | `10` | $a \wedge (b \vee c) = (a \wedge b) \vee (a \wedge c)$ |
| **Boolean Algebra** | `10` | $(B, \vee, \wedge, \neg, 0, 1)$ |
| **Galois Connection** | `10` | $(f, g): P \leftrightarrows Q$ |
| **Fixed Point** | `10` | $x = f(x)$ |
| **Monotonic Function** | `10` | $x \leq y \implies f(x) \leq f(y)$ |
| **Chain** | `10` | $\forall x, y \in C, x \leq y \lor y \leq x$ |
| **Antichain** | `10` | $x \neq y \implies x \not\leq y \land y \not\leq x$ |
| **Lattice Theory** | `10` | Theory of $(L, \leq, \vee, \wedge)$ structures |

## Decision Layer (判断層) — 13用語

### 移行判断
| Term | File | Formal Description |
|------|------|-------------------|
| **Migration Decision** | `07` | $D: Context \times Metrics \to Strategy$ |
| **Migration Feasibility** | `07` | $F(P, C) \in \{feasible, infeasible\}$ |
| **Migration Strategy** | `07`, `TermsGuaranteeSpace` | $Strategy \in \{BigBang, StranglerFig, Phased, \ldots\}$ |
| **Decision Boundary** | `07` | $B_{decision} = \{(risk, cost) \mid \ldots\}$ |
| **Redesign Requirement** | `07` | $RR: (S_{current}, S_{target}) \to \{required, optional, none\}$ |
| **Verification Framework** | `07` | $VF = (Methods, Criteria, Tools)$ |
| **Risk Tolerance** | `07` | $T_{risk} \in [0, 1]$ |

### リスク・パターン
| Term | File | Formal Description |
|------|------|-------------------|
| **Structural Risk** | `07` | $R_{struct}(S) = f(\text{complexity}, \text{coupling}, \text{cohesion})$ |
| **Migration Failure Pattern** | `07` | $FP = \{pattern_i \mid \Pr[\text{failure} \mid pattern_i] > threshold\}$ |
| **Control Risk Pattern** | `08` | $CRP = \{pattern \mid complexity(pattern) > threshold\}$ |
| **Data Risk Pattern** | `09` | $DRP = \{pattern \mid risk\_level(pattern) > acceptable\_threshold\}$ |

### メトリクス
| Term | File | Formal Description |
|------|------|-------------------|
| **Structural Complexity** | `11` | $C_{struct} = f(CFG_{complexity}, DFG_{complexity}, nesting_{depth})$ |
| **Cyclomatic Complexity** | `11` | $V(G) = E - N + 2$ |
| **Data Coupling** | `11` | $Coupling = \frac{\|shared\_data\|}{\|total\_data\|}$ |
| **Cohesion** | `11` | $Cohesion = \frac{internal\_relations}{total\_relations}$ |
| **Migration Complexity** | `11` | $M_{complexity} = w_1 \cdot Risk + w_2 \cdot Dependencies + w_3 \cdot Guarantees$ |
| **Guarantee Coverage** | `11` | $Coverage = \frac{\|guaranteed\_functions\|}{\|total\_functions\|}$ |
| **Scope Completeness** | `11` | $Completeness = \frac{\|covered\_dependencies\|}{\|total\_dependencies\|}$ |
| **Risk Density** | `11` | $\rho_{risk} = \frac{\|risk\_elements\|}{area}$ |
| **Dependency Fan-out** | `11` | $FanOut(M) = \|\{M' \mid M \to M'\}\|$ |
| **Dependency Fan-in** | `11` | $FanIn(M) = \|\{M' \mid M' \to M\}\|$ |
| **Path Complexity** | `11` | $P_{complexity} = \|paths\| + nest\_penalty$ |
| **Data Flow Complexity** | `11` | $DF_{complexity} = \frac{\|def\text{-}use\_chains\|}{\|data\_elements\|}$ |
| **Reachability Index** | `11` | $R_{index} = \frac{\|reachable\_nodes\|}{\|total\_nodes\|}$ |

---

**Layer使用統計**:
- Structure (32): 構造モデルの中核
- Geometry (29): 幾何学・空間理論  
- Decision (13): 判断・メトリクス
- Guarantee (10): 保証理論
- Syntax (1): 構文表現