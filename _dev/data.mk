data-develop:
	rm -f ./data ./_data
	ln -s _sets/develop/data ./data
	ln -s _sets/develop/_data ./_data
	echo OK

data-production:
	rm -f ./data ./_data
	ln -s _sets/production/data ./data
	ln -s _sets/production/_data ./_data
	echo OK
