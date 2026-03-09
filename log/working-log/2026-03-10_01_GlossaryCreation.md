# 2026-03-10 Glossary Creation

## 1. Context
- Migration Geometry の概念が固まってきたため、用語集 (Glossary) の整備を開始した。
- 用語の定義、層 (Layer)、形式的記述 (Formal Description)、関連用語 (Related Concepts) を明確にする。

## 2. Changes
- Directory `docs/90_glossary/` created.
- `docs/90_glossary/README.md` created with file structure and format definition.
- `docs/90_glossary/05_GeometryOfMigration.md` created as the first glossary file.
  - Defined: Migration Geometry, Migration Distance, Migration Path, Shortest Migration Path, Migration Cost.
- Glossary format switched to Markdown Table for better readability.

## 3. Thoughts
- Table format is much cleaner for comparing terms and identifying missing definitions (e.g. placeholders).
- "Shortest Migration Path" is currently a placeholder awaiting the full Optimization Model formalization.
- Future glossaries should follow this table structure.

## 4. Next Steps
- Create `TermsAstIrCfgDfg.md` for Syntax/Structure layers.
- Create `TermsGuaranteeSpace.md` for Guarantee layer.
- Populate `Glossary.md` index.
