TESTS_V := $(shell grep '[^ ]*\.v' _CoqProject)
TESTS_OUT := $(TESTS_V:.v=.out)
TESTS := $(TESTS_V:.v=)

.PHONY: all
all: $(TESTS)

$(TESTS_OUT): Makefile.coq
	$(MAKE) -f Makefile.coq $@

.PHONY: $(TESTS)

$(TESTS) : % : %.out %.expected
	diff $*.out $*.expected

.PHONY: accept-output $(addprefix accept-,$(TESTS))

accept-output: $(addprefix accept-,$(TESTS))

$(addprefix accept-,$(TESTS)) : accept-% : %.out
	cp -f $< $*.expected

clean:
	if [ -e Makefile.coq ]; then $(MAKE) -f Makefile.coq $@; fi
	$(RM) Makefile.coq Makefile.coq.conf .*.aux $(TESTS_OUT)

Makefile.coq: _CoqProject
	$(COQBIN)coq_makefile -f $< -o $@
