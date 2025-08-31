SHELL = bash

.PHONY: deploy $(m)
deploy:
	cd frontend && npm run build
	rm -r docs
	cp -r frontend/build docs
	git add .
	git commit -m "$(m)"
	git push origin main