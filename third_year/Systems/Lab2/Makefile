TARGET = $(source:.c=)

$(TARGET) : $(source)
	clang -Wall -Werror -g qtest.c $(source) -o $(TARGET)
