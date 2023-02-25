expr:
	flex src/x.l
	bison src/x.y
	g++ *.cpp src/main.cpp -I src -I . -o expr -std=c++20

clean:
	rm -rf expr-scanner.cpp expr-parser.cpp expr-parser.hpp location.hh expr

