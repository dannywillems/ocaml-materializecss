include Makefile.conf

################################################################################
############################## Variables #######################################
##### You don't need to change it.
CMO_FILES					=	$(patsubst $(ML_DIRECTORY)/%.ml, $(ML_DIRECTORY)/%.cmo, $(ML_FILES))
CMI_FILES					=	$(patsubst $(ML_DIRECTORY)/%.ml, $(ML_DIRECTORY)/%.cmi, $(ML_FILES))
TMP_OUT_BYTECODE			=	$(ML_DIRECTORY)/out.byte
CC_CAML						=	ocamlc

ifeq ($(SYNTAX_EXTENSION),camlp4)
	BASIC_PACKAGE 	=	-package js_of_ocaml -package js_of_ocaml.syntax
	BASIC_SYNTAX	=	-syntax camlp4o
else
	BASIC_PACKAGE	=	-package js_of_ocaml -package js_of_ocaml.ppx
endif

ifeq ($(USE_GEN_JS_API) $(DEBUG),True True)
	CC_JS		= js_of_ocaml -o $(ML_JS_DIRECTORY)/$(ML_JS_OUTPUT_FILE) --pretty --debug-info +gen_js_api/ojs_runtime.js $(TMP_OUT_BYTECODE)
	CC_CAML		= ocamlc -g -no-check-prims
else ifeq ($(USE_GEN_JS_API) $(DEBUG),True False)
	CC_JS = js_of_ocaml -o $(ML_JS_DIRECTORY)/$(ML_JS_OUTPUT_FILE) +gen_js_api/ojs_runtime.js $(TMP_OUT_BYTECODE)
	CC_CAML		= ocamlc -no-check-prims
else ifeq ($(USE_GEN_JS_API) $(DEBUG),False True)
	CC_JS = js_of_ocaml -o $(ML_JS_DIRECTORY)/$(ML_JS_OUTPUT_FILE) --pretty --debug-info $(TMP_OUT_BYTECODE)
	CC_CAML		= ocamlc -g
else
	CC_JS = js_of_ocaml -o $(ML_JS_DIRECTORY)/$(ML_JS_OUTPUT_FILE) $(TMP_OUT_BYTECODE)
endif

ifeq ($(DEBUG),True)
	LESSC	= lessc
else
	LESSC	= lessc --clean-css
endif
################################################################################

################################################################################
################# Variables for binary/executables #############################
# TODO: Define variables for binary and executables to check if they exist. Use
# $(shell command -v COMMAND_NAME) and ifndef
################################################################################

################################################################################
###################################### Rules ###################################
.PHONY: clean js_of_ocaml css clean_js_of_ocaml clean_css re_css re_js_of_ocaml re prod re_prod

all: css js_of_ocaml $(PROD_DIRECTORY_LIST)

##### Compile bytecode to js
js_of_ocaml:
	mkdir -p $(ML_JS_DIRECTORY)
	ocamlfind $(CC_CAML) -I $(ML_DIRECTORY) -o $(TMP_OUT_BYTECODE) \
	$(BASIC_PACKAGE) $(CUSTOM_PACKAGE) $(BASIC_SYNTAX) $(CUSTOM_SYNTAX) \
	-linkpkg $(ML_FILES) $(MLI_FILES)
	$(CC_JS)

##### MINIFY CSS
css: clean_css_minify $(CSS_FILES)

$(CSS_DIR)/%.css: $(LESS_DIR)/%.less
ifeq ($(DEBUG),True)
		$(LESSC) $< $@
else
	    $(LESSC) $< >> $(CSS_MINIFY_OUTPUT)
endif

clean: clean_js_of_ocaml clean_css clean_css_minify

clean_js_of_ocaml:
	@echo "-----> Remove ml compiled file"
	$(RM) $(TMP_OUT_BYTECODE)
	$(RM) $(CMO_FILES) $(CMI_FILES)
	$(RM) $(ML_JS_DIRECTORY)/$(ML_JS_OUTPUT_FILE)

clean_css_minify:
	@echo "-----> Remove CSS minified file"
	$(RM) $(CSS_MINIFY_OUTPUT)

clean_css:
	@echo "-----> Remove CSS files"
	$(RM) $(CSS_FILES)

fclean: clean
	# Don't remove the entire JS_OUTPUT_DIR.
	$(RM) $(ML_JS_DIRECTORY)/$(ML_JS_OUTPUT_FILE)

##### re
re_css: clean_css css

re_js_of_ocaml: clean_js_of_ocaml js_of_ocaml

re: clean all
################################################################################
