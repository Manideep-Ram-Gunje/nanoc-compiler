# nanoC Compiler Front-End

A two-stage compiler front-end for **nanoC**, a scoped subset of the **ISO/IEC 9899:1999 (C99)** specification, implemented in C using **Flex** and **Yacc/Bison**.

The project covers:

- **Lexical analysis** — tokenization, identifier symbol-table construction, line-numbered output, comments, constants, operators, and lexical error reporting.
- **Syntax analysis** — grammar-based parsing of expressions, declarations, initializers, compound statements, selection/iteration statements, and jump statements.

## Pipeline

```text
nanoC source
     │
     ▼
┌───────────────┐
│ Flex Lexer    │
└───────┬───────┘
        │
        ├── Tokens
        ├── Line numbers
        └── Symbol table
        │
        ▼
┌───────────────┐
│ Yacc Parser   │
└───────┬───────┘
        │
        ▼
  Syntax validation
```

## Features

### Lexer

The lexer recognizes the nanoC lexical grammar, including:

- Keywords and identifiers
- Integer, floating-point, and character constants
- String literals
- Operators and punctuators
- Single-line and multi-line comments
- Identifier symbol table
- Line-numbered token output
- Lexical error reporting

### Parser

The parser extends the lexer with a Yacc/Bison grammar covering:

- Arithmetic, relational, equality, bitwise, and logical expressions
- Conditional and assignment expressions
- Declarations and declarators
- Parameters and identifier lists
- Initializers
- Compound statements
- `if` / `else`
- `while`, `do-while`, and `for`
- `break`, `continue`, and `return`
- Labels, `case`, and `default`

## Repository Structure

```text
nanoc-compiler/
├── README.md
├── lexer/
│   ├── a3_230101044.l
│   ├── a3_230101044_test.nc
│   ├── a3_230101044_token.txt
│   ├── a3_230101044_st (1).txt
│   ├── Makefile
│   └── readme.md
└── parser/
    ├── a4_230101044.l
    ├── a4_230101044.y
    ├── a4_230101044_test.nc
    ├── Makefile
    └── README.md
```

Generated parser/lexer files such as `lex.yy.c`, `y.tab.c`, and `y.tab.h` are build artifacts produced by the toolchain.

## Running

### Lexer

```bash
cd lexer
make
./a.out < a3_230101044_test.nc
```

Or:

```bash
flex a3_230101044.l
gcc lex.yy.c -lfl
./a.out < a3_230101044_test.nc
```

### Parser

```bash
cd parser
make
./parser < a4_230101044_test.nc
```

Or:

```bash
flex a4_230101044.l
yacc -d a4_230101044.y
gcc lex.yy.c y.tab.c
./a.out < a4_230101044_test.nc
```

## Example

A nanoC test program is processed as:

```text
Source Program
      ↓
Lexical Analysis
      ↓
Tokens + Symbol Table
      ↓
Syntax Analysis
      ↓
Valid / Invalid nanoC Program
```

The repository includes test inputs and sample lexer outputs so the intermediate results can be inspected directly.

## Toolchain

| Tool | Purpose |
|---|---|
| C | Implementation |
| Flex | Lexical analysis |
| Yacc / Bison | Syntax analysis |
| GCC | Compilation |
| Make | Build automation |

## Course

**Implementation of Programming Languages Lab — CS348**  
Indian Institute of Technology Guwahati

## Author

**Manideep Ram Gunje**  
B.Tech. Computer Science and Engineering, IIT Guwahati

[GitHub](https://github.com/Manideep-Ram-Gunje)
