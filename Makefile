# Copyright 2015 Ovidiu Gheorghies
# Licensed under the Apache License, Version 2.0.

release:
	make -C manual
	cp manual/*.pdf .
	gnutar -cvzf metauml.tgz src --transform s/src/metauml/

clean:
	rm *.pdf
	rm *.tgz

.PHONY: release clean

