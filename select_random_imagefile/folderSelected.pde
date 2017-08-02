void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    path = selection.getAbsolutePath();
    println("filepath: " + path);
    path_Length = path.length();
  }
  files = listFiles(path);
  println("There are " +files.length+" files at this location.");         //how many files are here
  for (int i = 0; i<files.length; i++) {
    //println("files[" + i + "]: " + files[i].getName());                  //print the name of the files
  }
  fileNames = new StringList();                                       //save names to StringList... use StringList so I can delete elements easily
  for (int i=0; i<files.length; i++) {
    String testName = files[i].getName();                              //get a fileName
    try {
      String test = checkExtension(testName);  
      if (test.equals("ds_store")) {
        //println("Found a .ds_store so skipped this.");
      } else if ( test.equals("jpg") || test.equals("jpeg") ) {
        //fileNames.append(files[i].getAbsolutePath());
        fileNames.append(files[i].getName());
        //println("Found an image file: " +testName);
      } else {
        //println("Found an incompatible file so skipped this: " +testName);
      }
    }       
    catch (Exception e) {  //cater for corrupt files without extensions
      e.printStackTrace();
      //println("Corrupt OR no-file-extension for file: " +testName);
    }
  }
  println("There are " + fileNames.size() + " jpegs including already-chosen files");

  for (int z=0; z<chosenNames.size (); z++) {                              //below will remove previously-chosen images from selectable-list
    for (int t=0; t<fileNames.size (); t++) {
      //println("chosenNames: " + chosenNames.get(z) + " fileNames: " + fileNames.get(t) );
      if ( chosenNames.get(z).equals(fileNames.get(t)) ) {
        //println("The file was already chosen so will be removed: " + fileNames.get(t));
        fileNames.remove(t);
      }
    }
  }
  println("There are " + fileNames.size() + " jpegs excluding already-chosen files");

  println();
  displayImage = true;
  song1.loop();
  //loop();
}

