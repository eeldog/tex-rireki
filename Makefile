BASENAME = sample

TEX    = platex -interaction scrollmode
DVIPS  = dvips -q -f -t b5
PSTOPS = pstops -q '2:0L(25.7cm,0)+1L(25.7cm,18.1cm)'

.SUFFIXES:
.SUFFIXES: .tex .dvi .ps

.tex.dvi:
	$(TEX) $<
	$(TEX) $<

.dvi.ps:
	@ $(DVIPS) < $< 2>/dev/null | $(PSTOPS) 2>/dev/null | \
	awk '\
	    BEGIN{ b4size = landscape = 0 } \
	    /^%%DocumentPaperSizes:/{$$2="B4"; b4size=1};\
	    /^%%Orientation:/{$$2="Landscape"; landscape=1}; \
	    /^%%EndComments/{ \
	        if (landscape == 0){ print "%%Orientation: Landscape";} \
	        if (b4size == 0){ print "%%DocumentPaperSizes: B4";}    \
	    }; \
	    {print} \
	' > $@


all: $(BASENAME).ps

$(BASENAME).dvi: $(BASENAME).tex
$(BASENAME).ps: $(BASENAME).dvi

view: $(BASENAME).dvi
	xdvi -paper b5 -e $< &

print: $(BASENAME).ps
	gv $< &

clean:
	rm -f $(BASENAME).aux $(BASENAME).lo?

distclean: clean
	rm -f $(BASENAME).ps $(BASENAME).dvi

PHONY: clean distclean view print
