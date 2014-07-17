CFLAGS?=$(shell pkg-config --cflags fann)
LDLIBS?=$(shell pkg-config --libs fann)
CC?=clang

nn: nn.c

tn: tn.c

process:
	ruby process.rb

generate: Generate.class
	# rm ./out/*.png
	# rm ./test/*.png
	java -cp .:lib/kaptcha--1.jar Generate

Generate.class: Generate.java
	javac Generate.java -cp .:lib/kaptcha--1.jar

.PHONY: generate process