main := src/Haskell.tex
build_directory := build

all: $(main)
	cd $(build_directory); \
	latexmk -pdf ../$(main)

.PHONY: clean
clean:
	find . -name *.toc -delete
	find . -name *.pdf -delete
	find . -name *.log -delete
	find . -name *.fls -delete
	find . -name *.aux -delete
	
	find . -name *.synctex.gz  -delete
	find . -name *.fdb_latexmk -delete	
