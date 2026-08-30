# Assignment 4: Parser for nanoC

## Student Details
Name: Manideep Ram Gunje  
Roll Number: 230101044  
Course: CS348 - Implementation of Programming Languages Lab  

---

## Overview

This assignment implements a parser for a subset of the C programming language (nanoC) using Bison (Yacc) and Flex.

The parser works with a lexical analyzer to check whether a given nanoC program follows the correct syntax based on the grammar provided in the assignment.

---

## Files Included

- a4_230101044.l → Flex specification (lexer)
- a4_230101044.y → Bison specification (parser)
- a4_230101044_test.nc → Test input file
- Makefile → Compilation and execution
- README.md → Documentation

---

## Features Implemented

### Expressions
- Arithmetic: + - * / %
- Relational: < > <= >=
- Equality: == !=
- Logical: && ||
- Bitwise: & | ^ ~
- Shift: << >>
- Conditional: ?:
- Assignment: = += -= *= /= %=

### Statements
- Expression statements
- Compound statements { }
- if, if-else
- while, for, do-while
- return, break, continue
- Labeled statements (label:, case, default)

### Declarations
- Variable declarations
- Multiple variables (int a, b)
- Arrays (int arr[5])
- Initialization (int x = 5)

### Functions
- Function definitions
- Parameter lists
- Function calls

---

## Compilation

Using Makefile:
make

---

## Execution

make run

or

./parser < a4_230101044_test.nc

---

## Output

If input is correct:
Parsing completed successfully

Otherwise, syntax errors are shown with line numbers.

---

## Design Approach

- Flex is used to tokenize the input.
- Bison is used to define grammar rules and parse the input.
- Operator precedence is handled using layered grammar rules.
- Optional grammar parts are handled using separate rules.

---

## Assumptions

- Only a subset of C (nanoC) is implemented.
- Advanced features like structs, pointers, etc. are not included.
- Error handling is basic.

---

## Conclusion

The parser successfully checks the syntax of nanoC programs and supports expressions, statements, declarations, and functions as required in the assignment.