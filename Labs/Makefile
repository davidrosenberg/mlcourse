USESOLUTIONS = "\def\USESOLUTIONS{1} \input{VarMain.ltx}"
PARAMS =
MACROS = Macros.ltx Theorems.ltx

%Slides.pdf : %Slides.ltx ${MACROS}
	cat $< >VarFill.ltx
	pdflatex -jobname=$(basename $@) VarMainSlides.ltx 
	ls $(basename $@)-*.asy && python Runner.py asy -compact $(basename $@)-*.asy || echo "No asymptote files"
	pdflatex -jobname=$(basename $@) VarMainSlides.ltx 
	pdflatex -jobname=$(basename $@) VarMainSlides.ltx 
	rm -f $(basename $@).nav	
	rm -f $(basename $@).snm	
	rm -f $(basename $@).toc	
	rm -f $(basename $@).vrb	
	rm -f $(basename $@).log
	rm -f $(basename $@).out
	rm -f $(basename $@).pre
	rm -f $(basename $@).aux
	rm -f $(basename $@)-*.*

%.pdf : %.ltx ${MACROS}
	cat $< >VarFill.ltx
	pdflatex -jobname=$(basename $@) VarMain.ltx 
	ls $(basename $@)-*.asy && python Runner.py asy -compact $(basename $@)-*.asy || echo "No asymptote files"
	pdflatex -jobname=$(basename $@) VarMain.ltx 
	pdflatex -jobname=$(basename $@) VarMain.ltx 
	rm -f $(basename $@).log
	rm -f $(basename $@).out
	rm -f $(basename $@).pre
	rm -f $(basename $@).aux
	rm -f $(basename $@)-*.*

%_sol.pdf : %.ltx ${MACROS}
	cat $< >VarFill.ltx
	pdflatex -jobname=$(basename $@) ${USESOLUTIONS}
	ls $(basename $@)-*.asy && python Runner.py asy -compact $(basename $@)-*.asy || echo "No asymptote files"
	pdflatex -jobname=$(basename $@) ${USESOLUTIONS}
	pdflatex -jobname=$(basename $@) ${USESOLUTIONS}
	rm -f $(basename $@).log
	rm -f $(basename $@).out
	rm -f $(basename $@).pre
	rm -f $(basename $@).aux
	rm -f comment.cut
	rm -f $(basename $@)-*.*

clean : 
	rm -f *.log
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

.PHONY: clean fullclean
