rm -r ./pandoc_site/chapter_01/* \
&& rm -r ./pandoc_site/chapter_02/* \
&& rm -r ./pandoc_site/chapter_03/* \
&& rm -r ./pandoc_site/chapter_04/* \
&& rm -r ./pandoc_site/chapter_05/* \
&& rm -r ./pandoc_site/chapter_06/* \
&& cp -R ./src/chapter_01/code/ ./pandoc_site/chapter_01/ \
&& cp -R ./src/chapter_02/code/ ./pandoc_site/chapter_02/ \
&& cp -R ./src/chapter_03/code/ ./pandoc_site/chapter_03/ \
&& cp -R ./src/chapter_04/code/ ./pandoc_site/chapter_04/ \
&& cp -R ./src/chapter_05/code/ ./pandoc_site/chapter_05/ \
&& cp -R ./src/chapter_06/code/ ./pandoc_site/chapter_06/ \
&& cp -R ./src/chapter_01/figs_01/ ./pandoc_site/chapter_01/ \
&& cp -R ./src/chapter_02/figs_02/ ./pandoc_site/chapter_02/ \
&& cp -R ./src/chapter_03/figs_03/ ./pandoc_site/chapter_03/ \
&& cp -R ./src/chapter_04/figs_04/ ./pandoc_site/chapter_04/ \
&& cp -R ./src/chapter_05/figs_05/ ./pandoc_site/chapter_05/ \
&& cp -R ./src/chapter_06/figs_06/ ./pandoc_site/chapter_06/ \
&& cp -R ./src/frontmatter ./pandoc_site/ \
&& cp -R ./src/references.bib ./pandoc_site/ \
&& cp -R ./src/references_cleaned.bib ./pandoc_site/ \

# the lua filter needs to go after (under) the pandoc-crossref. Otherwise,
# padoc-crossref cannot recognize the figures.

find ./src/chapter_01/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown \
--to markdown \
-t markdown-smart \
--wrap=none \
--filter ./src/pandoc-crossref \
-M "crossrefYaml=./src/ref_formatting_site.yaml" \
--lua-filter=parse-html.lua \
"${0}" -o "./pandoc_site/chapter_01/$(basename ${0%.md}.md)"' {} \;

find ./src/chapter_02/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown \
--to markdown \
-t markdown-smart \
--wrap=none \
--filter ./src/pandoc-crossref \
-M "crossrefYaml=./src/ref_formatting_site.yaml" \
--lua-filter=parse-html.lua \
"${0}" -o "./pandoc_site/chapter_02/$(basename ${0%.md}.md)"' {} \;

find ./src/chapter_03/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown \
--to markdown \
-t markdown-smart \
--wrap=none \
--filter ./src/pandoc-crossref \
-M "crossrefYaml=./src/ref_formatting_site.yaml" \
--lua-filter=parse-html.lua \
"${0}" -o "./pandoc_site/chapter_03/$(basename ${0%.md}.md)"' {} \;

find ./src/chapter_04/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown \
--to markdown \
-t markdown-smart \
--wrap=none \
--filter ./src/pandoc-crossref \
-M "crossrefYaml=./src/ref_formatting_site.yaml" \
--lua-filter=parse-html.lua \
"${0}" -o "./pandoc_site/chapter_04/$(basename ${0%.md}.md)"' {} \;

find ./src/chapter_05/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown \
--to markdown \
-t markdown-smart \
--wrap=none \
--filter ./src/pandoc-crossref \
-M "crossrefYaml=./src/ref_formatting_site.yaml" \
--lua-filter=parse-html.lua \
"${0}" -o "./pandoc_site/chapter_05/$(basename ${0%.md}.md)"' {} \;

find ./src/chapter_06/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown \
--to markdown \
-t markdown-smart \
--wrap=none \
--filter ./src/pandoc-crossref \
-M "crossrefYaml=./src/ref_formatting_site.yaml" \
--lua-filter=parse-html.lua \
"${0}" -o "./pandoc_site/chapter_06/$(basename ${0%.md}.md)"' {} \;


mv ./pandoc_site/chapter_01/section_02_abstract.md ./pandoc_site/chapter_01/index.md \
&& mv ./pandoc_site/chapter_02/section_02_abstract.md ./pandoc_site/chapter_02/index.md \
&& mv ./pandoc_site/chapter_03/section_02_abstract.md ./pandoc_site/chapter_03/index.md \
&& mv ./pandoc_site/chapter_04/section_02_abstract.md ./pandoc_site/chapter_04/index.md \
&& mv ./pandoc_site/chapter_05/section_02_abstract.md ./pandoc_site/chapter_05/index.md \
&& mv ./pandoc_site/chapter_06/section_02_abstract.md ./pandoc_site/chapter_06/index.md \

# pandoc section_03_introduction.md \
# --from markdown-hard_line_breaks \
# --to markdown \
# -t markdown-smart \
# --lua-filter=parse-html.lua \
# --wrap=preserve \
# -o ./output/section_03_introduction_edited.md


# pandoc section_03_introduction.md \
# --from markdown --to native \
# -o ./output/section_03_introduction.md
#--lua-filter=parse-html.lua \
# --wrap=preserve \


# --from markdown \
# --to markdown \
# --lua-filter=parse-html.lua \


# --from markdown-hard_line_breaks \
# --to markdown \
# -t markdown-smart \
# --lua-filter=parse-html.lua \
# --wrap=preserve \