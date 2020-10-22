SHELL = /bin/bash

PROGRAM = backlight-brightness
DESTDIR = ~/.local

.PHONY: all
all: static test

.PHONY: install
install: $(PROGRAM) static test
	install -m 0755 $(PROGRAM) $(DESTDIR)/bin

.PHONY: static
static: $(PROGRAM)
	shellcheck $<

.PHONY: test
test:
	make -C tests
