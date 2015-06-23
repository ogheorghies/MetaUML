# Copyright 2015 Ovidiu Gheorghies
# Licensed under the Apache License, Version 2.0.

all: pdf

pdf:
	make -C fig
	latexmk -pdf metauml-manual.tex

clean:
	make -C fig clean
	latexmk -C

.PHONY: pdf all clean

