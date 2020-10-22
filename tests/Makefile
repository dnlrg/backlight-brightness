SHELL = /bin/bash

.PHONY: all
all: static test

.PHONY: static
static:
	shellcheck test.sh

.PHONY: test
test:
	./test.sh ../backlight-brightness
