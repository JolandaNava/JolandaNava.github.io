SHELL = bash

.PHONY: deploy $(m)
deploy:
	cd frontend && npm run build
	rm -r docs
	cp -r frontend/build docs
	cp frontend/CNAME docs/CNAME
	cp -r proposals docs/proposals
	cp -r proposte docs/proposte
	git add .
	git commit -m "$(m)"
	git push origin main