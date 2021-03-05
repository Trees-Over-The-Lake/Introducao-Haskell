main := src/Haskell.tex
build_directory := build
pdf := Haskell.pdf

all: $(main)
	mkdir -p $(build_directory); \
	cd $(build_directory); \
	latexmk -pdf ../$(main); \
	cp $(pdf) ../$(pdf)

.PHONY: clean
clean:
	rm -rf $(build_directory)
	rm $(pdf)
