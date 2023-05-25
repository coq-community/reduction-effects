COMPATFILES:= \
	redeffect.mlg \
	PrintingEffect.v \
	_CoqProject

all: Makefile.coq $(COMPATFILES)
	$(MAKE) -f $< $@

install: Makefile.coq
	$(MAKE) -f $< $@

uninstall: Makefile.coq
	$(MAKE) -f $< $@

clean:
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq $@; fi
	$(RM) Makefile.coq Makefile.coq.conf .*.aux $(COMPATFILES)

test:
	$(MAKE) -C tests clean
	$(MAKE) -C tests

Makefile.coq: _CoqProject
	$(COQBIN)coq_makefile -f $< -o $@

%: %.cppo
	cppo -V COQ:$(word 1, $(shell coqc -print-version)) -n -o $@ $^
