SHELL = bash

.PHONY: deploy $(m)
deploy:
	cd frontend && npm run build
	rm -r docs
	cp -r frontend/build docs
	cp frontend/CNAME docs/CNAME
	git add .
	git commit -m "$(m)"
	git push origin main