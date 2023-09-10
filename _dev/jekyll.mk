serve:
	bundle exec jekyll serve

clean:
	bundle exec jekyll clean

incremental: clean
	bundle exec jekyll serve --incremental

build:
	JEKYLL_ENV=production bundle exec jekyll build

production:
	JEKYLL_ENV=production bundle exec jekyll serve

prerendered:
	echo DISABLED right now
	# wget http://localhost:4000/blank.html -O _layouts/page-nosocial-rendered.html
	# sed -e 's/CONTENT/{{ content }}/' _layouts/page-nosocial-rendered.html > _layouts/page-nosocial-rendered.tmp
	# mv _layouts/page-nosocial-rendered.tmp _layouts/page-nosocial-rendered.html

