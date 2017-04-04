NAME := 框架比较

${NAME}.pdf : ${NAME}.tex
	echo "latex编译一遍"
	xelatex --shell-escape $<
	
	echo "编译aux文件"
	bibtex ${NAME}.aux
	
	echo "编译两遍tex文件"
	xelatex --shell-escape $<
	xelatex --shell-escape $<
	evince ${NAME}.pdf
	
clean:
	rm -f ${NAME}.aux ${NAME}.log ${NAME}.synctex 
	rm -f ${NAME}.aux ${NAME}.tex.bak ${NAME}.toc 
	rm -f ${NAME}.bbl ${NAME}.blg
	rm -r ${NAME}.out ${NAME}.pyg
	rm -rf _minted-master_thesis
	rm ${NAME}.synctex.gz

really-clean: clean
	rm -f ${NAME}.pdf
