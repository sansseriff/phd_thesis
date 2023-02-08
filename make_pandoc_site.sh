find ./src/chapter_01/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown-hard_line_breaks \
--to markdown \
-t markdown-smart \
--lua-filter=parse-html.lua \
--wrap=none \
"${0}" -o "./pandoc_site/chapter_01/$(basename ${0%.md}.md)"' {} \;

find ./src/chapter_02/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown-hard_line_breaks \
--to markdown \
-t markdown-smart \
--lua-filter=parse-html.lua \
--wrap=none \
"${0}" -o "./pandoc_site/chapter_02/$(basename ${0%.md}.md)"' {} \;

find ./src/chapter_03/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown-hard_line_breaks \
--to markdown \
-t markdown-smart \
--lua-filter=parse-html.lua \
--wrap=none \
"${0}" -o "./pandoc_site/chapter_03/$(basename ${0%.md}.md)"' {} \;

find ./src/chapter_04/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown-hard_line_breaks \
--to markdown \
-t markdown-smart \
--lua-filter=parse-html.lua \
--wrap=none \
"${0}" -o "./pandoc_site/chapter_04/$(basename ${0%.md}.md)"' {} \;

find ./src/chapter_05/ -iname "*.md" -type f -exec sh -c 'pandoc \
--from markdown-hard_line_breaks \
--to markdown \
-t markdown-smart \
--lua-filter=parse-html.lua \
--wrap=none \
"${0}" -o "./pandoc_site/chapter_05/$(basename ${0%.md}.md)"' {} \;

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