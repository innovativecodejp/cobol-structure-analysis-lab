# Research Revision Task
Add Linear Extension Interpretation to Migration Path Theory

対象文書

10_Migration-Path-Theory.md

この文書は Guarantee Transition Graph 上の Migration Path を定義している。

本タスクでは、この Migration Path が

poset (P, ≤_D)

の

Linear Extension

に対応することを数学的に説明する章を追加する。

既存の定義は変更せず、**解釈レイヤとして追加すること**。

---

# 追加位置

以下のセクションの直後に新しい章を追加する。

3 Atomic Migration Step

その直後に

4 Linear Extension Interpretation

を追加する。

その後の章番号は自動的に繰り下げる。

---

# 追加する内容

以下の内容を数学的説明として追加する。

---

## Linear Extension Interpretation

保証性質集合を

P

依存関係を

≤_D

とする。

(P, ≤_D)

は部分順序集合（poset）である。

Migration Path

S0 → S1 → ... → Sn

は保証追加順序

p1, p2, ..., pn

を誘導する。

ここで

S_i = {p1, ..., p_i}

である。

Atomic Migration Step の定義より

S_{i+1} = S_i ∪ {p_i}

である。

依存関係の定義より

もし

p_j ≤_D p_i

ならば

j < i

が成立する。

したがって

p1, p2, ..., pn

は

poset (P, ≤_D)

の

Linear Extension

である。

---

## 理論的解釈

この結果から

Migration Path

は

poset の Linear Extension

に対応する。

したがって

Migration Planning は

Linear Extension

または

Topological Ordering

の探索問題として解釈できる。

---

# 出力要求

更新された

10_Migration-Path-Theory.md

を再出力する。

以下を満たすこと。

- Linear Extension の章を追加
- 既存定義を変更しない
- Migration Path との対応を明確化
- Topological Ordering との関係を説明

必要に応じて Mermaid 図を更新する。
