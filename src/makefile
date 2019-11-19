SOURCEDIR := .
ASSETSDIR := ../assets
TARGETDIR := ..

ASSETS := ${ASSETSDIR}/header.html ${ASSETSDIR}/footer.html ${ASSETSDIR}/style.css
TARGETSUBDIRS := ${shell find ${SOURCEDIR}/* -type d | sed 's/^${SOURCEDIR}/${TARGETDIR}/'}
SOURCES := ${shell find ${SOURCEDIR} -type f -name "*.html"}
TARGETS := ${patsubst ${SOURCEDIR}/%.html, ${TARGETDIR}/%.html, ${SOURCES}}

.PHONY: all, clean

all: ${TARGETSUBDIRS} ${TARGETS} ${ASSETS}

${TARGETSUBDIRS}:
	@echo "creating directory" $@
	@mkdir -p $@

${TARGETDIR}/index.html: ${SOURCEDIR}/index.html ${ASSETS}
	@echo "creating index page"
	@cat ${ASSETSDIR}/header.html > $@
	@sed '/<!-- BLOGINDEX -->/,$$d' $< >> $@
	@sh ./blogindex.sh 3 >> $@
	@sed '1,/<!-- BLOGINDEX -->/d' $< >> $@
	@cat ${ASSETSDIR}/footer.html >> $@
	
${TARGETDIR}/%.html: ${SOURCEDIR}/%.html ${ASSETS}
	@echo "creating page" $@
	@cat ${ASSETSDIR}/header.html $< ${ASSETSDIR}/footer.html > $@

clean:
	rm -rf ${TARGETDIR}/*.html ${TARGETSUBDIRS}
