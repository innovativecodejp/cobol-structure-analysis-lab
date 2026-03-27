# `60_scope`

Phase 6: Scope Theory の文書群です。

## Documents

- `01_Scope-Core-Definition.md`
- `02_Scope-Taxonomy.md`
- `03_Scope-Boundary-Model.md`
- `04_Scope-Composition-and-Containment.md`
- `05_Scope-vs-Guarantee-Unit.md`
- `06_Scope-vs-Migration-Unit.md`
- `07_Impact-Scope-and-Propagation.md`
- `08_Verification-Scope.md`
- `09_Scope-Closure-and-Completeness.md`
- `10_Scope-Mapping-to-AST-CFG-DFG.md`

## Notes

- `Scope` は Phase 6 全体を通じて、三つ組 \( \langle T, B, P \rangle \) を基礎とする。
- `P` は単一固定の表現ではなく、AST / CFG / DFG / Guarantee / Decision などの各モデルでの読みを与える射影族として扱う。
- 各文書は、定義、差分、伝播、検証、完全性、モデル横断写像へと段階的に接続する。