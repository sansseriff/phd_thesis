# find ./ -iname "*.md" -type f -exec sh -c 'pandoc \
# -t markdown_strict-raw_html \
# --wrap=preserve \
# --lua-filter=./test.lua \
# "${0}" -o "./output/$(basename ${0%.md}.md)"' {} \;

pandoc section_03_introduction.md \
--from markdown-hard_line_breaks \
--to markdown \
-t markdown-smart \
--lua-filter=parse-html.lua \
--wrap=preserve \
-o ./output/section_03_introduction_edited.md


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