# nanoC Compiler Front-End

A two-stage compiler front-end for **nanoC**, a deliberately scoped subset of the **ISO/IEC 9899:1999 (C99)** language specification.

This repository brings together two sequential assignments from the IIT Guwahati **Implementation of Programming Languages Lab (CS348)**:

- **Assignment 3 — Lexer for nanoC:** converts source text into line-numbered tokens, maintains an identifier symbol table, and reports lexical errors.
- **Assignment 4 — Parser for nanoC:** builds on the lexer with a Yacc/Bison grammar covering expressions, declarations, statements, and the corresponding C99-style syntax.

The project is intentionally split into `lexer/` and `parser/` so that the progression from **characters → tokens → grammatical structure** is easy to inspect.

---

## What this project actually does

Given a nanoC source file, the front-end processes it in two stages:

```text
                    nanoC source
                         │
                         ▼
              ┌─────────────────────┐
              │   Lexical Analysis  │
              │       Flex          │
              └──────────┬──────────┘
                         │
            ┌────────────┼────────────┐
            ▼            ▼            ▼
         Tokens     Line numbers   Symbol table
            │
            ▼
              ┌─────────────────────┐
              │    Syntax Analysis  │
              │    Yacc / Bison     │
              └──────────┬──────────┘
                         │
                         ▼
                 Syntax validation
```

The lexer recognizes nanoC keywords, identifiers, constants, string literals, punctuators, comments, and operators. It also records identifiers in a symbol table and reports errors with the relevant line information.

The parser then applies the nanoC phrase-structure grammar to validate expressions, declarations, initializers, compound statements, selection/iteration statements, and jump statements.

---

## Repository structure

```text
nanoc-compiler/
├── README.md
│
├── lexer/
│   ├── a3_230101044.l
│   ├── a3_230101044_test.nc
│   ├── a3_230101044_token.txt
│   ├── a3_230101044_st (1).txt
│   ├── Makefile
│   └── readme.md
│
└── parser/
    ├── a4_230101044.l
    ├── a4_230101044.y
    ├── a4_230101044_test.nc
    ├── Makefile
    └── README.md
```

Generated files such as `lex.yy.c`, `y.tab.c`, `y.tab.h`, and the compiled parser are build artifacts produced by the toolchain and can be regenerated from the source specifications.

---

## Stage 1 — Lexical Analysis

**Directory:** [`lexer/`](./lexer)

Assignment 3 implements the lexical specification of nanoC using **Flex**.

### Implemented

- Keyword recognition
- Identifier recognition
- Integer, floating-point and character constants
- String literals
- NanoC punctuators and operators
- Single-line and multi-line comments
- Identifier symbol-table construction
- Line-numbered token output
- Lexical error reporting
- Reproducible builds through a Makefile
- Test input covering the defined lexical rules

The assignment specifically requires the lexer to emit a token stream and maintain a symbol table for identifiers.

### Running the lexer

```bash
cd lexer
make
./a.out < a3_230101044_test.nc
```

The lexer can also be generated directly with Flex and compiled using GCC:

```bash
flex a3_230101044.l
gcc lex.yy.c -lfl
./a.out < a3_230101044_test.nc
```

---

## Stage 2 — Syntax Analysis

**Directory:** [`parser/`](./parser)

Assignment 4 extends the nanoC front-end from tokens to grammar-driven syntax analysis using **Yacc/Bison**.

The grammar covers major C-style constructs including:

- Primary and postfix expressions
- Unary and multiplicative expressions
- Additive and shift expressions
- Relational and equality expressions
- Bitwise and logical expressions
- Conditional expressions
- Assignment expressions
- Declarations and declarators
- Function-style parameter lists
- Initializers
- Compound statements
- `if` / `else`
- `while`, `do-while`, and `for`
- `break`, `continue`, and `return`
- Labels and `case` / `default` statements

The parser reuses the lexical stage and is tested through a nanoC input designed to exercise the grammar.

### Running the parser

```bash
cd parser
make
./parser < a4_230101044_test.nc
```

Or, following the assignment toolchain:

```bash
flex a4_230101044.l
yacc -d a4_230101044.y
gcc lex.yy.c y.tab.c
./a.out < a4_230101044_test.nc
```

---

## Why the two assignments belong together

Assignment 3 and Assignment 4 are not unrelated exercises.

The lexer defines **what the source text is made of**.

The parser defines **how those tokens are allowed to form a program**.

That makes the repository a small but complete example of the first two major stages of a compiler front-end:

```text
Source characters
      ↓
Lexical structure
      ↓
Tokens + symbol information
      ↓
Syntactic structure
      ↓
Accepted / rejected nanoC program
```

Keeping both stages in the same repository also makes the evolution of the implementation visible: the parser is not a standalone grammar experiment; it sits directly on top of the lexical specification.

---

## Toolchain

| Component | Used for |
|---|---|
| C | Implementation language |
| Flex | Lexical analysis |
| Yacc / Bison | Syntax analysis |
| GCC | Compilation |
| Make | Build automation |
| Linux / Unix shell | Build and execution environment |

---

## Language scope

The language is **nanoC**, a restricted subset derived from the lexical and phrase-structure specifications of **ISO/IEC 9899:1999 (C99)**.

This is therefore **not a full C compiler**. The scope is intentionally limited to the grammar and lexical constructs specified by the course assignments.

---

## Example workflow

A typical development cycle is:

```text
1. Write a nanoC test program
             ↓
2. Run the Flex lexer
             ↓
3. Inspect generated tokens / symbol table
             ↓
4. Feed the token stream into the parser
             ↓
5. Check whether the source conforms to nanoC grammar
```

For debugging, the repository includes the assignment-specific test inputs and the generated lexer/parser artifacts needed to inspect the complete pipeline.

---

## Course context

**Implementation of Programming Languages Lab — CS348**  
Indian Institute of Technology Guwahati

This repository contains coursework implementations for:

- Assignment 3 — Lexer for nanoC
- Assignment 4 — Parser for nanoC

---

## Author

**Manideep Ram Gunje**  
B.Tech. Computer Science and Engineering, IIT Guwahati

GitHub: [@Manideep-Ram-Gunje](https://github.com/Manideep-Ram-Gunje)

---

## Notes

The assignment specifications are kept inside the respective project directories for reference. Build outputs are reproducible from the `.l`, `.y`, test-input, and Makefile sources.

If the repository is being used as a portfolio project, the most useful files to inspect first are:

```text
lexer/a3_230101044.l
parser/a4_230101044.y
lexer/a3_230101044_test.nc
parser/a4_230101044_test.nc
```

