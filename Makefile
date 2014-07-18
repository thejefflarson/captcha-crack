CFLAGS?=$(shell pkg-config --cflags fann)
LDLIBS?=$(shell pkg-config --libs fann)
CC?=clang

nn: nn.c
tn: tn.c

process:
	ruby process.rb

samples:
	ruby samples.rb

test:
	ruby test.rb

.PHONY: generate process