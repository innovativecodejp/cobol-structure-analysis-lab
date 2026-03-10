# Glossary 3. Guarantee Theory

This document defines the constituent elements of the Guarantee concept.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **Guarantee** | Logic / Guarantee | システムのある性質が、変換や移行の後でも維持されていることの確証。定量的には $0$ から $1$ の値を取る。 | $g \in [0,1]$ | [[Guarantee Unit]], [[Invariant]] |
| **Guarantee Unit** | Structure | 保証を検証・維持する最小の機能単位。L1（文）からL5（業務機能）までの階層を持つ。 | $U \subseteq AST$ | [[Guarantee Layer]] |
| **Guarantee Composition** | Theory / Guarantee | 複数の小さな保証を組み合わせて、より大きな保証を構成する操作または理論。（定義待ち） | $G(Parent) = \bigwedge_{child} G(child)$ | [[Guarantee Unit]], [[Guarantee Lattice]] |
| **Guarantee Order** | Theory / Guarantee | 保証の強さや包含関係に基づく順序関係。「保証Aは保証Bよりも強い（A implies B）」などの関係。 | Partial order $\leq$ on Guarantee Space.<br>$g_a \le g_b \iff b \implies a$ | [[Guarantee Lattice]] |
| **Guarantee Equivalence** | Logic / Guarantee | 2つのプログラム要素が、保証の観点で「等価」であるとみなされるための条件。 | $S_A \equiv S_B \iff G(S_A) = G(S_B)$ | [[Semantic Equivalence]] |
