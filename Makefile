include Makefile.conf

################################################################################
CC				= ocamlc
PACKAGES		= -package js_of_ocaml -package js_of_ocaml.ppx

CMI_FILE		= $(patsubst %.mli, %.cmi, $(MLI_FILE))
CMO_FILE		= $(patsubst %.mli, %.cmo, $(MLI_FILE))
CMA_FILE		= $(patsubst %.mli, %.cma, $(MLI_FILE))
################################################################################

################################################################################
build:
	ocamlfind $(CC) -c $(PACKAGES) $(MLI_FILE)
	ocamlfind $(CC) -c $(PACKAGES) $(ML_FILE)
	ocamlfind $(CC) -a -o $(CMA_FILE) $(CMO_FILE)

install: build
	ocamlfind install $(LIB_NAME) META $(CMA_FILE) $(CMI_FILE)

remove:
	ocamlfind remove $(LIB_NAME)

clean:
	$(RM) $(CMI_FILE) $(CMO_FILE) $(CMA_FILE)

re: clean all

test:
	make -C test

re_test:
	make -C test re
################################################################################
