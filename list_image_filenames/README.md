macro: list_image_filenames - list names of imagefiles to a textfile

description: This programme lists the names of image-files at a specificed location then saves this list to a .txt file
  1. Prompt the user to select a location
  2. Parse the files, removing (if present) the .DS_Store file
  3. Add to a list any file-names whose extension is:
       .psd
       .jpg
       .jpeg
  4. Save this list to a .txt in the location where the files exist
