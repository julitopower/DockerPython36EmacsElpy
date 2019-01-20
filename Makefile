all:

.PHONY: build
build:
	docker build -t julitopower/python36emacs25elpy .

.PHONY: run
run:
	docker run -it --rm -v $(shell pwd):/opt/src/ julitopower/python36emacs25elpy /bin/bash
