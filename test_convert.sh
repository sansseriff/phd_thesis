pandoc ./src/chapter_05/section_06_aph_hw.md \
--from markdown-hard_line_breaks-native_spans \
--to markdown \
-t markdown-smart \
--lua-filter=parse-html.lua \
--wrap=preserve \
-o ./pandoc_site/chapter_05/section_06_aph_hw_test.md


# --from markdown --to native \

# --from markdown-hard_line_breaks \
# --to markdown \
# -t markdown-smart \
# --lua-filter=parse-html.lua \
# --wrap=preserve \