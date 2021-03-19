CFLAGS=-Wall -g
LDFLAGS=-lglfw -lGL -lm -lGLEW -lX11 -lGLU -DGLEW_STATIC

build: build/main.o build/vector.o build/glhelper.o build/events.o
	gcc $(CFLAGS) -o build/a.out build/main.o build/vector.o build/events.o build/glhelper.o $(LDFLAGS)
	chmod +x build/a.out

build/main.o: main.c
	gcc $(CFLAGS) -c main.c -o build/main.o $(LDFLAGS)
build/glhelper.o: glhelper.c
	gcc $(CFLAGS) -c glhelper.c -o build/glhelper.o $(LDFLAGS)
build/vector.o: vector.c
	gcc $(CFLAGS) -c vector.c -o build/vector.o $(LDFLAGS)
build/events.o: events.c
	gcc $(CFLAGS) -c events.c -o build/events.o $(LDFLAGS)
build/tests.o: tests.c
	gcc $(CFLAGS) -c tests.c -o build/tests.o $(LDFLAGS)
clean:
	find build -type f -not -name '.placeholder' -delete

run: build
	@echo build/a.out
	@echo ""
	@build/a.out

test: build/tests.o build/vector.o build/events.o
	gcc build/tests.o build/vector.o build/events.o -o build/tests
	chmod +x build/tests
	build/tests
