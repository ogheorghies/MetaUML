# Copyright 2015 Ovidiu Gheorghies
# Licensed under the Apache License, Version 2.0.

.PHONY: docker-release release release-tgz clean

_UID=$(shell id -u)
TAG_NAME := $(or $(TAG_NAME),$(shell git describe --tags | rev | cut -f3- -d- | rev ))
TAG_NAME_NO_V := $(TAG_NAME:v%=%)
REVISION_ID := $(or $(REVISION_ID),$(shell git describe --tags | rev | cut -f-2 -d- | rev))
METAUML_RELEASE_DATE := $(shell date "+%B %d, %Y")

release:
	make -C manual
	if [ -d dist/metauml ]; then rm -rf dist/metauml; fi
	mkdir -p dist/metauml
	mkdir dist/metauml/doc
	mkdir dist/metauml/examples
	mkdir dist/metauml/inputs
	sed -e 's/METAUML_RELEASE_VERSION/$(TAG_NAME_NO_V)/' -e 's/METAUML_RELEASE_DATE/$(METAUML_RELEASE_DATE)/' ctan/README >dist/metauml/README
	cp manual/metauml-manual.pdf dist/metauml/doc/metauml-manual-$(TAG_NAME)-$(REVISION_ID).pdf
	cp src/*.mp dist/metauml/inputs
	cp -r manual dist/metauml/examples/
	find dist/metauml/examples/ -type f -not -name "*.mp" -not -name "*.tex" -not -name "*.bib" -exec rm {} +

release-tgz:
	[ -d dist/archive ] || mkdir -p dist/archive
	tar -C dist/ -cvf dist/archive/metauml-$(TAG_NAME)-$(REVISION_ID).tgz metauml

clean:
	echo "Not implemented"

docker-release:
	docker run -it --rm -eHOME -eUSER -u=$(_UID) \
		-v${HOME}:${HOME} \
		-v${PWD}/src:/usr/local/texlive/2017/texmf-dist/metapost/metauml \
		blang/latex:ctanfull \
		bash -c "cd ${PWD}; TAG_NAME=$(TAG_NAME) REVISION_ID=$(REVISION_ID) make release"
