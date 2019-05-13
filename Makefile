CFLAGS		= -g -DNETSNMP_ENABLE_IPV6 -fno-strict-aliasing -DNETSNMP_REMOVE_U64 -g -Udarwin18 -Ddarwin18=darwin18  -fno-common -DPERL_DARWIN -mmacosx-version-min=10.14 -fno-strict-aliasing -pipe -fstack-protector-strong -I/usr/local/include -DPERL_USE_SAFE_PUTENV  -I/usr/local/Cellar/perl/5.28.1/lib/perl5/5.28.1/darwin-thread-multi-2level/CORE -I.

SRC_DIR := .
OBJ_DIR := .
SRC_FILES := $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))

CC = /usr/local/bin/gcc-9

.SUFFIXES: .c
%.o: %.c
	$(CC) -I . $(CFLAGS) -c -o $@ $<

parse: $(OBJ_FILES)
	$(CC) $(LDFLAGS) -o $@ $^

.PHONY: clean
clean:
	rm *.o
