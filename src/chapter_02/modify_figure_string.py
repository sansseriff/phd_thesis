import re


def modify_figures(file_path, path):
    # Read the file contents
    with open(file_path, 'r') as f:
        contents = f.read()

    # Define the regular expression pattern
    pattern = r'({#fig:\w+\s+short-caption="[^"]*")(.*?)\s*(\})'

    # Define the replacement string
    replacement = r'\1 path="{}"\2\3'.format(path)

    # Replace the matched strings with the modified string
    modified_contents = re.sub(pattern, replacement, contents, flags=re.DOTALL)

    # Write the modified contents back to the file
    with open(file_path, 'w') as f:
        f.write(modified_contents)


if __name__ == '__main__':
    modify_figures('./section_03_introduction_copy.md', '02')