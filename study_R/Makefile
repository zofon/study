NAME := study_R

${NAME}.pdf:	${NAME}.tex
	echo "latex编译一遍"
	xelatex -shell-escape $<
	
	echo "编译aux文件"
	bibtex ${NAME}.aux
	
	echo "编译两遍tex文件"
	xelatex -shell-escape $<
	xelatex -shell-escape $<

clean:
	rm -f *.aux *.log *.synctex *.aux *.tex.bak *.toc *.out *.pyg
	rm -f *.bbl *.blg
	rm -rf _minted-master_thesis
	rm -f *.synctex.gz
really-clean: clean
	make clean
	rm -f *.pdf
