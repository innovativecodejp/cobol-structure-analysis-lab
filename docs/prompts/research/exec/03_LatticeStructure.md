# Phase1.5 追加補強タスク（Prompt3 前提確定）
Guarantee Space = Distributive Lattice

## 背景（前提）
- 保存性質集合を P とする
- Guarantee Space は G = P(P)（P の冪集合）
- 半順序は ⊆
- Weighted Measure μ(S)=Σ w(p)
- Weighted Metric d_w(S1,S2)=μ(S1 △ S2)
- 依存閉包 Cl_D により Dependent Guarantee Space を
  G_dep = { S ⊆ P | S = Cl_D(S) }
  と定義している（= closed sets / ideals として解釈される）

本タスクは Prompt3（Graph/Shortest Path）に入る前に、
空間の代数構造（束構造）を明示して理論の芯を固めるものである。

---

# 目的
1) Guarantee Space (G, ⊆) が **分配束（Distributive Lattice）**であることを定義・定理として確立する。  
2) join / meet が何であるか（∪ / ∩）を明示する。  
3) 分配律を証明する（簡潔でよいが論理は飛ばさない）。  
4) G_dep（依存付き空間）がこの分配束の **部分束**になる条件と、ならない場合の整理を行う。  
5) Prompt3 に必要な「Graph化」への接続語彙（Hasse図、cover relation、lattice graph）を定義する。

---

# 出力要件（必須）

## 1. 定義：束・分配束
- 半順序集合 (L, ≤) における meet/join の定義
- 分配束の定義（join が meet に分配、meet が join に分配）

## 2. 定理：Guarantee Space は分配束
以下を示せ：

- L = P(P)
- ≤ は ⊆
- join(S,T)=S∪T
- meet(S,T)=S∩T
- これにより (P(P), ⊆, ∪, ∩) は束である
- さらに分配律
  S ∩ (T ∪ U) = (S ∩ T) ∪ (S ∩ U)
  S ∪ (T ∩ U) = (S ∪ T) ∩ (S ∪ U)
  が成り立つため分配束である

証明は集合演算の恒等式に基づいてよい。

## 3. 完備性（必要なら）
- (P(P), ⊆) が完備束（arbitrary union/intersection が存在）であることを述べよ
- ただし本タスクは「分配束」が主題なので簡潔に

## 4. G_dep との関係（重要）
次を厳密に整理せよ：

- G_dep を closed sets と見たとき、
  intersection に閉じる（meet は維持される）こと
- union に閉じるかは closure operator の性質に依存する可能性があること
  - もし closure が「Moore family（交わり閉包族）」として定義されているなら、
    一般に closed sets は intersection に閉じるが union に閉じない場合がある
  - 一方、G_dep を **ideals** として定義する場合（下集合＋有向上限閉包）には
    union にも閉じて束になる条件がある
- この研究では「G_dep ≅ Idl(P, ≤_D)」の立場を採るため、
  ideals の union / intersection が ideals になる条件を明示し、
  G_dep が分配束（少なくとも束）として扱える範囲を定義せよ

※ ここは曖昧にせず、「どの定義を採用するか」を宣言せよ。

## 5. Prompt3 への接続：Hasse図と cover relation
- 束の Hasse 図（cover relation）を定義せよ：
  S ⋖ T  iff  S ⊂ T かつ S ⊆ U ⊆ T を満たす U が S,T のみ
- Guarantee Space の cover relation は「要素を1つ追加/削除」に対応することを述べよ
- これにより Guarantee Space を graph 化できることを示せ（lattice graph / hypercube graph への接続）

---

# 禁止事項
- 実装・アルゴリズム詳細の議論は禁止（Prompt3で行う）
- ツール設計は禁止

---

# 形式
- 見出し付きの研究文書として出力
- 必要に応じて Mermaid（Hasse図の簡易例）を1つ入れる
- 最後に Prompt3 の入力前提として「確定した定義・定理一覧」を箇条書きでまとめる

以上を満たす形で出力せよ。
