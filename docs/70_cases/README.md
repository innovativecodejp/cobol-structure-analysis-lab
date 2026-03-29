# `70_cases`

Phase 7: Cases の文書群です。

`70_cases` は、`10_ast` `50_guarantee` `60_decision` および `60_scope` を前提として、
**Case を構造的判断単位として記述・分類・比較・検証するための適用層** を与えます。

## Documents

- `01_Cases-Core-Definition.md`
- `02_Cases-Taxonomy.md`
- `03_Cases-Description-Template.md`
- `04_Cases-Structural-Pattern-Model.md`
- `05_Cases-vs-Guarantee.md`
- `06_Cases-vs-Decision.md`
- `07_Cases-Comparison-and-Ordering.md`
- `08_Cases-Impact-and-Propagation.md`
- `09_Cases-Verification-Strategy.md`
- `10_Cases-Mapping-to-AST-CFG-DFG-Guarantee-Decision.md`

## Notes

- `Case` は単なる事例ではなく、**構造観測・保証要求・移行判断を束ねる判断検証単位** として扱う。
- 各文書は、定義、分類、記述様式、構造パターン、Guarantee / Decision 接続、比較、影響、検証、モデル横断写像へ段階的に接続する。
- `70_cases` は独立したケース集ではなく、研究全体の **適用層 / 接続層 / 検証層** として位置づけられる。