# 2. Structural Analysis Layer

## AST (Abstract Syntax Tree)

**Layer**: Syntax

**Definition**:
A tree representation of the abstract syntactic structure of source code. Each node of the tree denotes a construct occurring in the source code.

**Formal Description**:
$$ T = (N, E) $$
A rooted tree where $N$ are syntax nodes and $E$ are containment relationships.

**Related Concepts**:
- [[CFG]]
- [[Scope]]

**Example**:
A COBOL `IF` statement represented as a node with children for `condition`, `then-block`, and `else-block`.

---

## IR (Intermediate Representation)

**Layer**: Structure

**Definition**:
A data structure used internally by a compiler or analysis tool to represent source code. It is designed to be conducive to further processing, such as optimization or translation.

**Formal Description**:
N/A

**Related Concepts**:
- [[AST]]
- [[CFG]]

**Example**:
Three-address code or a standardized JSON representation of COBOL logic.

---

## CFG (Control Flow Graph)

**Layer**: Structure

**Definition**:
A directed graph representation of all paths that might be traversed through a program during its execution. Nodes represent basic blocks, and edges represent control flow paths.

**Formal Description**:
$$ G_{cfg} = (V, E, v_{entry}, v_{exit}) $$

**Related Concepts**:
- [[DFG]]
- [[Control Structure]]

**Example**:
A flowchart-like graph showing how execution jumps between paragraphs in a COBOL program.

---

## DFG (Data Flow Graph)

**Layer**: Structure

**Definition**:
A directed graph that represents the dependencies between variables and operations. It shows how data values propagate through the system.

**Formal Description**:
$$ G_{dfg} = (V, E) $$
Edges represent data dependencies (Definition-Use chains).

**Related Concepts**:
- [[CFG]]
- [[Data Dependency]]

**Example**:
A graph tracking how a value read from a file is computed and eventually written to a database.
