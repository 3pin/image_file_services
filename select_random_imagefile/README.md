macro: select_random_imagefile - continuous random display of images

description: This programme loads the .jpg image-files at a specified location, then randomly displays images onscreen. When the user presses spacebar, the display PAUSES on a randomly selected image. This image will only be selected if it has not already been selected (via comparison to a ref text file)
1. Prompt the user to select a location where images reside
2. Parse the files, removing (if present) the .DS_Store file, .psd files etc adding only file-names whose extension is either:
       .jpg
       .jpeg
3. Load the previously-selected list of filenames
4. Randomly iterate-display files
5. When SPACEBAR pressed, select an image at random from those that have not been previously selected and pause-display this image
6. When SPACEBAR is pressed again, iteration-display begins again
7. etc.
8. Key '1' clears the previously-chosen list
9. Key '0' safely exits