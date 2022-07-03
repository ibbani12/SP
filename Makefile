CC = g++
CPPFLAGS = -c -Wall
LDFLAGS = -lcppunit -lm
OBJ = obj/
SRC = src/
BIN = bin/
INCLUDE = inc/

all: app

app: $(OBJ)account.o $(OBJ)main.o
	$(CC) -o app $(OBJ)account.o $(OBJ)main.o
	mv app $(BIN) 

$(OBJ)main.o: $(SRC)main.cpp
	$(CC) $(CPPFLAGS) $(SRC)main.cpp -I $(INCLUDE)
	mv main.o $(OBJ)

$(OBJ)account.o: $(SRC)account.cpp
	$(CC) $(CPPFLAGS) $(SRC)account.cpp -I $(INCLUDE)
	mv account.o $(OBJ)




clean:
	rm -f a.out app *.o
	rm -f $(OBJ)*.o
	rm -f $(BIN)app