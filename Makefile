.PHONY: generate examples

default: examples

generate:
	jai generate.jai

examples:
	jai examples/basic_window.jai

build-raylib:
	git submodule update --init --recursive
	git submodule sync --recursive
	mkdir -p raylib/build
	cd raylib/build && cmake .. && make -j
