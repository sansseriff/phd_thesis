PY=python
PANDOC=pandoc



tex:
	cd src && \
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


overleaf:
	cd src && \
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
	rm -r ./site/chapter_01/*
	rm -r ./site/chapter_02/*
	rm -r ./site/chapter_03/*
	rm -r ./site/chapter_04/*
	rm -r ./site/chapter_05/*

	cp -R ./src/chapter_01 ./site/
	cp -R ./src/chapter_02 ./site/
	cp -R ./src/chapter_03 ./site/
	cp -R ./src/chapter_04 ./site/
	cp -R ./src/chapter_05 ./site/
	cp -R ./src/frontmatter ./site/

	mv ./site/chapter_01/section_02_abstract.md ./site/chapter_01/index.md
	mv ./site/chapter_02/section_02_abstract.md ./site/chapter_02/index.md
	mv ./site/chapter_03/section_02_abstract.md ./site/chapter_03/index.md
	mv ./site/chapter_04/section_02_abstract.md ./site/chapter_04/index.md
	mv ./site/chapter_05/section_02_abstract.md ./site/chapter_05/index.md

# html:	
# 	# JEKYLL_ENV=production bundle exec jekyll build --destination docs;\
# 	cd src && \
# 	cp -r chapter_01 ../mkdocs/docs/chapter_01
# 	cd .. \
# 	# sh copyfigs.sh ;\


	

