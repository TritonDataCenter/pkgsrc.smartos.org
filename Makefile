#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source.  A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
#

#
# Copyright 2014 (c) Joyent, Inc.  All rights reserved.
#

PTYHON =	python
MDPATH =	./support
MD = 		$(MDPATH)/markdown2.py
TOC =		./support/gentoc.sh

HEADER =	assets/header.html
TRAILER =	assets/trailer.html

BOOTSTRAP_MIN =		.min
BOOTSTRAP_TYPES =	css img js
BOOTSTRAP_FILES = \
	css/bootstrap$(BOOTSTRAP_MIN).css \
	img/glyphicons-halflings-white.png \
	img/glyphicons-halflings.png \
	js/bootstrap$(BOOTSTRAP_MIN).js

MDARGS = \
	--extras fenced-code-blocks \
	--extras header-ids \
	--extras link-patterns \
	--extras wiki-tables \
	--link-patterns-file support/link-patterns.txt

FAVICON = pkgsrc-box.ico

CSS_FILES = \
	pygments-github.css

IMAGE_FILES = \
	pkgsrc-box-inv.png

FILES = \
	index.markdown \
	installing.markdown \
	changes.markdown \
	building.markdown \
	fixing.markdown \
	creating.markdown \
	bulk.markdown

OUTDIR =	output
BOOTSTRAP_OUTDIRS = \
	$(BOOTSTRAP_TYPES:%=$(OUTDIR)/bootstrap/%)

OUTFILES = \
	$(FILES:%.markdown=$(OUTDIR)/%.html) \
	$(FAVICON:%.ico=$(OUTDIR)/favicon.ico) \
	$(CSS_FILES:%=$(OUTDIR)/css/%) \
	$(IMAGE_FILES:%=$(OUTDIR)/img/%) \
	$(BOOTSTRAP_FILES:%=$(OUTDIR)/bootstrap/%)

all: $(OUTDIR) $(BOOTSTRAP_OUTDIRS) $(OUTFILES)

$(OUTDIR):
	mkdir -p "$@"

$(OUTDIR)/css:
	mkdir -p "$@"

$(OUTDIR)/img:
	mkdir -p "$@"

$(BOOTSTRAP_OUTDIRS):
	mkdir -p "$@"

$(OUTDIR)/%.html: %.markdown $(HEADER) $(TRAILER) $(OUTDIR)
	title=`awk '/^# / {sub("^# *", ""); print; exit;}' $<` && \
	    echo title=$$title && \
	    sed -e "s/TITLE/$$title/g" $(HEADER) > $@
	$(TOC) $< $(FILES) >> $@
	$(PYTHON) $(MD) $(MDARGS) $< >> $@
	cat $(TRAILER) >> $@

$(OUTDIR)/favicon.ico: $(FAVICON)
	cp $< $@
	touch $@

$(OUTDIR)/css/%: assets/% $(OUTDIR)/css
	cp $< $@
	touch $@

$(OUTDIR)/img/%: assets/% $(OUTDIR)/img
	cp $< $@
	touch $@

$(OUTDIR)/bootstrap/%: assets/bootstrap/% $(BOOTSTRAP_OUTDIRS)
	cp $< $@
	touch $@

clean: clobber

clobber:
	rm -rf output
