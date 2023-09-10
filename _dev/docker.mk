docker-shell:
	docker run --rm --name jekyll -it -v $$PWD:/srv/jekyll iandennismiller/jekyll:latest /bin/bash

docker-build:
	docker run --rm --name jekyll -it -v $$PWD:/srv/jekyll iandennismiller/jekyll:latest /bin/bash -c 'JEKYLL_ENV=production bundle exec jekyll build'

docker-build-incremental:
	docker run --rm --name jekyll -it -v $$PWD:/srv/jekyll iandennismiller/jekyll:latest /bin/bash -c 'JEKYLL_ENV=production bundle exec jekyll build --incremental'

docker-clean:
	docker run --rm --name jekyll -it -v $$PWD:/srv/jekyll iandennismiller/jekyll:latest /bin/bash -c 'bundle exec jekyll clean'

docker-serve:
	docker run --rm --name jekyll -it -p 4000:4000 -v $$PWD:/srv/jekyll iandennismiller/jekyll:latest /bin/bash -c 'bundle exec jekyll serve --host 0.0.0.0'
