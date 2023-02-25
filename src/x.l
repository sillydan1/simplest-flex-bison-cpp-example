%{
#include "expr-parser.hpp"
#include "expr-scanner.hpp"
#undef YY_DECL
#define YY_DECL int expr::ExprScanner::yylex(expr::ExprParser::semantic_type* const lval, expr::ExprParser::location_type* loc)
using token = expr::ExprParser::token; // typedef to make return token::PLUS etc. prettier
#define yyterminate() return( token::END )
#define YY_NO_UNISTD_H // msvc2010 compatibility
#define YY_USER_ACTION loc->step(); loc->columns(yyleng);
%}

%option c++ noyywrap nodefault
%option yyclass="expr::ExprScanner" 
%option outfile="expr-scanner.cpp"

/* ============================================================================================================= */

dseq			([[:digit:]]+)
dseq_opt		({dseq}?)
frac			(({dseq_opt}"."{dseq})|{dseq}".")
exp				([eE][-+]?{dseq})
exp_opt			({exp}?)

integer			({dseq})

%%
%{
				// executed at the beginning of yylex
				yylval = lval;
%}

{integer}		yylval->emplace<long long>(strtoll(YYText(), nullptr, 10)); return ExprParser::token::INT;
"+"				return token::PLUS;
"-"				return token::MINUS;
"*"				return token::MULTIPLY;
"/"				return token::DIVIDE;
"%"				return token::MODULO;
"("				return token::LPAREN;
")"				return token::RPAREN;
\n				return token::EOL;
<<EOF>>			return token::YYEOF;
.				/* no action on unmatched input */

%%

/* ============================================================================================================= */


