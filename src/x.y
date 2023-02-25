%skeleton "lalr1.cc" /* -*- C++ -*- */
%require "3.2"
%defines "expr-parser.hpp"
%output "expr-parser.cpp"
%define api.parser.class { ExprParser }
%define api.namespace { expr }
%define api.value.type variant
%define parse.assert

%code requires {
    namespace expr {
        class ExprScanner;
    }
}

%parse-param { ExprScanner& scanner }

%code {
    #include <iostream>
    #include <string>
    #include <cmath>
    #include "expr-scanner.hpp"
    #undef yylex
    #define yylex scanner.yylex
}

%locations

/* ====================================================== */

%token              EOL LPAREN RPAREN
%token <long long>  INT

%nterm <long long>  iexp

%left               PLUS MINUS
%left               MULTIPLY DIVIDE MODULO
%precedence         UMINUS

%%

lines   : %empty
        | lines line
        ;

line    : EOL                       { std::cerr << "read an empty line\n"; }
        | iexp EOL                  { std::cout << $1 << std::endl; }
        | error EOL                 { yyerrok; }
        ;

iexp    : INT                       { $$ = $1; }
        | iexp PLUS iexp            { $$ = $1 + $3; }
        | iexp MINUS iexp           { $$ = $1 - $3; }
        | iexp MULTIPLY iexp        { $$ = $1 * $3; }
        | iexp DIVIDE iexp          { $$ = $1 / $3; }
        | iexp MODULO iexp          { $$ = $1 % $3; }
        | MINUS iexp %prec UMINUS   { $$ = -$2; }
        | LPAREN iexp RPAREN        { $$ = $2; }
        ;

%%

/* ====================================================== */

void expr::ExprParser::error(const location_type& l, const std::string& msg) {
    std::cerr << msg << " at " << l << std::endl;
}

