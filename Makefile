# Website Makefile

JEKYLL_CMD=docker run --rm --name jekyll -it -v $$PWD:/srv/jekyll
JEKYLL_PORT=-p 4000:4000
JEKYLL_IMAGE=iandennismiller/jekyll:latest

help:
	@echo The following makefile targets are available:
	@echo
	@grep -h -e '^\w\S\+\:' Makefile _dev/*.mk | sed 's/://g' | cut -d ' ' -f 1

serve:
	$(JEKYLL_CMD) $(JEKYLL_PORT) $(JEKYLL_IMAGE) \
		/bin/bash -c 'bundle exec jekyll serve --host 0.0.0.0'
clean:
	$(JEKYLL_CMD) $(JEKYLL_IMAGE) /bin/bash -c 'bundle exec jekyll clean'

incremental:
	$(JEKYLL_CMD) $(JEKYLL_IMAGE) \
		/bin/bash -c 'JEKYLL_ENV=production bundle exec jekyll build --incremental'

build:
	$(JEKYLL_CMD) $(JEKYLL_IMAGE) \
		/bin/bash -c 'JEKYLL_ENV=production bundle exec jekyll build'

shell:
	$(JEKYLL_CMD) $(JEKYLL_IMAGE) /bin/bash
