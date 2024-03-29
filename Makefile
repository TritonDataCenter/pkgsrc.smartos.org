RSYNC_ARGS=	-acv --delete --exclude Makefile --exclude packages
RSYNC_DEST=	pkgsrc-www0:/data/www/pkgsrc.smartos.org/

build:
	jekyll build

localhost:
	jekyll serve

sync:
	jekyll build
	rsync -n ${RSYNC_ARGS} _site/ ${RSYNC_DEST}
	@echo ""
	@echo "If the above looks ok, run this:"
	@echo ""
	@echo "	rsync ${RSYNC_ARGS} _site/ ${RSYNC_DEST}"
	@echo ""
