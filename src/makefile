sourcedir := .
assetsdir := ../assets
targetdir := ..

assets := ${assetsdir}/header.html ${assetsdir}/footer.html ${assetsdir}/style.css
targetsubdirs := ${shell find ${sourcedir}/* -type d | sed 's/^${sourcedir}/${targetdir}/'}
sources := ${shell find ${sourcedir} -type f -name "*.html"}
targets := ${patsubst ${sourcedir}/%.html, ${targetdir}/%.html, ${sources}}

.PHONY: all, publish, clean

all: ${targetsubdirs} ${targets} ${assets}

${targetsubdirs}:
	@echo "creating directory" $@
	@mkdir -p $@

${targetdir}/index.html: ${sourcedir}/index.html ${assets}
	@echo "creating index page"
	@cat ${assetsdir}/header.html > $@
	@sed '/<!-- BLOGINDEX -->/,$$d' $< >> $@
	@sh ./blogindex.sh 3 >> $@
	@sed '1,/<!-- BLOGINDEX -->/d' $< >> $@
	@cat ${assetsdir}/footer.html >> $@

${targetdir}/blogindex.html: ${sourcedir}/blogindex.html ${assets}
	@echo "creating blog index"
	@cat ${assetsdir}/header.html > $@
	@sed '/<!-- BLOGINDEX -->/,$$d' $< >> $@
	@sh ./blogindex.sh >> $@
	@sed '1,/<!-- BLOGINDEX -->/d' $< >> $@
	@cat ${assetsdir}/footer.html >> $@

${targetdir}/%.html: ${sourcedir}/%.html ${assets}
	@echo "creating page" $@
	@cat ${assetsdir}/header.html $< ${assetsdir}/footer.html > $@

publish:
	@git add --all
	@git commit
	@git push

clean:
	rm -rf ${targetdir}/*.html ${targetsubdirs}
