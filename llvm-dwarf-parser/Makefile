CXX = clang++

# Flags
CXXFLAGS = -g $(shell llvm-config --cxxflags)
LDFLAGS  = $(shell llvm-config --ldflags)
LIBS     = $(shell llvm-config --libs)

# Source and target
TARGET = llvm_elf_dwarf_parser
SRC = llvm_elf_dwarf_parser.cpp

# Default target
all: $(TARGET) run

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(LIBS) -o $(TARGET) $(SRC)

run: $(TARGET)
	./$(TARGET) $(TARGET)

# Clean target
clean:
	rm -f $(TARGET)
	rm -rf $(TARGET).dSYM

.PHONY: all run clean
