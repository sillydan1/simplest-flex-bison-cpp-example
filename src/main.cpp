#include <iostream>
#include "expr-scanner.hpp"
#include "expr-parser.hpp"

int main(int argc, char** argv) {
	expr::ExprScanner scanner{std::cin, std::cerr};
	expr::ExprParser parser{scanner};
	std::cout.precision(10);
	parser.parse();
	return 0;
}

