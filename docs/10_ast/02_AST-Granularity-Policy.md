# 02_AST-Granularity-Policy

# 1. 粒度決定の方針

ASTにおけるノードの粒度（Granularity）は、**「構文の安定性」**と**「IR変換の容易性」**のバランスを基準に決定する。
過剰な分解は後続の解析を複雑化させるため、原則として**「1文＝1ノード」**の原則を守り、構文糖衣による差異を吸収する。

# 2. 基本原則

1.  **構文単位の維持**: COBOLの構文定義（Syntax Rule）に対応する粒度でノードを構成する。
2.  **意味展開の禁止**: 意味的等価性に基づく構造変換（Lowering）はIR層の責務とし、ASTでは行わない。
3.  **副作用分解の禁止**: 1つの命令が複数の副作用を持つ場合でも、AST上では単一のStatementNodeとして保持する。
4.  **単一責務**: 各ノード種別は単一の構文的役割を持つ。

# 3. Statement粒度の定義

| COBOL構文 | ASTノード種別 | 分解方針（AST vs IR） |
| :--- | :--- | :--- |
| `MOVE A TO B` | `AssignStatementNode` | 単一代入として扱う。 |
| `ADD A TO B` | `ComputeStatementNode` | 演算と代入をセットで保持する。IRで `Temp = A + B; B = Temp` に展開する。 |
| `IF cond ... END-IF` | `BranchStatementNode` | 条件式とBlockを保持する。制御フロー分解は行わない。 |
| `PERFORM ...` | `LoopStatementNode` | ループ条件とBody（またはCall先）を保持する。 |
| `READ ... AT END` | `IOStatementNode` | I/O操作と例外ハンドラ（`AT END`節）を1ノード内に保持する。IRで条件分岐に展開する。 |
| `CALL ...` | `CallStatementNode` | 呼び出しと引数を保持する。 |

# 4. 特殊なケースの粒度

## 4.1 分解しない対象（ASTで保持するもの）
以下の構造は、AST段階では分解せず、単一の構造として保持する。

- **MOVE CORRESPONDING**: 複数の `MOVE` 文への展開は行わない。
- **READ ... AT END**: 正常系と異常系（`AT END`）の分岐を1つのノード内にカプセル化する。
- **PERFORM THRU**: 開始段落と終了段落の範囲指定をそのまま属性として保持する。
- **COMPUTE 式**: 複雑な算術式（`A = B * (C + D)`）は、式ツリー（Expression Tree）として保持し、3番地コードへの分解は行わない。

## 4.2 IRで分解する対象（参考）
以下はASTからIRへ変換する際に分解・正規化される。

- `AT END` などの例外節 $\to$ 明示的な条件分岐（If/Switch）
- `INVALID KEY` $\to$ 明示的な条件分岐
- `MOVE CORRESPONDING` $\to$ 個別の `Assign` 命令列
- `COMPUTE` $\to$ 一連の演算命令列（Load/Store/Op）

# 5. 結論

ASTの粒度は **「ソースコードの記述構造を忠実に反映しつつ、構文解析の結果として安定した形式」** とする。
これにより、ソースコードとのトレーサビリティ（Traceability）を確保し、リファクタリングや変換後の検証を容易にする。
