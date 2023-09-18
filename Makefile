# Website Makefile

JEKYLL_CMD=docker run --rm --name jekyll -it -v $$PWD:/srv/jekyll iandennismiller/jekyll:latest

help:
	@echo The following makefile targets are available:
	@echo
	@grep -h -e '^\w\S\+\:' Makefile _dev/*.mk | sed 's/://g' | cut -d ' ' -f 1

publish: clean build
	rsync -av --delete --checksum --exclude .git _site/ _gh-pages/
	cd _gh-pages && git add -A && git commit -am "automatic publish" && git push
	@echo ok

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
