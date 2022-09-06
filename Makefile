SHELL = bash

.PHONY: deploy
deploy:
	cd corato && elm-app build
	rm -r docs
	cp -r corato/build docs
	git add .
	git commit -m "deploy"
	git push origin main