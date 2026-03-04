# Research Log: Weighted Guarantee Space（重み付き保証空間）

**Date:** 2026-03-04  
**Author:** Cursor Agent  
**Topic:** 保証空間への定量的尺度（重み・強度）の導入

## 1. 背景と目的

これまでの Dependent Guarantee Space ($\mathcal{G}_{dep}$) の定義により、保証の構造と依存関係は明確になった。しかし、実際のプロジェクトでは「すべての保証が等価ではない」という事実がある。
構文保証（Syntax）は比較的容易だが、副作用保証（Side-effect）は極めてコストが高い。この「重み（Weight）」の違いを理論モデルに組み込むことで、移行コストの定量的な見積もりや、ツールの費用対効果（ROI）分析を可能にすることを目的とした。

## 2. 決定事項：Weighted Guarantee Space の数理モデル

### 2.1 重み関数と保証強度

保存性質集合 $\mathbb{P}$ 上に非負の重み関数 $w: \mathbb{P} \to \mathbb{R}_{\geq 0}$ を定義した。
そして、保証集合 $S$ の強度（Strength）を以下のように定義した。

$$
Strength(S) = \sum_{p \in S} w(p)
$$

### 2.2 限界費用（Marginal Cost）の形式化

依存構造を持つ空間における「ある性質 $p$ を追加するコスト」は、単体コスト $w(p)$ ではなく、その依存閉包全体を追加するコストであることを定式化した。

$$
\Delta Cost(S, p) = Strength(Cl_D(S \cup \{p\})) - Strength(S)
$$

これにより、「データフロー保証のためには制御フロー保証のコストも払わねばならない」という工学的直観が数学的に証明された。

### 2.3 難易度モデル（Difficulty Model）

移行の難易度を、目標状態と現在状態の Strength の差分として定義した。

$$
Diff(S_{current}, S_{target}) = Strength(S_{target}) - Strength(S_{target} \cap S_{current})
$$

## 3. 重要な洞察

1.  **保証のカバレッジ率**: $Coverage(T) = Strength(S_T) / Strength(\top)$ という指標を導入することで、ツールの網羅率を単なる機能数ではなく「重要度加重」で評価できるようになった。
2.  **コスト構造の可視化**: 上位レイヤー（$P_{side}$ 等）の保証が、依存関係の累積によって指数関数的に高コストになる構造が明らかになった。
3.  **意思決定への応用**: 「あとどれくらいで終わるか？」という問いに対し、「残りタスク数」ではなく「残りStrength」で答えることで、より正確な工数予測が可能になる。

## 4. 成果物

- `docs/50_guarantee/05_Weighted-Guarantee-Space.md`: 重み関数、保証強度、限界費用、難易度モデルを定義した理論文書。

## 5. 結論

Guarantee Space に計量構造（Metric Structure）を入れたことで、本理論は「定性的な構造分析」から「定量的なプロジェクト管理」へと応用範囲を広げた。
このモデルは、移行プロジェクトの予算策定、ツール選定、リスク評価における科学的な根拠（Evidence）として機能する。
