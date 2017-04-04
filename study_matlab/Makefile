NAME := study_c

${NAME}.pdf : ${NAME}.tex
	echo "latex编译一遍"
	xelatex -shell-escape $<
	
	echo "编译aux文件"
	bibtex ${NAME}.aux
	
	echo "编译两遍tex文件"
	xelatex -shell-escape $<
	xelatex -shell-escape $<
	evince ${NAME}.pdf
	
clean:
	rm -f *.aux *.log *.synctex *.aux *.tex.bak *.toc *.out *.pyg
	rm -f *.bbl *.blg
	rm -rf _minted-master_thesis
