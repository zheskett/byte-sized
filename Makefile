.PHONY: clean
IDIR := ./include
SDIR := ./src
CC := gcc
CFLAGS := -I$(IDIR)

ODIR := out
EXEC := bytesized.exe
LIBS := -lglfw3 -lopengl32 -lgdi32

# Header Files
_HDRS := hello.h
HDRS := $(patsubst %,$(IDIR)/%,$(_DEPS))

# Object files
_OBJS := main.o glad.o
OBJS := $(patsubst %,$(ODIR)/%,$(_OBJS))

# Create object files
$(ODIR)/%.o: $(SDIR)/%.c $(HDRS)
	$(CC) -c -o $@ $< $(CFLAGS)

# Link
$(EXEC): $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

all: $(EXEC)

# Windows Specific - Change to rm for UNIX
clean:
	del $(ODIR)\*.o