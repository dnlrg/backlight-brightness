SHELL = /bin/bash

PROGRAM = backlight-brightness
DESTDIR = ~/.local

.PHONY: all
all: check

.PHONY: install
install: $(PROGRAM) test
	install -m 0755 $(PROGRAM) $(DESTDIR)/bin

.PHONY: test
test: $(PROGRAM)
	shellcheck $<

.PHONY: check
check: test
