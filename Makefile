OUTPUT = index.html

all: gh-pages

%.html:
	./generate >$@

gh-pages: $(OUTPUT)
	git branch -D $@ || true
	git checkout --orphan $@
	find -maxdepth 1 -type f -not -name $(OUTPUT) -delete
	git add --all .
	git commit --allow-empty -m "Automatic build for $@"
	git push -f origin $@
	git checkout master
	git branch -D $@

.PHONY: gh-pages $(OUTPUT)
