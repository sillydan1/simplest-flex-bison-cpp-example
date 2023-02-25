#ifndef EXPR_SCANNER_HPP
#define EXPR_SCANNER_HPP
#if ! defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

#include "expr-parser.hpp"
#include "location.hh"

namespace expr {
	class ExprScanner : public yyFlexLexer {
	public:
		ExprScanner(std::istream& arg_yyin, std::ostream& arg_yyout)
			: yyFlexLexer{arg_yyin, arg_yyout} {}
		ExprScanner(std::istream* arg_yyin = nullptr, std::ostream* arg_yyout = nullptr)
			: yyFlexLexer{arg_yyin, arg_yyout} {}
		virtual ~ExprScanner() = default;
		virtual int yylex(ExprParser::semantic_type* const lval, ExprParser::location_type* location);
	private:
		ExprParser::semantic_type* yylval = nullptr;	
	};
}

#endif

