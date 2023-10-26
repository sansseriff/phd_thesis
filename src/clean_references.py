# pandoc is sensitive to errant percent symbols '%' showing up in the .bib file. 
# These are sometimes found in the abstract section of bib entries.  

# print("cleaning refs...")

with open('references.bib', 'r') as f:
    lines = f.readlines()



# add on refs from chapter 03
with open("./chapter_04/dist/references.bib", "r") as f:
    lines_2 = f.readlines()
    lines = lines + lines_2

lines.append("\n")
lines.append("%%%%%%%%%%%%%%%%")
lines.append("\n")
lines.append("\n")
lines.append("%%%%%%%%%%%%%%%%")
lines.append("\n")


# print(type(lines))

with open('references_cleaned.bib', 'w') as f:
    for line in lines:
        new_line = line.replace('%', 'percent')
        new_line = new_line.replace('{\percent}', ' percent ')
        new_line = new_line.replace('\percent', ' percent ')

        # can keep the lines that start with %
        if line.startswith('%'):
            f.write(line)
        else:
            f.write(new_line)