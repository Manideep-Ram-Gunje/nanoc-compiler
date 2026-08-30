/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    CONSTANT = 259,                /* CONSTANT  */
    STRING_LITERAL = 260,          /* STRING_LITERAL  */
    INT = 261,                     /* INT  */
    FLOAT = 262,                   /* FLOAT  */
    CHAR = 263,                    /* CHAR  */
    VOID = 264,                    /* VOID  */
    IF = 265,                      /* IF  */
    ELSE = 266,                    /* ELSE  */
    WHILE = 267,                   /* WHILE  */
    FOR = 268,                     /* FOR  */
    RETURN = 269,                  /* RETURN  */
    BREAK = 270,                   /* BREAK  */
    CONTINUE = 271,                /* CONTINUE  */
    DO = 272,                      /* DO  */
    PLUS = 273,                    /* PLUS  */
    MINUS = 274,                   /* MINUS  */
    STAR = 275,                    /* STAR  */
    DIV = 276,                     /* DIV  */
    MOD = 277,                     /* MOD  */
    INC = 278,                     /* INC  */
    DEC = 279,                     /* DEC  */
    ASSIGN = 280,                  /* ASSIGN  */
    PLUSEQ = 281,                  /* PLUSEQ  */
    MINUSEQ = 282,                 /* MINUSEQ  */
    MULEQ = 283,                   /* MULEQ  */
    DIVEQ = 284,                   /* DIVEQ  */
    MODEQ = 285,                   /* MODEQ  */
    ANDEQ = 286,                   /* ANDEQ  */
    OREQ = 287,                    /* OREQ  */
    XOREQ = 288,                   /* XOREQ  */
    SHLEQ = 289,                   /* SHLEQ  */
    SHREQ = 290,                   /* SHREQ  */
    EQ = 291,                      /* EQ  */
    NE = 292,                      /* NE  */
    LT = 293,                      /* LT  */
    GT = 294,                      /* GT  */
    LE = 295,                      /* LE  */
    GE = 296,                      /* GE  */
    AND = 297,                     /* AND  */
    OR = 298,                      /* OR  */
    BITAND = 299,                  /* BITAND  */
    BITOR = 300,                   /* BITOR  */
    XOR = 301,                     /* XOR  */
    NOT = 302,                     /* NOT  */
    TILDE = 303,                   /* TILDE  */
    SHL = 304,                     /* SHL  */
    SHR = 305,                     /* SHR  */
    QUESTION = 306,                /* QUESTION  */
    COLON = 307,                   /* COLON  */
    LPAREN = 308,                  /* LPAREN  */
    RPAREN = 309,                  /* RPAREN  */
    LBRACE = 310,                  /* LBRACE  */
    RBRACE = 311,                  /* RBRACE  */
    SEMICOLON = 312,               /* SEMICOLON  */
    COMMA = 313,                   /* COMMA  */
    LBRACKET = 314,                /* LBRACKET  */
    RBRACKET = 315,                /* RBRACKET  */
    CASE = 316,                    /* CASE  */
    DEFAULT = 317                  /* DEFAULT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define IDENTIFIER 258
#define CONSTANT 259
#define STRING_LITERAL 260
#define INT 261
#define FLOAT 262
#define CHAR 263
#define VOID 264
#define IF 265
#define ELSE 266
#define WHILE 267
#define FOR 268
#define RETURN 269
#define BREAK 270
#define CONTINUE 271
#define DO 272
#define PLUS 273
#define MINUS 274
#define STAR 275
#define DIV 276
#define MOD 277
#define INC 278
#define DEC 279
#define ASSIGN 280
#define PLUSEQ 281
#define MINUSEQ 282
#define MULEQ 283
#define DIVEQ 284
#define MODEQ 285
#define ANDEQ 286
#define OREQ 287
#define XOREQ 288
#define SHLEQ 289
#define SHREQ 290
#define EQ 291
#define NE 292
#define LT 293
#define GT 294
#define LE 295
#define GE 296
#define AND 297
#define OR 298
#define BITAND 299
#define BITOR 300
#define XOR 301
#define NOT 302
#define TILDE 303
#define SHL 304
#define SHR 305
#define QUESTION 306
#define COLON 307
#define LPAREN 308
#define RPAREN 309
#define LBRACE 310
#define RBRACE 311
#define SEMICOLON 312
#define COMMA 313
#define LBRACKET 314
#define RBRACKET 315
#define CASE 316
#define DEFAULT 317

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 10 "a4_230101044.y"

    char* str;

#line 195 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
