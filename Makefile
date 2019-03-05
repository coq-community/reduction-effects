all: Makefile.coq
	$(MAKE) -f $< $@

install: Makefile.coq
	$(MAKE) -f $< $@

uninstall: Makefile.coq
	$(MAKE) -f $< $@

clean:
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq $@; fi
	$(RM) Makefile.coq* .*.aux

test:
	$(MAKE) -C tests clean
	$(MAKE) -C tests

Makefile.coq: _CoqProject
	coq_makefile -f $< -o $@
