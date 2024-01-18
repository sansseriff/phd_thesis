rm -r ./pandoc_site/chapter_01/* || true \
&& rm -r ./pandoc_site/chapter_02/* || true \
&& rm -r ./pandoc_site/chapter_03/* || true \
&& rm -r ./pandoc_site/chapter_04/* || true \
&& rm -r ./pandoc_site/chapter_05/* || true \
&& rm -r ./pandoc_site/chapter_06/* || true \
&& rm -r ./pandoc_site/chapter_07/* || true \
&& rm -r ./pandoc_site/chapter_08/* || true \
&& rm -r ./pandoc_site/extra/* || true \
&& mkdir -p ./pandoc_site/chapter_01/code/ \
&& mkdir -p ./pandoc_site/chapter_02/code/ \
&& mkdir -p ./pandoc_site/chapter_03/code/ \
&& mkdir -p ./pandoc_site/chapter_04/code/ \
&& mkdir -p ./pandoc_site/chapter_05/code/ \
&& mkdir -p ./pandoc_site/chapter_06/code/ \
&& mkdir -p ./pandoc_site/chapter_07/code/ \
&& mkdir -p ./pandoc_site/chapter_08/code/ \
&& mkdir -p ./pandoc_site/chapter_01/figs/ \
&& mkdir -p ./pandoc_site/chapter_02/figs/ \
&& mkdir -p ./pandoc_site/chapter_03/figs/ \
&& mkdir -p ./pandoc_site/chapter_04/figs/ \
&& mkdir -p ./pandoc_site/chapter_05/figs/ \
&& mkdir -p ./pandoc_site/chapter_06/figs/ \
&& mkdir -p ./pandoc_site/chapter_07/figs/ \
&& mkdir -p ./pandoc_site/chapter_08/figs/ \
&& cp -R ./src/chapter_01/code/. ./pandoc_site/chapter_01/code/ \
&& cp -R ./src/chapter_02/code/. ./pandoc_site/chapter_02/code/ \
&& cp -R ./src/chapter_03/code/. ./pandoc_site/chapter_03/code/ \
&& cp -R ./src/chapter_04/code/. ./pandoc_site/chapter_04/code/ \
&& cp -R ./src/chapter_05/code/. ./pandoc_site/chapter_05/code/ \
&& cp -R ./src/chapter_06/code/. ./pandoc_site/chapter_06/code/ \
&& cp -R ./src/chapter_07/code/. ./pandoc_site/chapter_07/code/ \
&& cp -R ./src/chapter_08/code/. ./pandoc_site/chapter_08/code/ \
&& cp -R ./src/chapter_01/figs/. ./pandoc_site/chapter_01/figs/ \
&& cp -R ./src/chapter_02/figs/. ./pandoc_site/chapter_02/figs/ \
&& cp -R ./src/chapter_03/figs/. ./pandoc_site/chapter_03/figs/ \
&& cp -R ./src/chapter_04/figs/. ./pandoc_site/chapter_04/figs/ \
&& cp -R ./src/chapter_05/figs/. ./pandoc_site/chapter_05/figs/ \
&& cp -R ./src/chapter_06/figs/. ./pandoc_site/chapter_06/figs/ \
&& cp -R ./src/chapter_07/figs/. ./pandoc_site/chapter_07/figs/ \
&& cp -R ./src/chapter_08/figs/. ./pandoc_site/chapter_08/figs/ \
&& cp -R ./src/frontmatter/. ./pandoc_site/frontmatter/ \
&& cp -R ./src/references.bib ./pandoc_site/ \
&& cp -R ./src/references_cleaned.bib ./pandoc_site/ \
&& rm -r ./pandoc_site/removed_chapter_09/* \
&& cp -R ./src/removed_chapter_09/code/. ./pandoc_site/removed_chapter_09/code/ \
&& cp -R ./src/removed_chapter_09/figs/. ./pandoc_site/removed_chapter_09/figs/ \



# the lua filter needs to go after (under) the pandoc-crossref. Otherwise,
# padoc-crossref cannot recognize the figures.

find ./src/chapter_01/ -iname "*.md" -type f -exec sh -c 'pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/chapter_01/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/chapter_01/$(basename ${0%.md}.md)"
    rm "./pandoc_site/chapter_01/$(basename ${0%.md}.md).bak"
' {} \;

find ./src/chapter_02/ -iname "*.md" -type f -exec sh -c 'pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/chapter_02/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/chapter_02/$(basename ${0%.md}.md)"
    rm "./pandoc_site/chapter_02/$(basename ${0%.md}.md).bak"
' {} \;
# find ./src/chapter_03/ -iname "*.md" -type f -exec sh -c 'pandoc \
# --from markdown \
# --to markdown \
# -t markdown-smart \
# --wrap=none \
# --filter ./src/pandoc-crossref \
# -M "crossrefYaml=./src/ref_formatting_site.yaml" \
# --lua-filter=parse-html.lua \
# "${0}" -o "./pandoc_site/chapter_03/$(basename ${0%.md}.md)"' {}  &&
# -exec sed -i 's/\\~/~/g' ./pandoc_site/chapter_03/*.md \;

find ./src/chapter_03/ -iname "*.md" -type f -exec sh -c '
    pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/chapter_03/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/chapter_03/$(basename ${0%.md}.md)"
    rm "./pandoc_site/chapter_03/$(basename ${0%.md}.md).bak"
' {} \;
# lol I can't even at all those escape characters. You litterally need every one. It's so bad who would design this
# I'm just converting "\~" to "&#160"

find ./src/chapter_04/ -iname "*.md" -type f -exec sh -c 'pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/chapter_04/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/chapter_04/$(basename ${0%.md}.md)"
    rm "./pandoc_site/chapter_04/$(basename ${0%.md}.md).bak"
' {} \;

find ./src/chapter_05/ -iname "*.md" -type f -exec sh -c 'pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/chapter_05/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/chapter_05/$(basename ${0%.md}.md)"
    rm "./pandoc_site/chapter_05/$(basename ${0%.md}.md).bak"
' {} \;

find ./src/chapter_06/ -iname "*.md" -type f -exec sh -c 'pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/chapter_06/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/chapter_06/$(basename ${0%.md}.md)"
    rm "./pandoc_site/chapter_06/$(basename ${0%.md}.md).bak"
' {} \;

find ./src/chapter_07/ -iname "*.md" -type f -exec sh -c 'pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/chapter_07/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/chapter_07/$(basename ${0%.md}.md)"
    rm "./pandoc_site/chapter_07/$(basename ${0%.md}.md).bak"
' {} \;

find ./src/chapter_08/ -iname "*.md" -type f -exec sh -c 'pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/chapter_08/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/chapter_08/$(basename ${0%.md}.md)"
    rm "./pandoc_site/chapter_08/$(basename ${0%.md}.md).bak"
' {} \;

find ./src/removed_chapter_09/ -iname "*.md" -type f -exec sh -c 'pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/removed_chapter_09/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/removed_chapter_09/$(basename ${0%.md}.md)"
    rm "./pandoc_site/removed_chapter_09/$(basename ${0%.md}.md).bak"
' {} \;

find ./src/extra/ -iname "*.md" -type f -exec sh -c 'pandoc \
    --from markdown \
    --to markdown \
    -t markdown-smart \
    --wrap=none \
    --filter pandoc-crossref \
    -M "crossrefYaml=./src/ref_formatting_site.yaml" \
    --lua-filter=parse-html.lua \
    "${0}" -o "./pandoc_site/extra/$(basename ${0%.md}.md)" &&
    sed -i.bak "s.'\\\\\\\\~'.\\&\\#160;.g" "./pandoc_site/extra/$(basename ${0%.md}.md)"
    rm "./pandoc_site/extra/$(basename ${0%.md}.md).bak"
' {} \;


# I need the sed command with "'s/\.\.\//\.\//g'" to transform "../" to "./" in the index.md files. Because they are deployed one level up from the chapter folders.
cat ./pandoc_site/chapter_01/section_00_title.md ./pandoc_site/chapter_01/section_01_header.md ./pandoc_site/chapter_01/section_02_abstract.md > ./pandoc_site/chapter_01/index.md \
&& cat ./pandoc_site/chapter_02/section_00_title.md ./pandoc_site/chapter_02/section_01_header.md ./pandoc_site/chapter_02/section_02_abstract.md > ./pandoc_site/chapter_02/index.md \
&& cat ./pandoc_site/chapter_03/section_00_title.md ./pandoc_site/chapter_03/section_01_header.md ./pandoc_site/chapter_03/section_02_abstract.md > ./pandoc_site/chapter_03/index.md \
&& cat ./pandoc_site/chapter_04/section_00_title.md ./pandoc_site/chapter_04/section_01_header.md ./pandoc_site/chapter_04/section_02_abstract.md > ./pandoc_site/chapter_04/index.md \
&& cat ./pandoc_site/chapter_05/section_00_title.md ./pandoc_site/chapter_05/section_01_header.md ./pandoc_site/chapter_05/section_02_abstract.md > ./pandoc_site/chapter_05/index.md \
&& mv ./pandoc_site/chapter_06/section_02_abstract.md ./pandoc_site/chapter_06/index.md \
&& cat ./pandoc_site/chapter_07/section_02_abstract.md ./pandoc_site/chapter_07/section_06_aph_hw.md > ./pandoc_site/chapter_07/index.md \
&& sed -i.bak 's/\.\.\//\.\//g' ./pandoc_site/chapter_07/index.md \
&& rm ./pandoc_site/chapter_07/index.md.bak \
&& rm ./pandoc_site/chapter_07/section_00_title.md \
&& rm ./pandoc_site/chapter_07/section_06_aph_hw.md \
&& rm ./pandoc_site/chapter_07/section_02_abstract.md \
&& mv ./pandoc_site/chapter_08/section_02_abstract.md ./pandoc_site/chapter_08/index.md \
&& cat ./pandoc_site/removed_chapter_09/section_02_abstract.md ./pandoc_site/removed_chapter_09/section_03_sams_work.md > ./pandoc_site/removed_chapter_09/index.md \
&& rm ./pandoc_site/removed_chapter_09/section_00_title.md \
&& rm ./pandoc_site/removed_chapter_09/section_03_sams_work.md \
&& rm ./pandoc_site/removed_chapter_09/section_02_abstract.md \


# && mv ./pandoc_site/chapter_05/section_02_abstract.md ./pandoc_site/chapter_05/index.md \

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