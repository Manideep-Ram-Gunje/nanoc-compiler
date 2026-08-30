%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
extern int yylineno;
%}

%union {
    char* str;
}

%token <str> IDENTIFIER CONSTANT STRING_LITERAL

%token INT FLOAT CHAR VOID IF ELSE WHILE FOR RETURN BREAK CONTINUE DO
%token PLUS MINUS STAR DIV MOD
%token INC DEC
%token ASSIGN PLUSEQ MINUSEQ MULEQ DIVEQ MODEQ ANDEQ OREQ XOREQ SHLEQ SHREQ
%token EQ NE LT GT LE GE
%token AND OR
%token BITAND BITOR XOR NOT TILDE
%token SHL SHR
%token QUESTION COLON

%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COMMA
%token LBRACKET RBRACKET

%token CASE DEFAULT

%start program

%%

program:
    program external_declaration
    |
    ;

external_declaration:
    declaration
    | function_definition
    | statement
    ;

/* ---------- FUNCTION ---------- */

function_definition:
    type_specifier IDENTIFIER LPAREN parameter_list_opt RPAREN compound_statement
    ;

parameter_list_opt:
    parameter_list
    |
    ;

parameter_list:
    parameter_declaration
    | parameter_list COMMA parameter_declaration
    ;

parameter_declaration:
    type_specifier IDENTIFIER
    ;

/* ---------- DECLARATION ---------- */

declaration:
    type_specifier init_declarator_list SEMICOLON
    ;

init_declarator_list:
    init_declarator
    | init_declarator_list COMMA init_declarator
    ;

init_declarator:
    declarator
    | declarator ASSIGN expression
    ;

type_specifier:
    INT | FLOAT | CHAR | VOID
    ;

declarator:
    IDENTIFIER
    | declarator LBRACKET CONSTANT RBRACKET
    ;

/* ---------- STATEMENTS ---------- */

statement:
    labeled_statement
    | expression_statement
    | compound_statement
    | selection_statement
    | iteration_statement
    | jump_statement
    ;

labeled_statement:
    IDENTIFIER COLON statement
    | CASE CONSTANT COLON statement
    | DEFAULT COLON statement
    ;

expression_statement:
    expression_opt SEMICOLON
    ;

expression_opt:
    expression
    |
    ;

compound_statement:
    LBRACE program RBRACE
    ;

selection_statement:
    IF LPAREN expression RPAREN statement
    | IF LPAREN expression RPAREN statement ELSE statement
    ;

iteration_statement:
    WHILE LPAREN expression RPAREN statement
    | DO statement WHILE LPAREN expression RPAREN SEMICOLON
    | FOR LPAREN expression_opt SEMICOLON expression_opt SEMICOLON expression_opt RPAREN statement
    ;

jump_statement:
    RETURN expression_opt SEMICOLON
    | BREAK SEMICOLON
    | CONTINUE SEMICOLON
    ;

/* ---------- EXPRESSIONS ---------- */

expression:
    assignment_expression
    | expression COMMA assignment_expression
    ;

assignment_expression:
    conditional_expression
    | unary_expression ASSIGN assignment_expression
    | unary_expression PLUSEQ assignment_expression
    | unary_expression MINUSEQ assignment_expression
    ;

conditional_expression:
    logical_or_expression
    | logical_or_expression QUESTION expression COLON conditional_expression
    ;

logical_or_expression:
    logical_and_expression
    | logical_or_expression OR logical_and_expression
    ;

logical_and_expression:
    inclusive_or_expression
    | logical_and_expression AND inclusive_or_expression
    ;

inclusive_or_expression:
    exclusive_or_expression
    | inclusive_or_expression BITOR exclusive_or_expression
    ;

exclusive_or_expression:
    and_expression
    | exclusive_or_expression XOR and_expression
    ;

and_expression:
    equality_expression
    | and_expression BITAND equality_expression
    ;

equality_expression:
    relational_expression
    | equality_expression EQ relational_expression
    | equality_expression NE relational_expression
    ;

relational_expression:
    shift_expression
    | relational_expression LT shift_expression
    | relational_expression GT shift_expression
    | relational_expression LE shift_expression
    | relational_expression GE shift_expression
    ;

shift_expression:
    additive_expression
    | shift_expression SHL additive_expression
    | shift_expression SHR additive_expression
    ;

additive_expression:
    multiplicative_expression
    | additive_expression PLUS multiplicative_expression
    | additive_expression MINUS multiplicative_expression
    ;

multiplicative_expression:
    unary_expression
    | multiplicative_expression STAR unary_expression
    | multiplicative_expression DIV unary_expression
    | multiplicative_expression MOD unary_expression
    ;

postfix_expression:
    primary_expression
    | postfix_expression INC
    | postfix_expression DEC
    | postfix_expression LBRACKET expression RBRACKET
    | postfix_expression LPAREN argument_expression_list_opt RPAREN
    ;

argument_expression_list_opt:
    argument_expression_list
    |
    ;

argument_expression_list:
    assignment_expression
    | argument_expression_list COMMA assignment_expression
    ;

unary_expression:
    postfix_expression
    | INC unary_expression
    | DEC unary_expression
    | PLUS unary_expression
    | MINUS unary_expression
    | NOT unary_expression
    ;

primary_expression:
    IDENTIFIER
    | CONSTANT
    | STRING_LITERAL
    | LPAREN expression RPAREN
    ;

%%

void yyerror(const char *s) {
    printf("Error at line %d: %s\n", yylineno, s);
}

int main() {
    yyparse();
    printf("Parsing completed successfully\n");
    return 0;
}