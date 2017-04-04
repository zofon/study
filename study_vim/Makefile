
# LATEX  := pdflatex
# BIBTEX := bibtex
# PDFOPT := /usr/bin/qpdf --linearize


#all:   FengZhou-MPTCP.pdf


clean:
	rm -f *.aux *.log *.synctex *.aux *.tex.bak *.toc
	
really-clean: clean
	rm -f *.pdf


# ReferenzarchivWithoutURLs.bib:	Referenzarchiv.bib
	# echo "% ##### DO NOT CHANGE THIS FILE! ###################################"  >ReferenzarchivWithoutURLs.bib
	# echo "% IT IS AUTOMATICALLY GENERATED FROM Referenzarchiv.bib BY Makefile!" >>ReferenzarchivWithoutURLs.bib
	# echo "% ##################################################################" >>ReferenzarchivWithoutURLs.bib
	# echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" >>ReferenzarchivWithoutURLs.bib
	# sed -e "s/url =/myurl =/g" <Referenzarchiv.bib >>ReferenzarchivWithoutURLs.bib

# ps:	FengZhou-MPTCP.pdf
	# pdf2ps FengZhou-MPTCP.pdf FengZhou-MPTCP.ps


# pdf:	ReferenzarchivWithoutURLs.bib
	# cd Measurements && $(MAKE) && cd ..
	#cd Simulations && $(MAKE) && cd ..
	# cd Figures && $(MAKE) && cd ..
	#cd Images && $(MAKE) && cd ..
	# $(LATEX) -draftmode -interaction batchmode FengZhou-MPTCP.tex
	# $(BIBTEX) FengZhou-MPTCP
	# $(LATEX) -draftmode -interaction batchmode FengZhou-MPTCP.tex
	# $(LATEX) -interaction batchmode FengZhou-MPTCP.tex
	# pdffonts FengZhou-MPTCP.pdf
	# grep Warning FengZhou-MPTCP.log || true
	# grep "too wide" FengZhou-MPTCP.log || true


# FengZhou-MPTCP.pdf:	pdf
	# true

# FengZhou-MPTCP-final.pdf:	FengZhou-MPTCP.pdf
	# $(PDFOPT) FengZhou-MPTCP.pdf FengZhou-MPTCP-final.pdf
