# Phase6_Roadmap.md

# Phase 6: Scope Theory Roadmap
**Project:** COBOL Structural Analysis Lab  
**Phase Name:** Scope Theory  
**Directory:** `60_scope/`

---

## 0. Phase6 の位置づけ

Phase6 は、これまでに整備した以下の研究成果を接続し、  
**「どの範囲を解析対象とし、どの範囲に保証を適用し、どの範囲を移行判断単位とみなすか」**  
を理論化するフェーズである。

### 既存フェーズとの接続
- `10_ast/`
  - 構文単位
  - ASTノード分類
  - 粒度方針
- `50_guarantee/`
  - Guarantee Unit
  - Guarantee Space
  - Dependent / Weighted / Metric / Lattice / Dynamics
- `60_decision/`
  - Decision Space
  - Risk Model
  - Migration Feasibility
  - Boundary / Verification

Phase6 は、上記で定義された概念を、  
**適用範囲・境界・包含・閉包・影響範囲** の観点から束ねる。

---

## 1. Phase6 の研究目的

Phase6 の目的は次のとおり。

1. **Scope の中核定義を与える**
2. **Scope の分類体系を整備する**
3. **Boundary と Scope の関係を定式化する**
4. **Guarantee Unit と Scope の違いを明確化する**
5. **Migration Unit と Scope の違いを明確化する**
6. **変更影響伝播の到達範囲として Scope を理論化する**
7. **Verification の射程として Scope を定義する**
8. **Closure / Completeness の観点から Scope の十分性を定義する**
9. **AST / CFG / DFG / Guarantee / Decision への Scope 対応を作る**

---

## 2. Phase6 の中心命題

Phase6 全体を貫く中心命題は以下とする。

> Scope とは、構造解析・保証評価・移行判断を適用するために採用される、有界な意味的対象領域である。

この定義により、Scope は単なる「範囲」ではなく、  
以下を統合する理論対象となる。

- 構文的範囲
- 制御的範囲
- データ的範囲
- 依存的範囲
- 保証適用範囲
- 検証範囲
- 移行判断範囲

---

## 3. Phase6 の成果物

`60_scope/` には以下の10ファイルを作成する。

```text
60_scope/
  01_Scope-Core-Definition.md
  02_Scope-Taxonomy.md
  03_Scope-Boundary-Model.md
  04_Scope-Composition-and-Containment.md
  05_Scope-vs-Guarantee-Unit.md
  06_Scope-vs-Migration-Unit.md
  07_Impact-Scope-and-Propagation.md
  08_Verification-Scope.md
  09_Scope-Closure-and-Completeness.md
  10_Scope-Mapping-to-AST-CFG-DFG.md