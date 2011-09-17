all: bridge.dylib

clean:
	rm -f bridge.dylib bridge.o

bridge.dylib: bridge.o
	ld -dylib -o bridge.dylib bridge.o -framework AppKit
