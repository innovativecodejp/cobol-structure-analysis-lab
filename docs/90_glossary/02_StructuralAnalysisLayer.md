# Glossary 2. Structural Analysis Layer

This document defines concepts related to the parsing and structural modeling of code.

| Term | Layer | Definition | Formal Description | Related Concepts |
| :--- | :--- | :--- | :--- | :--- |
| **AST (Abstract Syntax Tree)** | Syntax | ソースコードの構文構造を木構造として表現したもの。括弧や区切り文字などの不要なトークンを取り除き、構文の意味的な階層のみを保持する。本研究では **観測層** として位置づけられる。 | Tree $T = (V, E, \lambda)$ where $V$ are syntax nodes, $E$ represent containment, $\lambda$ assigns node types. | [[IR]], [[CFG]], [[DFG]] |
| **IR (Intermediate Representation)** | Structure | AST と CFG/DFG の中間に位置し、**構造作用（制御・データ・境界）を再編成した中間構造**。言語依存の構文差異を吸収し、移行判断に必要な統一的な作用単位を与える。 | $IR = (U, \Sigma, \delta)$ where $U$ are IR units, $\Sigma$ are effect signatures, $\delta$ assigns effects. | [[AST]], [[CFG]], [[DFG]], [[Guarantee]] |
| **CFG (Control Flow Graph)** | Structure | プログラム内の **実効的に遷移しうる制御順序** を有向グラフとして表現したもの。ノードは基本ブロック、エッジは制御の遷移を表す。本研究では **制御到達と経路閉包の構造層** として位置づけられる。 | Graph $G = (V, E, s, t)$ where $V$ are basic blocks, $E \subseteq V \times V$ are control transitions. | [[Basic Block]], [[DFG]], [[Dominance]], [[Reachability]] |
| **DFG (Data Flow Graph)** | Structure | データの依存関係（定義と使用）を有向グラフとして表現したもの。本研究では **移行判断・変更影響分析・保証評価に接続可能なデータ依存モデル** として位置づけられる。 | Graph $G = (V, E, \tau)$ where $V$ are data elements, $E$ represent data dependency, $\tau$ assigns edge types. | [[CFG]], [[Define-Use]], [[Reaching Definition]], [[Impact Closure]] |
| **Structural Layer Stack** | Structure | 構文層（AST）→ 構造作用層（IR）→ 制御層（CFG）・データ層（DFG）→ 判断層（Guarantee/Scope/Decision）の積層構造。 | AST → IR → CFG/DFG → Guarantee/Scope/Decision | [[AST]], [[IR]], [[CFG]], [[DFG]] |
