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


# other commands
# pandoc ./chapter_05/section_06_aph_hw.md --from markdown-hard_line_breaks --to native --filter pandoc-crossref -M "crossrefYaml=ref_formatting_site.yaml" -o ./test_output.md
# pandoc ./chapter_05/section_06_aph_hw.md --from markdown-hard_line_breaks --to markdown --filter pandoc-crossref -M "crossrefYaml=ref_formatting_site.yaml" -o ./test_output.md
