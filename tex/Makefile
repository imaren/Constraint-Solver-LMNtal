all:
	latexmk tex/main.tex

image:
	docker build -t my-texlive-ja .

ondocker: image
	docker run --rm -v ${PWD}:/workdir my-texlive-ja latexmk tex/main.tex

clean:
	latexmk -C tex/main.tex
	rm -f main.bbl tex/__latexindent_temp.tex tex/*.aux tex/*.fdb_latexmk tex/*.fls tex/*.log
