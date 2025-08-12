# Keys directory
KEYDIR = $$HOME/.u2fe-KEYS

# Compiler
CC = clang

# Flags
CFLAGS = -Wall -Wextra -std=c99 -pedantic
CFLAGS += -D_POSIX_C_SOURCE=200809L
LDFLAGS = -lcrypto

# Binary name
BIN = u2fe

# Files
SRC_FILES = \
	main.c crypto.c \
	device/device.c device/uhid.c device/event.c \
	u2f-hid/commands.c u2f-hid/message.c u2f-hid/transaction.c u2f-hid/packet.c \
	u2f-raw/raw_message.c u2f-raw/authenticate.c u2f-raw/register.c \
	utils/xalloc.c

SRC = $(addprefix src/, $(SRC_FILES))

OBJ = ${SRC:.c=.o}

all: patched release

patched: src/crypto.c_backup
	cp src/crypto.c src/crypto.c_backup
	sed -i "s@keys/@$(KEYDIR)/@" src/crypto.c
	cp src/crypto.c src/crypto.c_patched

debug: CFLAGS += -g3 -O0
debug: $(BIN)

release: CFLAGS += -Os
release: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $@
	sed -i "s@$(KEYDIR)/@keys/@" src/crypto.c

doc:
	doxygen

# Invoke as privileged user
install: release
	mkdir -p /usr/local/bin
	mv ./u2fe /usr/local/bin/

clean:
	$(RM) $(BIN)
	$(RM) $(OBJ)
	$(RM) $(TEST)
	$(RM) $(TEST_OBJ)

.PHONY: all release debug check-valgrind doc clean
