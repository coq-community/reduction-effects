all: Makefile.coq
	$(MAKE) -f $< $@

install: Makefile.coq
	$(MAKE) -f $< $@

uninstall: Makefile.coq
	$(MAKE) -f $< $@

clean:
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq $@; fi
	$(RM) Makefile.coq Makefile.coq.conf .*.aux

test:
	$(MAKE) -C tests clean
	$(MAKE) -C tests

Makefile.coq: _CoqProject
	$(COQBIN)coq_makefile -f $< -o $@

README.md: meta.yml templates/README-CircleCI.md.mustache
	mustache $^ > $@
