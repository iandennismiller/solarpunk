# Website Makefile

-include _dev/docker.mk
-include _dev/jekyll.mk

help:
	@echo The following makefile targets are available:
	@echo
	@grep -h -e '^\w\S\+\:' Makefile _dev/*.mk | sed 's/://g' | cut -d ' ' -f 1

all: docker-clean docker-build publish
	@echo ok

publish:
	rsync -av --delete --checksum _site/ docs/
	git add docs
	git commit -am "automatic publish"
	git push

requirements:
	chmod 755 _bin/*
	_bin/requirements.sh

.PHONY: js
