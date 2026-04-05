# COBOL Structure Analysis Lab

## 概要 / Overview

**日本語**  
本リポジトリは **COBOL Structure Analysis Lab** の研究・記録用ワークスペースです。COBOL 資産の構造解析に関する理論整理と文書化を行い、必要に応じて解析を支援するプログラムの設計・実装も扱います。構文だけでなく AST・IR・CFG・DFG などの抽象モデルを積み上げ、移行可否判断や変更影響分析に使える **構造的根拠** を生成することを目的とします。

**English**  
This repository is the working space for **COBOL Structure Analysis Lab**. It supports research and documentation on structural analysis of COBOL assets, and—when needed—design and implementation of supporting tools. The goal is to build layered abstract models (AST, IR, CFG, DFG, and related judgment concepts) and produce **structural evidence** for migration feasibility and change-impact reasoning, not syntax-only description.

---

## 役割 / Role

**日本語**  
COBOL 資産の構造解析を通じて、移行判断のための基礎理論と抽象モデルを設計する研究環境です。

**English**  
A research environment focused on foundational theory and abstract models for migration decisions through structural analysis of COBOL assets.

---

## 目的 / Objectives

**日本語**

- `AST`、`IR`、`CFG`、`DFG` の設計・定義
- 構造抽出モデルの確立
- 制御構造・データ構造の抽象化
- 変更影響分析の理論的基盤の構築
- 移行可否判断に必要な構造的根拠の生成

**English**

- Design `AST`, `IR`, `CFG`, and `DFG`
- Establish structural extraction models
- Abstract control structures and data structures
- Build a theoretical basis for change impact analysis
- Generate structural evidence required for migration feasibility decisions

---

## 思考モード / Thinking Mode

**日本語**  
抽象化を優先し、モデル間の整合を重視します。図（例: Mermaid）による説明を前提とし、実装速度より設計の一貫性、技術詳細より構造、判断材料の生成を意識して記述します。

**English**  
Prioritize abstraction and model consistency. Assume diagram-first communication (e.g. Mermaid). Prefer design consistency over implementation speed; focus on structure rather than technology details; write with the intent of generating decision material.

---

## 研究上の基本姿勢 / Core Research Stance

**日本語**  
構文研究にとどまらず、構造が移行リスクにどう効くかを常に評価します。将来の仕様変更・保守コストへの影響を意識し、抽象レベル（構文層／構造層／判断層など）を明示します。

**English**  
Go beyond syntax-only study; constantly evaluate how structure affects migration risk. Anticipate impact on future specification changes and maintenance costs. Explicitly state abstraction levels (`Syntax Layer` / `Structure Layer` / `Decision Layer`).

---

## スコープ内 / In Scope

**日本語**  
AST ノード設計、IR 定義、制御構造の抽象化（`IF`、`EVALUATE`、`PERFORM` 等）、データ構造モデル（`WORKING-STORAGE`、`COPY` 等）、入れ子・依存の分析、変更影響モデル、リスク定義のための構造論的基盤。

**English**  
AST node design; IR definition; control structure abstraction (`IF`, `EVALUATE`, `PERFORM`, etc.); data structure modeling (`WORKING-STORAGE`, `COPY`, etc.); nested structure and dependency analysis; change impact analysis models; structural foundations for risk definition.

---

## スコープ外（厳密に分離）/ Out of Scope (Strict Separation)

**日本語**  
実装コードの細部（別プロジェクトへ）、価格・販売・エージェント戦略（別プロジェクトへ）、外向きコピー作成（別プロジェクトへ）。

**English**  
Detailed implementation code (redirect to Project 1); pricing, sales, or agent strategy (redirect to Project 3); external communication copywriting (redirect to Project 3).

---

## 境界ルール / Boundary Rules

**日本語**  
実装手法の議論は Project 1 へ、市場・収益・営業は Project 3 へ振り、本リポジトリでは抽象モデルの一貫性に研究を集中させます。

**English**  
If discussion shifts into implementation methods, redirect to Project 1. If it shifts into market, revenue, or sales, redirect to Project 3. Keep research focused on consistency of abstract models.

---

## 出力スタイル / Output Style

**日本語**  
概念整理 → モデル定義 → 図示 → 判断への接続。用語は先に定義し、抽象レベルを明示し、可能な限り構造図を添えます。

**English**  
Concept organization → model definition → diagramming → connection to decision-making. Define terms before using them; explicitly state abstraction level; provide structural diagrams whenever possible.

---

## リポジトリ構成 / Repository Structure

| Path | 日本語 | English |
|------|--------|---------|
| `docs/00_project/` | 憲章・ロードマップ | Charter and roadmap |
| `docs/10_ast/` | AST 設計成果物 | AST design artifacts |
| `docs/20_ir/` | IR 定義・写像メモ | IR definitions and mapping notes |
| `docs/30_cfg/` | CFG モデリングメモ | CFG modeling notes |
| `docs/40_dfg/` | DFG モデリングメモ | DFG modeling notes |
| `docs/50_guarantee/` | 移行保証理論 | Migration guarantee theory |
| `docs/90_glossary/` | 用語定義 | Terminology definitions |
| `docs/prompts/` | 研究ワークフロー用プロンプト資産 | Prompt assets for structured research workflow |
| `docs/prompts/research/exec/` | 実行可能プロンプト（研究ログ生成など） | Executable prompt definitions (e.g. research log generation) |
| `diagrams/mermaid/` | Mermaid ソース | Mermaid source diagrams |
| `log/` | 研究・日次メモのルート | Canonical logging root for research and memos |
| `log/research-log/` | 研究ログ・テンプレート | Research decision logs and templates |
| `log/working-log/` | 作業ログ | Daily working memos |
| `samples/cobol/` | 解析用 COBOL サンプル | COBOL input samples for analysis |
| `tools/` | ユーティリティ・補助ツール | Utilities and helper tooling |

---

*ChatGPT Project 名 **COBOL Structure Analysis Lab** に対応する作業リポジトリです。*  
*Working repository for the ChatGPT Project **COBOL Structure Analysis Lab**.*
