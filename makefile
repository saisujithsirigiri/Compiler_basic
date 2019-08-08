all:
	$(MAKE) grammar
	$(MAKE) lex
	g++ -std=gnu++11 -c grammar.tab.c lex.yy.c
	ar rvs lexgram.a grammar.tab.o lex.yy.o
	g++ -std=gnu++11 -Wall -Wextra main.cpp lexgram.a
	mv a.exe bin

grammar:
		bison -d grammar.y

lex:
	flex lex.l

run:
		$(MAKE) all
		./bin/a.exe <test/enter.code > compiled/main.cpp
		g++ compiled/main.cpp -o compiled/main.exe
		./compiled/main.exe
