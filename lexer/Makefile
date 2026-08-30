LEX = flex
CC = gcc
CFLAGS = -lfl
TARGET = lexer

all:
	$(LEX) a3_230101044.l
	$(CC) lex.yy.c $(CFLAGS) -o $(TARGET)

run:
	./$(TARGET) < a3_230101044_test.nc

clean:
	rm -f lex.yy.c $(TARGET) a3_230101044_token.txt a3_230101044_st.txt