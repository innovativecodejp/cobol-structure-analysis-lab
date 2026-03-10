# Glossary 2. Structural Analysis Layer

This document defines concepts related to the parsing and structural modeling of code.

---

## AST (Abstract Syntax Tree)

**Layer**: Syntax
**Status**: Defined

**Definition**:
ソースコードの構文構造を木構造として表現したもの。括弧や区切り文字などの不要なトークンを取り除き、構文の意味的な階層のみを保持する。

**Formal Description**:
Tree $T = (V, E)$ where $V$ are syntax nodes and $E$ represent containment.

**Related Concepts**: CST, IR

**Example**:
`IF A = B` 文は、`IfStatement` ノードとその子ノード `Condition`, `ThenBlock` で表現される。

---

## IR (Intermediate Representation)

**Layer**: Structure / Semantic
**Status**: Placeholder

**Definition**:
(定義待ち: 言語依存のASTと、解析用のグラフ構造の中間に位置する、分析に最適化された表現形式)

**Related Concepts**: AST, CFG

---

## CFG (Control Flow Graph)

**Layer**: Structure
**Status**: Defined

**Definition**:
プログラム内の実行パス（制御の流れ）を有向グラフとして表現したもの。ノードは基本ブロック（Basic Block）、エッジは制御の遷移を表す。

**Formal Description**:
Graph $G = (V, E, s, t)$ where $V$ are basic blocks, $E \subseteq V \times V$ are jumps.

**Related Concepts**: Basic Block, DFG

**Example**:
`PERFORM` や `GOTO` によるジャンプ構造をグラフ化する。

---

## DFG (Data Flow Graph)

**Layer**: Structure
**Status**: Defined

**Definition**:
データの依存関係（定義と使用）を有向グラフとして表現したもの。ある変数の値がどこで生成され、どこで使われるかを追跡する。

**Formal Description**:
Graph $G = (V, E)$ where $V$ are operations/variables, $E$ represent data dependency.

**Related Concepts**: CFG, Variable Scope

**Example**:
`MOVE A TO B` において、`A` から `B` へのデータフローエッジが存在する。
