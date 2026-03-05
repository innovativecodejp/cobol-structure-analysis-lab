# Research Revision Task
Refinement of Migration Path Theory

対象文書

10_Migration-Path-Theory.md

レビューで指摘された理論的改善点を反映して文書を改訂する。
既存構造は維持しつつ、数学的説明を強化する。

---

# 修正1
## Path Length の厳密化

現在

L(Path) = |P|

と書かれているが、一般には

Closure

Cl_D

が存在するため

複数要素が同時に追加される可能性がある。

したがって一般形として

L(Path) ≤ |P|

と書く方が安全である。

ただし本モデルでは

Atomic Step の定義として

Cl_D(S ∪ {p}) = S ∪ {p}

を要求しているため

結果として

L(Path) = |P|

が成立する。

この説明を Path Length セクションに追加する。

---

# 修正2
## Linear Extension Interpretation の追加

Atomic Migration Step により

保証追加順序

p1, p2, ..., pn

が誘導される。

ここで

S_i = {p1, ..., p_i}

である。

依存関係

(P, ≤_D)

がある場合

p_j ≤_D p_i

ならば

j < i

が成立する。

したがって

Migration Path は

poset (P, ≤_D)

の

Linear Extension

に対応する。

---

### セクション追加

新しい章

"Linear Extension Interpretation"

を

Atomic Migration Step の直後に追加する。

---

# 修正3
## Top / Bottom の存在条件

現在

Top = P

としている。

これは

依存関係

D

が P 内で閉じている場合に成立する。

すなわち

∀p ∈ P

dependency(p) ⊆ P

である。

この説明を Goal Condition の説明として1段落追加する。

---

# 修正4
## DAG に適したアルゴリズム説明

現在

DFS
BFS
A*

と書かれている。

しかし Guarantee Transition Graph は

DAG

である。

したがって最適経路探索には

Topological Shortest Path

または

Dynamic Programming

が最も自然である。

この説明を Migration Planning セクションに追加する。

---

# 出力要求

改訂された

10_Migration-Path-Theory.md

を再出力する。

以下を満たすこと。

- Path Length の厳密化
- Linear Extension 解釈の追加
- Top / Bottom 条件の補足
- DAG に適したアルゴリズム説明

---

# 最後に

Migration Path と Linear Extension の関係を

1段落でまとめる。

Migration Planning が

Topological Ordering 問題

として解釈できることを説明する。
