%{
#include "y.tab.h"
#include <string.h>
%}

%option noyywrap
%option yylineno

DIGIT      [0-9]
ID         [a-zA-Z_][a-zA-Z0-9_]*
FLOATNUM   {DIGIT}+\.{DIGIT}+
INTNUM     {DIGIT}+

%%

"int"       { return INT; }
"float"     { return FLOAT; }
"char"      { return CHAR; }
"void"      { return VOID; }
"if"        { return IF; }
"else"      { return ELSE; }
"while"     { return WHILE; }
"for"       { return FOR; }
"return"    { return RETURN; }
"break"     { return BREAK; }
"continue"  { return CONTINUE; }
"do"        { return DO; }
"case"      { return CASE; }
"default"   { return DEFAULT; }

"=="        { return EQ; }
"!="        { return NE; }
"<="        { return LE; }
">="        { return GE; }
"&&"        { return AND; }
"||"        { return OR; }

"+="        { return PLUSEQ; }
"-="        { return MINUSEQ; }
"*="        { return MULEQ; }
"/="        { return DIVEQ; }
"%="        { return MODEQ; }

"&="        { return ANDEQ; }
"|="        { return OREQ; }
"^="        { return XOREQ; }

"<<="       { return SHLEQ; }
">>="       { return SHREQ; }

"<<"        { return SHL; }
">>"        { return SHR; }

"++"        { return INC; }
"--"        { return DEC; }

"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return STAR; }
"/"         { return DIV; }
"%"         { return MOD; }

"="         { return ASSIGN; }
"<"         { return LT; }
">"         { return GT; }
"!"         { return NOT; }

"&"         { return BITAND; }
"|"         { return BITOR; }
"^"         { return XOR; }
"~"         { return TILDE; }

"?"         { return QUESTION; }
":"         { return COLON; }

";"         { return SEMICOLON; }
","         { return COMMA; }
"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
"["         { return LBRACKET; }
"]"         { return RBRACKET; }

{FLOATNUM}  { yylval.str = strdup(yytext); return CONSTANT; }
{INTNUM}    { yylval.str = strdup(yytext); return CONSTANT; }

\"([^\\\"]|\\.)*\"   { yylval.str = strdup(yytext); return STRING_LITERAL; }

{ID}        { yylval.str = strdup(yytext); return IDENTIFIER; }

[ \t\r\n]+  ;

"//".*      ;
"/*"([^*]|\*+[^*/])*\*+"/" ;

.           { printf("Unknown token: %s at line %d\n", yytext, yylineno); }

%%