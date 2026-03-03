# COBOL Structure Analysis Lab

This repository is the working space for a ChatGPT Project named **COBOL Structure Analysis Lab**.
It is used to conduct and record research on structural analysis of COBOL assets and, when needed,
to design and implement supporting programs.

## Role

This project is a research environment focused on designing foundational theory and abstract models
for migration decisions through structural analysis of COBOL assets.

## Objectives

- Design `AST`, `IR`, `CFG`, and `DFG`
- Establish structural extraction models
- Abstract control structures and data structures
- Build a theoretical basis for change impact analysis
- Generate structural evidence required for migration feasibility decisions

## Thinking Mode

- Prioritize abstraction
- Emphasize model consistency
- Assume diagram-first communication (for example, Mermaid)
- Prefer design consistency over implementation speed
- Focus on structure rather than technology details
- Write with the intent of generating decision material

## Core Research Stance

- Go beyond syntax-only study
- Constantly evaluate how structure affects migration risk
- Anticipate impact on future specification changes and maintenance costs
- Explicitly state abstraction levels (`Syntax Layer` / `Structure Layer` / `Decision Layer`)

## In Scope

- AST node design
- IR definition
- Control structure abstraction (`IF`, `EVALUATE`, `PERFORM`, etc.)
- Data structure modeling (`WORKING-STORAGE`, `COPY`, etc.)
- Nested structure and dependency analysis
- Change impact analysis models
- Structural foundations for risk definition

## Out of Scope (Strict Separation)

- Detailed implementation code (redirect to Project 1)
- Pricing, sales, or agent strategy discussions (redirect to Project 3)
- External communication copywriting (redirect to Project 3)

## Boundary Rules

- If discussion shifts into implementation methods, redirect to Project 1
- If discussion shifts into market, revenue, or sales, redirect to Project 3
- Keep research focused on consistency of abstract models

## Output Style

- Concept organization -> Model definition -> Diagramming -> Connection to decision-making
- Define terms before using them
- Explicitly state abstraction level
- Provide structural diagrams whenever possible

## Repository Structure

- `docs/00_project/`: Charter and roadmap
- `docs/10_ast/`: AST design artifacts
- `docs/20_ir/`: IR definitions and mapping notes
- `docs/30_cfg/`: CFG modeling notes
- `docs/40_dfg/`: DFG modeling notes
- `docs/50_guarantee/`: Migration guarantee theory
- `docs/90_glossary/`: Terminology definitions
- `docs/prompts/`: Prompt assets for structured research workflow execution
- `docs/prompts/research/exec/`: Executable prompt definitions (for example, Research Log generation)
- `diagrams/mermaid/`: Mermaid source diagrams
- `log/`: Canonical logging root for research and daily memo records
- `log/research-log/`: Canonical research decision logs, templates, and governance notes
- `log/working-memo/`: Canonical daily working memos and memo governance notes
- `samples/cobol/`: COBOL input samples for analysis
- `tools/`: Utilities and helper tooling (future use)