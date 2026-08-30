%{
#include <stdio.h>
#include <string.h>

#define MAX 1000

char symbol_table[MAX][100];
int count = 0;

FILE *st_file;
FILE *token_file;

int exists(char *str) {
    for (int i = 0; i < count; i++) {
        if (strcmp(symbol_table[i], str) == 0)
            return 1;
    }
    return 0;
}

void insert(char *str) {
    if (!exists(str)) {
        strcpy(symbol_table[count], str);
        count++;
    }
}
%}

%option yylineno

%%

"break"     { fprintf(token_file, "<KEYWORD, break, %d>\n", yylineno); }
"default"   { fprintf(token_file, "<KEYWORD, default, %d>\n", yylineno); }
"return"    { fprintf(token_file, "<KEYWORD, return, %d>\n", yylineno); }
"void"      { fprintf(token_file, "<KEYWORD, void, %d>\n", yylineno); }
"case"      { fprintf(token_file, "<KEYWORD, case, %d>\n", yylineno); }
"float"     { fprintf(token_file, "<KEYWORD, float, %d>\n", yylineno); }
"short"     { fprintf(token_file, "<KEYWORD, short, %d>\n", yylineno); }
"double"    { fprintf(token_file, "<KEYWORD, double, %d>\n", yylineno); }
"char"      { fprintf(token_file, "<KEYWORD, char, %d>\n", yylineno); }
"for"       { fprintf(token_file, "<KEYWORD, for, %d>\n", yylineno); }
"signed"    { fprintf(token_file, "<KEYWORD, signed, %d>\n", yylineno); }
"while"     { fprintf(token_file, "<KEYWORD, while, %d>\n", yylineno); }
"else"      { fprintf(token_file, "<KEYWORD, else, %d>\n", yylineno); }
"unsigned"  { fprintf(token_file, "<KEYWORD, unsigned, %d>\n", yylineno); }
"long"      { fprintf(token_file, "<KEYWORD, long, %d>\n", yylineno); }
"Bool"      { fprintf(token_file, "<KEYWORD, Bool, %d>\n", yylineno); }
"continue"  { fprintf(token_file, "<KEYWORD, continue, %d>\n", yylineno); }
"if"        { fprintf(token_file, "<KEYWORD, if, %d>\n", yylineno); }
"static"    { fprintf(token_file, "<KEYWORD, static, %d>\n", yylineno); }
"do"        { fprintf(token_file, "<KEYWORD, do, %d>\n", yylineno); }
"int"       { fprintf(token_file, "<KEYWORD, int, %d>\n", yylineno); }


[0-9]+"."[0-9]+   { fprintf(token_file, "<CONSTANT, %s, %d>\n", yytext, yylineno); }
[0-9]+            { fprintf(token_file, "<CONSTANT, %s, %d>\n", yytext, yylineno); }


\"([^\\\n]|(\\.))*\" {
    fprintf(token_file, "<STRING_LITERAL, %s, %d>\n", yytext, yylineno);
}


[a-zA-Z_][a-zA-Z0-9_]* {
    insert(yytext);
    fprintf(token_file, "<IDENTIFIER, %s, %d>\n", yytext, yylineno);
}


"//".*                { /* ignore */ }
"/*"(.|\n)*?"*/"      { /* ignore */ }


"=="    { fprintf(token_file, "<PUNCTUATOR, ==, %d>\n", yylineno); }
"!="    { fprintf(token_file, "<PUNCTUATOR, !=, %d>\n", yylineno); }
"<="    { fprintf(token_file, "<PUNCTUATOR, <=, %d>\n", yylineno); }
">="    { fprintf(token_file, "<PUNCTUATOR, >=, %d>\n", yylineno); }
"++"    { fprintf(token_file, "<PUNCTUATOR, ++, %d>\n", yylineno); }
"--"    { fprintf(token_file, "<PUNCTUATOR, --, %d>\n", yylineno); }


"+"     { fprintf(token_file, "<PUNCTUATOR, +, %d>\n", yylineno); }
"-"     { fprintf(token_file, "<PUNCTUATOR, -, %d>\n", yylineno); }
"*"     { fprintf(token_file, "<PUNCTUATOR, *, %d>\n", yylineno); }
"/"     { fprintf(token_file, "<PUNCTUATOR, /, %d>\n", yylineno); }
"="     { fprintf(token_file, "<PUNCTUATOR, =, %d>\n", yylineno); }
";"     { fprintf(token_file, "<PUNCTUATOR, ;, %d>\n", yylineno); }
"\("    { fprintf(token_file, "<PUNCTUATOR, (, %d>\n", yylineno); }
"\)"    { fprintf(token_file, "<PUNCTUATOR, ), %d>\n", yylineno); }
"\{"    { fprintf(token_file, "<PUNCTUATOR, {, %d>\n", yylineno); }
"\}"    { fprintf(token_file, "<PUNCTUATOR, }, %d>\n", yylineno); }
","     { fprintf(token_file, "<PUNCTUATOR, ,, %d>\n", yylineno); }


[ \t\n]+    { /* ignore */ }


.   { fprintf(token_file, "<UNKNOWN, %s, %d>\n", yytext, yylineno); }

%%

int main() {
    token_file = fopen("a3_230101044_token.txt", "w");
    st_file = fopen("a3_230101044_st.txt", "w");

    if (!token_file || !st_file) {
        printf("Error opening file\n");
        return 1;
    }

    yylex();

    for (int i = 0; i < count; i++) {
        fprintf(st_file, "%s\n", symbol_table[i]);
    }

    fclose(token_file);
    fclose(st_file);
    return 0;
}