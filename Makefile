SHELL = /bin/bash

PROGRAM = backlight-brightness
DESTDIR = ~/.local

.PHONY: all
all: static

.PHONY: install
install: $(PROGRAM) static
	install -m 0755 $(PROGRAM) $(DESTDIR)/bin

.PHONY: static
static: $(PROGRAM)
	shellcheck $<

.PHONY: check
check: test
