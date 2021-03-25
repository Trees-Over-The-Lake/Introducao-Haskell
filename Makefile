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

clean_sub_folders:
	find . -name *.toc -delete
	find . -name *.pdf -delete
	find . -name *.log -delete
	find . -name *.fls -delete
	find . -name *.aux -delete
	find . -name *.bbl -delete
	find . -name *.blg -delete
	find . -name *.brf -delete	

	find . -name *.synctex.gz  -delete
	find . -name *.fdb_latexmk -delete
