all:
	flex a4_230101044.l
	yacc -d a4_230101044.y
	gcc lex.yy.c y.tab.c -o parser

run:
	./parser < a4_230101044_test.nc

clean:
	rm -f lex.yy.c y.tab.c y.tab.h parser