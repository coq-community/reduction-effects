# setup findlib
ifeq ($(shell which cygpath 2>/dev/null),)
OCAMLPATH := $(shell pwd):$(OCAMLPATH)
else
OCAMLPATH := $(shell cygpath -m $(shell pwd));$(OCAMLPATH)
endif
export OCAMLPATH

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

%: meta.yml templates/%.mustache
	mustache $^ > $@
