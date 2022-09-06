SHELL = bash

.PHONY: deploy $(m)
deploy:
	cd corato && elm-app build
	rm -r docs
	cp -r corato/build docs
	git add .
	git commit -m "$(m)"
	git push origin main
