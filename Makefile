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

html:	
	JEKYLL_ENV=production bundle exec jekyll build --destination docs;\
	sh copyfigs.sh ;\


	

