# Glossary 2. Structural Analysis Layer

This document defines concepts related to the parsing and structural modeling of code.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **AST (Abstract Syntax Tree)** | Syntax | ソースコードの構文構造を木構造として表現したもの。括弧や区切り文字などの不要なトークンを取り除き、構文の意味的な階層のみを保持する。 | Tree $T = (V, E)$ where $V$ are syntax nodes and $E$ represent containment. | [[CST]], [[IR]] |
| **IR (Intermediate Representation)** | Structure / Semantic | 言語依存のASTと、解析用のグラフ構造の中間に位置する、分析に最適化された表現形式。（定義待ち） | N/A | [[AST]], [[CFG]] |
| **CFG (Control Flow Graph)** | Structure | プログラム内の実行パス（制御の流れ）を有向グラフとして表現したもの。ノードは基本ブロック（Basic Block）、エッジは制御の遷移を表す。 | Graph $G = (V, E, s, t)$ where $V$ are basic blocks, $E \subseteq V \times V$ are jumps. | [[Basic Block]], [[DFG]] |
| **DFG (Data Flow Graph)** | Structure | データの依存関係（定義と使用）を有向グラフとして表現したもの。ある変数の値がどこで生成され、どこで使われるかを追跡する。 | Graph $G = (V, E)$ where $V$ are operations/variables, $E$ represent data dependency. | [[CFG]], [[Variable Scope]] |
