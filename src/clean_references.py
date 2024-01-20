import os, sys, glob, copy
from os import path, access, R_OK  # W_OK for write permission.
from operator import itemgetter
import time
import bibtexparser
import sys

from bibtexparser.model import DuplicateBlockKeyBlock
from bibtexparser import Library


import warnings
warnings.filterwarnings("ignore", category=UserWarning)
import logging
logging.getLogger().setLevel(logging.ERROR)



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




# pandoc is sensitive to errant percent symbols '%' showing up in the .bib file. 
# These are sometimes found in the abstract section of bib entries.  
# this fixes the error when running mkdocs: "Pandoc died with exitcode "65" during conversion: Error at (line 17, column 1):"
replacements = {
    '%': 'percent',
    'Appl.': 'Applied',
    'Phys.': 'Physics',
    'Rev.': 'Review',
    'Rev. Mod. Phys.': 'Reviews of Modern Physics',
    'Lett.': 'Letters',
    'Sci.': 'Science',
    'Sci ': 'Science ',
    'Opt.': 'Optics',
    'Commun.': 'Communications',
    'Comm.': 'Communications',
    'Nature photonics': 'Nature Photonics',
    '{\percent}': ' percent ',
    '\percent': ' percent '
}

with open('_references_inter.bib', 'w') as f:
    for line in lines:
        # Only do replacements if the line doesn't start with %
        if not line.startswith('%'):
            for old, new in replacements.items():
                line = line.replace(old, new)
        f.write(line)


#-------- control parameter ---------
# is_check_file = 0
# is_check_double_file = 1
# is_check_unused_files = 0
#------------------------------------   

# ROOT = os.getenv("HOME") # Home directory
#ROOT = path.expanduser("~") # works on all platforms  

# pdfdir = ROOT + '/lit/pdf/'
# print 'pdfdir', pdfdir
# debug = 0 # shutdown debug/info messages

# bib_data = open('references_cleaned.bib')

# words = ['author', 'title', 'journal', 'year', 'volume', 'comment', 'issue', 'owner', 'file', 'timestamp', 'booktitle', 'editor', 'publisher', 'number', 'part', 'keywords', 'doi', 'month', 'organization', 'url']
#------------------------------------------------------------------------------

# import os

# def check_missing_pdf(element):
#     """
#     following tests:
#     1. element has no file entry
#     2. element has empty file entry
#     3. element has file entry with inexistent pdf-file
#     """
#     #check missing files
#     if 'file' not in element: # element has no file
#         print('==== {} has no file entry'.format(element.get('key')), file=sys.stderr)
#     elif not element.get('file'):  # .. or file is empty
#         print('**** {} has empty file entry'.format(element.get('key')), file=sys.stderr)
#     else:
#         # we have a file entry -----> check its existence in the pdf dir
#         pdffile = pdfdir + element.get('file')
#         if not(os.path.exists(pdffile) and os.path.isfile(pdffile) and os.access(pdffile, os.R_OK)):
#             print('#### {} with file entry [{}]: Either file is missing or is not readable'.format(element.get('key'), element.get('file')), file=sys.stderr)
#------------------------------------------------------------------------------

# def check_doubles(elements):
#     """
#     check if two or more different objects have the same pdf-file 
#     """
#     # doubles = {}
#     # for element in elements:
#     #     pdffile = element.get("file")
#     #     key = element.get("key")
#     #     if pdffile not in doubles:
#     #         doubles[pdffile] = [key]
#     #     else:
#     #         doubles[pdffile].append(key)
#     # for f, k in doubles.items():
#     #     if f and len(k) > 1: # if f excludes case f == None
#     #         print("Keys:", k, "have the same file <%s>"%f, file=sys.stderr)

#     seen = {}

#     # Iterate over the data
#     for item in elements:
#         key = item['key']
#         print(key)
#         if key in seen:
#             # If the key is already in the dictionary, it's a duplicate
#             print(f'Duplicate: {item}')
#         else:
#             # If the key is not in the dictionary, add it
#             seen[key] = item


#------------------------------------------------------------------------------

# def check_unused_files(elements):
#     """
#     check dir pdfdir ("lit/pdf") for pdf-files that are not used
#     in the ped.bib
#     """
#     pdf_files = glob.glob( pdfdir + "*.pdf") # pdfs in lit/pdf/
#     dummy_files = copy.copy(pdf_files) # list of unused files
#     for pdf in pdf_files:
#         for element in elements:
#             element_pdf =  element.get("file")
#             if element_pdf is None:
#                 continue
#             element_pdf = path.basename(element_pdf)

#             if path.basename(pdf) == element_pdf:
#                 dummy_files.remove(pdf)
#                 break # check next files

#     if dummy_files:
#         print >>sys.stderr, "%d files are not used:"%len(dummy_files)
#         for f in dummy_files:
#             print >>sys.stderr, "---->",path.basename(f)
# #------------------------------------------------------------------------------

# def putWord(string, dic, line):
#     """
#     extract from <line> the value of the key <string> and put it in  <dic>
#     """
#     tmp = line[1].strip(' { } , .').split(':')
#     # some files are like this :llll:aaaa. So tmp[0] is here == ''
#     if not tmp[0]: 
#         dic[string] = tmp[1]
#     else:
#         dic[string] = tmp[0]
# #------------------------------------------------------------------------------

# def getElement(f):
#     """
#     get ONE element from file f.
#     return dict
#     """
#     dic = {}
#     for line in f:
#         line = line.strip(' \n\r')
#         if not line:
#             continue
#         #get <key> and <type>
#         if line[0] == '@':
#             sline = line.split('{')
#             typ = sline[0][1:]
#             if typ == 'comment': # ignore jabref-meta
#                 continue
#             dic['type'] = typ.strip(',') 
#             key = sline[1].strip(',')
#             if debug:
#                 print('--------> type: <%s>'%typ, file=sys.stderr)
#                 print('--------> key: <%s>'%key, file=sys.stderr)
#             dic['key'] = key

#         line = line.split('=')

#         for word in words:
#             if line[0].strip(' ') == word or line[0].strip(' ') == word.upper():
#                 putWord(word, dic, line)
#                 if debug:
#                     print('--------> %s: <%s>'%(word, line[1].strip(' { },.')), file=sys.stderr)

#         # check for last line of element
#         if line[0] == '}':
#             if debug:
#                 print('---------------------------------', file=sys.stderr)
#             return dic
# #------------------------------------------------------------------------------


# #----------------------- get content of file in elements ------------------------------


bib_database: Library = bibtexparser.parse_file("_references_inter.bib")


print(f"removing {len(bib_database.failed_blocks)} failed bib entries")
duplicate_failed_blocks = []
for block in bib_database.failed_blocks:
    if type(block) is DuplicateBlockKeyBlock:
        duplicate_failed_blocks.append(block)
if len(duplicate_failed_blocks) == len(bib_database.failed_blocks):
    print("all failed bib entries are duplicates")
else:
    print("not all failed bib entries are duplicates")
    print("check errors")
bib_database.remove(bib_database.failed_blocks)

out_file_name = "references_cleaned.bib"
# for block in bib_database.blocks:
print(f"exporting cleaned bibtext file to {out_file_name}")
new_bibtex_str = bibtexparser.write_string(bib_database) # or bibtexparser.write_file("my_new_file.bib", library)


with open(out_file_name, 'w') as f:
    f.write(new_bibtex_str)




