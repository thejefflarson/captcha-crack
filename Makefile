CFLAGS?=$(shell pkg-config --cflags fann)
LDLIBS?=$(shell pkg-config --libs fann)
CC?=clang

nn: nn.c

tn: tn.c

cnn: cnn.cc
	clang++ cnn.cc -o cnn -I./tiny-cnn/include -std=c++11 -lstdc++

process:
	ruby process.rb

generate: Generate.class
	cd kaptcha-read-only && ant && cd ..
	# rm ./out/*.png
	# rm ./test/*.png
	java -cp .:kaptcha-read-only/target/kaptcha--1.jar Generate

Generate.class: Generate.java
	javac Generate.java -cp .:kaptcha-read-only/target/kaptcha--1.jar

.PHONY: generate process