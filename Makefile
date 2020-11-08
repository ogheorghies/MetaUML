# Copyright 2015 Ovidiu Gheorghies
# Licensed under the Apache License, Version 2.0.

.PHONY: docker-release release release-tgz clean
.DEFAULT_GOAL := docker-release

_UID=$(shell id -u)
TAG_NAME := $(or $(TAG_NAME),$(shell git describe --tags))

METAUML_RELEASE_VERSION := $(TAG_NAME:v%=%)
METAUML_RELEASE_DATE := $(shell date "+%B %d, %Y")

release:
	make -C manual
	if [ -d dist/metauml ]; then rm -rf dist/metauml; fi
	mkdir -p dist/metauml
	mkdir dist/metauml/doc
	mkdir dist/metauml/examples
	mkdir dist/metauml/inputs
	sed -e 's/METAUML_RELEASE_VERSION/$(METAUML_RELEASE_VERSION)/' -e 's/METAUML_RELEASE_DATE/$(METAUML_RELEASE_DATE)/' ctan/README >dist/metauml/README
	cp manual/metauml-manual.pdf dist/metauml/doc/metauml-manual-$(TAG_NAME).pdf
	cp src/*.mp dist/metauml/inputs
	cp -r manual dist/metauml/examples/
	find dist/metauml/examples/ -type f -not -name "*.mp" -not -name "*.tex" -not -name "*.bib" -exec rm {} +

release-archive: release
	[ -d dist/archive ] || mkdir -p dist/archive
	tar -C dist/ -cvf dist/archive/metauml-$(TAG_NAME).tgz metauml

clean:
	make -C manual clean

docker-release:
	(set -x; docker run -it --rm -eHOME -eUSER -u=$(_UID) \
		-eTAG_NAME=$(TAG_NAME) \
		-v${HOME}:${HOME} \
		-v${PWD}/src:/usr/local/texlive/2017/texmf-dist/metapost/metauml \
		blang/latex:ctanfull \
		bash -c "cd ${PWD}; MPINPUTS=${PWD}/src: make release-archive" )
