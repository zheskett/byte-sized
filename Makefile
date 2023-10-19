.PHONY: clean
CC := cmake
CFLAGS := -Wall

# Header Files
HDRS :=

# Source Files
SRCS := 

# Object files
OBJS := $(SRCS:.c=.o)

# Executable
EXEC := main


all: $(EXEC)

clean:
	rm $(EXEC) $(OBJS)