



.PHONY: all
all:
	make build

.PHONY: build
build:
	for x in os/*; do [ -d $$x ] || continue; pushd $$x; make build; popd; done

	for x in bigdata/*; do [ -d $$x ] || continue; pushd $$x; make build; popd; done

	for x in ci/*; do [ -d $$x ] || continue; pushd $$x; make build; popd; done