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

${TARGETDIR}/%.html: ${SOURCEDIR}/%.html ${ASSETS}
	@echo "creating page" $@
	@cat ${ASSETSDIR}/header.html $< ${ASSETSDIR}/footer.html > $@

clean:
	rm -rf ${TARGETDIR}/*.html ${TARGETSUBDIRS}
