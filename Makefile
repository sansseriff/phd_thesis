PY=python
PANDOC=pandoc

ppm:
	cd src/chapter_03 && \
	cp -R figs_03/ dist/ && \
	pandoc metadata.yaml \
	section_02_abstract.md section_03_introduction.md section_04_method.md section_05_results.md \
	-o dist/manuscript.tex \
	--wrap=preserve \
	--default-image-extension=.pdf \
	--filter ../pandoc-crossref \
	--natbib \
	--bibliography=dist/references.bib \
	--template=template.tex \
	--lua-filter=short-captions.lua \
	--lua-filter abstract-section.lua \
	--resource-path='.:chapter_03/figs:' && \
	sed -i 's/\\cite[t,p]{/\\cite{/g' dist/manuscript.tex && \
	sed -i 's/{natbib}/{cite}/' dist/manuscript.tex && \
	sed -i 's/,height=\\textheight//g' dist/manuscript.tex && \
	sed -i 's/subsection{/section{/g' dist/manuscript.tex

# -r markdown-auto_identifiers # messes up abstract-section.lua


ppm-overleaf:
	$(MAKE) ppm && \
	cd src/chapter_03/dist && \
	git add . && \
	git commit -m "overleaf update" && \
	git push overleaf master

ppm-pull:
	cd src/chapter_03/dist && \
	git pull overleaf master

	
ref-update:
	cd src && \
	python clean_references.py

tex:
	cd src && \
	python clean_references.py && \
	pandoc metadata.yaml \
	chapter*/*.md \
	ref_heading.md \
	-o thesis.tex \
	--default-image-extension=.pdf \
	--template=styles/template.tex \
	--filter pandoc-crossref \
	-M "crossrefYaml=ref_formatting.yaml" \
	--biblatex \
	--bibliography=references.bib \
	--lua-filter=frontmatter/short-captions.lua \
	--top-level-division chapter \
	--resource-path='.:chapter_01/figs:chapter_02/figs:chapter_03/figs:chapter_04/figs:chapter_05/figs:chapter_06/figs:chapter_07/figs:chapter_08/figs:chapter_09/figs:' \
	&& cd - \

md_test:
	cd src/ && \
	python clean_references.py && \
	sh make_pandoc.sh

overleaf:
	cd src && \
	python clean_references.py && \
	pandoc metadata.yaml \
	chapter*/*.md \
	ref_heading.md \
	-o thesis.tex \
	--default-image-extension=.pdf \
	--template=styles/template.tex \
	--filter pandoc-crossref \
	--filter pandoc-latex-color \
	-M "crossrefYaml=ref_formatting.yaml" \
	--biblatex \
	--bibliography=references.bib \
	--lua-filter=frontmatter/short-captions.lua \
	--top-level-division chapter \
	--resource-path='.:chapter_01/figs:chapter_02/figs:chapter_03/figs:chapter_04/figs:chapter_05/figs:chapter_06/figs:chapter_07/figs:chapter_08/figs:chapter_09/figs:' \
	&& cd - \
	&& git add . \
	&& git commit -m "overleaf update" \
	&& git push overleaf master


overleaf_clean:
	cd src && \
	rm thesis.tex && \
	git pull overleaf master && \
	pandoc metadata.yaml \
	chapter*/*.md \
	ref_heading.md \
	-o thesis.tex \
	--default-image-extension=.pdf \
	--template=styles/template.tex \
	--filter pandoc-crossref \
	-M "crossrefYaml=ref_formatting.yaml" \
	--biblatex \
	--bibliography=references.bib \
	--lua-filter=frontmatter/short-captions.lua \
	--top-level-division chapter \
	--resource-path='.:chapter_01/figs:chapter_02/figs:chapter_03/figs:chapter_04/figs:chapter_05/figs:chapter_06/figs:chapter_07/figs:chapter_08/figs:chapter_09/figs:' \
	&& cd - \
	&& git add . \
	&& git commit -m "overleaf update" \
	&& git push overleaf master

mkdocs:
	cd src && \
	python clean_references.py && \
	cd .. && \
	sh make_pandoc_site.sh

mkdocs_serve:
	mkdocs serve

serve: mkdocs mkdocs_serve


# html:	
# 	# JEKYLL_ENV=production bundle exec jekyll build --destination docs;\
# 	cd src && \
# 	cp -r chapter_01 ../mkdocs/docs/chapter_01
# 	cd .. \
# 	# sh copyfigs.sh ;\


# rm -r ./site/chapter_01/* \
# && rm -r ./site/chapter_02/* \
# && rm -r ./site/chapter_03/* \
# && rm -r ./site/chapter_04/* \
# && rm -r ./site/chapter_05/* \
# && cp -R ./src/chapter_01 ./site/ \
# && cp -R ./src/chapter_02 ./site/ \
# && cp -R ./src/chapter_03 ./site/ \
# && cp -R ./src/chapter_04 ./site/ \
# && cp -R ./src/chapter_05 ./site/ \
# && cp -R ./src/frontmatter ./site/ \
# && mv ./site/chapter_01/section_02_abstract.md ./site/chapter_01/index.md \
# && mv ./site/chapter_02/section_02_abstract.md ./site/chapter_02/index.md \
# && mv ./site/chapter_03/section_02_abstract.md ./site/chapter_03/index.md \
# && mv ./site/chapter_04/section_02_abstract.md ./site/chapter_04/index.md \
# && mv ./site/chapter_05/section_02_abstract.md ./site/chapter_05/index.md \


	

