PARAMS =
MACROS = Macros.ltx Theorems.ltx

%Slides.pdf : %Slides.ltx ${MACROS} testtarg
	cat $< >VarFill.ltx
	latexmk -pdf -outdir=asytmp -jobname=$(basename $@) VarMainSlides.ltx 
	cp ./asytmp/$@ ./$@

%.pdf : %.ltx ${MACROS} testtarg
	cat $< >VarFill.ltx
	latexmk -pdf -outdir=asytmp -jobname=$(basename $@) VarMain.ltx 
	cp ./asytmp/$@ ./$@

%_sol.pdf : %.ltx ${MACROS} testtarg
	cat $< >VarFill.ltx
	latexmk -pdf -outdir=asytmp -jobname=$(basename $@) VarMainSol.ltx
	cp ./asytmp/$@ ./$@

clean : 
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
	rm -f *-*.tex
	rm -f *-*.pdf
	rm -f *.asy

fullclean : clean
	rm -f *.pdf
	rm -f *.ps
	rm -f *.dvi
	rm -f *.class

testtarg:


.PHONY: clean fullclean testtarg
