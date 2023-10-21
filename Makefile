.PHONY: clean
.PHONY: all
.PHONY: debug
.PHONY: final

# Directories
IDIR := include
SDIR := src
ODIR := out

# Compiler Settings
CC := gcc
CFLAGS = -I$(IDIR) -Wall -Werror
DEBUG_CFLAGS := -g
OPTIMIZE_CFLAGS := -O3 -mwindows

LIBS := -lglfw3 -lopengl32 -lgdi32

# Executable name
EXEC := bytesized.exe

# Header Files
HDRS := $(wildcard $(IDIR)/*.h)

# Source Files
SRCS := $(wildcard $(SDIR)/*.c)

# Object files
OBJS := $(patsubst $(SDIR)/%,$(ODIR)/%,$(patsubst %.c,%.o, $(SRCS)))

# Create object files
$(ODIR)/%.o: $(SDIR)/%.c $(HDRS)
	$(CC) $(CFLAGS) -c -o $@ $<

# Link
$(EXEC): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)

all: $(EXEC)

final: CFLAGS += $(OPTIMIZE_CFLAGS)
final: clean $(EXEC)

debug: CFLAGS += $(DEBUG_CFLAGS)
debug: $(EXEC)

print:
	@echo Headers: $(HDRS)
	@echo Sources: $(SRCS)
	@echo Objects: $(OBJS)
	@echo CFLAGS:  $(CFLAGS)
	@echo DEBUG:   $(DEBUG_CFLAGS)
	@echo OPTIMIZ: $(OPTIMIZE_CFLAGS)

# Windows Specific - Change to rm for UNIX
clean:
	del $(ODIR)\*.o
	del $(EXEC)