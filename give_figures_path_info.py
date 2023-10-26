import re
import os


def modify_figures(file_path, path):
    # Read the file contents
    with open(file_path, 'r') as f:
        contents = f.read()

    # chatgpt wrote most of this...
    # this takes strings like "{#fig:jitterate_intro short-caption="Introduction to the time walk effect" width=70%}"
    # and inserts a new attribute "path" with a number that corresponds to the chapter number
    # this is used in a lua filter to prepend the chapter path

    # Define the regular expression pattern
    # pattern = r'({#fig:\w+\s+short-caption="[^"]*")(.*?)(\spath="[^"]*")?(\s*)(\})'
    pattern = r'({#fig:\w+)(.*?)(\spath="[^"]*")?(\s*)(\})'
    

    # Define the replacement string
    replacement = r'\1\2 path="{}"\4\5'.format(path)

    # Replace the matched strings with the modified string
    modified_contents, num_substitutions = re.subn(pattern, replacement, contents, flags=re.DOTALL)

    print(f"made {num_substitutions} substitutions in {file_path}")

    # Write the modified contents back to the file
    with open(file_path, 'w') as f:
        f.write(modified_contents)



if __name__ == '__main__':
    # modify_figures('section_06_aph_hw copy.md', 'chapter_07')
    
    # Get the current working directory
    cwd = os.getcwd()

    # Define the path to the src directory
    src_path = os.path.join(cwd, 'src')

    # Loop through each chapter directory
    for chapter_dir in os.listdir(src_path):
        # Check if the chapter directory name matches the format "chapter_XX"
        if not re.match(r'^chapter_\d{2}$', chapter_dir):
            continue
        # Define the path to the chapter directory
        chapter_path = os.path.join(src_path, chapter_dir)

        # Loop through each markdown file in the chapter directory
        for file_name in os.listdir(chapter_path):
            # Check if the file is a markdown file
            if file_name.endswith('.md'):
                # Define the path to the markdown file
                file_path = os.path.join(chapter_path, file_name)

                # Call the modify_figures function with the chapter directory name as the path argument
                modify_figures(file_path, chapter_dir)

