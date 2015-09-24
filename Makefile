# it is a test
all:
	gcc -Wall -g src/hello.c src/math.c -o hello
clean:
	rm -f hello
