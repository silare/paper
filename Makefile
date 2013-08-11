CC=valac
CFLAGS=--pkg gtk+-3.0
SRC=src
SOURCES=$(SRC)/main.vala $(SRC)/paper_window.vala
BIN=/usr/bin
EXECUTABLE=paper

all:
	$(CC) $(CFLAGS) $(SOURCES) -o $(EXECUTABLE)
	
clean:
	rm -rf $(EXECUTABLE)
	
install:
	cp -f $(EXECUTABLE) /usr/bin

uninstall:
	rm /usr/bin/$(EXECUTABLE)
