# Assignment 3: Lexer for nanoC

## Student Details
- **Name:** Manideep Ram Gunje  
- **Roll Number:** 230101044  
- **Course:** CS348 - Implementation of Programming Languages Lab  
- **Institute:** IIT Guwahati  

---

## 📌 Overview

This assignment implements a lexical analyzer (lexer) for a subset of the C programming language, referred to as nanoC, using the Flex tool.

The lexer reads an input source file and:
- Identifies lexical tokens based on predefined rules
- Outputs tokens along with their lexeme and line number
- Maintains a symbol table for identifiers

---

## 📂 Files Included

| File Name | Description |
|----------|-------------|
| a3_230101044.l | Flex specification file (main implementation) |
| a3_230101044_token.txt | Output file containing tokens |
| a3_230101044_st.txt | Symbol table containing identifiers |
| a3_230101044_test.nc | Test input file |
| Makefile | Automates compilation |
| README.md | Documentation |

---

## ⚙️ Compilation Instructions

Using Makefile:
make

Manual Compilation:
flex a3_230101044.l
gcc lex.yy.c -lfl

---

## ▶️ Execution

Run the lexer using:
./a.out < a3_230101044_test.nc

This generates:
- a3_230101044_token.txt
- a3_230101044_st.txt

---

## 🔍 Token Format

Each token is printed in the format:
<TOKEN_TYPE, lexeme, line_number>

Example:
<KEYWORD, int, 1>
<IDENTIFIER, x, 1>
<PUNCTUATOR, =, 1>
<CONSTANT, 10, 1>

---

## 📊 Symbol Table

The symbol table stores all unique identifiers encountered in the source code.

Example:
x
y
s
t

---

## ✅ Features Implemented

- Recognition of:
  - Keywords
  - Identifiers
  - Integer and floating-point constants
  - String literals (with escape sequences)
  - Punctuators and operators
- Line number tracking using yylineno
- Symbol table creation without duplicates
- Ignoring:
  - Single-line comments (//)
  - Multi-line comments (/* ... */)
  - Whitespace

---

## 🧪 Test Coverage

The test file includes:
- Variable declarations
- Arithmetic expressions
- Conditional statements
- String literals with escape characters
- Increment operators
- Comments (single-line and multi-line)

---

## ⚠️ Assumptions and Limitations

- Symbol table stores only identifier names (no type or scope information)
- Limited support for all possible C punctuators
- Character constants are not explicitly handled
- Error handling is basic (unknown tokens reported)

---

## 🧠 Design Approach

- Regular expressions are used to define token patterns
- Flex rules match patterns and print tokens to the output file
- Identifiers are inserted into a symbol table using a simple lookup mechanism
- Input is processed sequentially using yylex()

---

## 🚀 Conclusion

The lexer successfully processes nanoC input and generates structured token output along with a symbol table. It demonstrates the use of lexical analysis techniques and tools such as Flex.

---

## 🔮 Future Improvements

- Add support for character constants
- Extend punctuator coverage
- Improve error reporting
- Enhance symbol table with additional attributes (type, scope, etc.)