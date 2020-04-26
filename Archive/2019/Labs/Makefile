PARAMS =
MACROS = Macros.ltx Theorems.ltx

%Slides.pdf : %Slides.ltx ${MACROS} testtarg
	cat $< >VarFill.ltx
#	latexmk -f -pdf -auxdir=./asytmp -jobname=$(basename $@)
#	VarMainSlides.ltx
	pdflatex -jobname=$(basename $@) VarMainSlides.ltx

%.pdf : %.ltx ${MACROS} testtarg
	cat $< >VarFill.ltx
	pdflatex -jobname=$(basename $@) VarMain.ltx

%_sol.pdf : %.ltx ${MACROS} testtarg
	cat $< >VarFill.ltx
	pdflatex -jobname=$(basename $@) VarMain.ltx

clean :
	rm VarFill.ltx
	rm -f ./asytmp/*
	rm -f *.log
	rm -f *.fdb_latexmk
	rm -f *.fls
	rm -f *.out
	rm -f *.*~
	rm -f *.aux
	rm -f *~
	rm -f *.nav	
	rm -f *.snm	
	rm -f *.toc	
	rm -f *.vrb	
	rm -f *.pre
	rm -f *.prc
	rm -f *.js
	rm -f *.m9

fullclean : clean
	rm -f *.pdf
	rm -f *.ps
	rm -f *.dvi
	rm -f *.class

testtarg:


.PHONY: clean fullclean testtarg
