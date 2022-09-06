SHELL = bash

.PHONY: deploy $(M)
deploy:
	cd corato && elm-app build
	rm -r docs
	cp -r corato/build docs
	git add .
	git commit -m $(M)
	git push origin main

.PHONY: test $(M)
test:
	git add .
	git commit -m "$(M)"