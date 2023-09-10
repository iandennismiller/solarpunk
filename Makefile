# Website Makefile

-include _dev/data.mk
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
	git add -A
	git commit -am "automatic publish"
	git push

install:
	rsync -acv --delete _site/ ~/www/

new:
	_bin/template.py

artwork:
	_bin/artwork.sh

js:
	java -jar ~/Library/Code/compiler.jar --js _site/js/main.js --js_output_file js/main.min.js

requirements:
	chmod 755 _bin/*
	_bin/requirements.sh

.PHONY: js
