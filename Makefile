# Website Makefile

JEKYLL_CMD=docker run --rm --name jekyll -it -v $$PWD:/srv/jekyll iandennismiller/jekyll:latest

help:
	@echo The following makefile targets are available:
	@echo
	@grep -h -e '^\w\S\+\:' Makefile _dev/*.mk | sed 's/://g' | cut -d ' ' -f 1

all: clean build publish
	@echo ok

publish:
	rsync -av --delete --checksum _site/ docs/
	git add docs
	git commit -m "automatic publish"
	git push

serve:
	docker run \
		--rm -it \
		--name jekyll \
		-v $$PWD:/srv/jekyll \
		-p 4000:4000 \
		iandennismiller/jekyll:latest \
		/bin/bash -c 'bundle exec jekyll serve --host 0.0.0.0'

clean:
	$(JEKYLL_CMD) /bin/bash -c 'bundle exec jekyll clean'

incremental: clean
	$(JEKYLL_CMD) /bin/bash -c 'JEKYLL_ENV=production bundle exec jekyll build --incremental'

build:
	$(JEKYLL_CMD) /bin/bash -c 'JEKYLL_ENV=production bundle exec jekyll build'

shell-docker:
	$(JEKYLL_CMD) /bin/bash

.PHONY: docs
