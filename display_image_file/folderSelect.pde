void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    path = selection.getAbsolutePath();
    path_Length = path.length();
    println("path_Length: " + path_Length);
  }
  files = listFiles(path);
  println(path);
  println("There are " +files.length+" files at this path location."); //how many files are here
  for (int i = 0; i<files.length; i++) {
    //println("files[" + i + "]: " + files[i].getName());            //print the name of the files
    //println("Full path: " + files[i].getAbsolutePath() );          //print the fullpathname of the files
  }

  for (int i=0; i<files.length; i++) {
    String testName = files[i].getName();  //get a fileName
    try {
      String test = checkExtension(testName);  
      if (test.equals("ds_store")) {
        println("Found a .ds_store so skipped this.");
      } else if ( test.equals("jpg") || test.equals("jpeg") ) {
        imagefiles.append(files[i].getAbsolutePath());
        println("Found an image file: " +testName);
      } else {
        println("Found an incompatible file so skipped this: " +testName);
      }
    }       
    catch (Exception e) {  //cater for corrupt files without extensions
      e.printStackTrace();
      //println("Corrupt OR no-file-extension for file: " +testName);
    }
  }
  println("Length of stringList image-files: " + imagefiles.size());
  pics = new PImage[imagefiles.size()];
  for  (int i=0; i<imagefiles.size (); i++) {
    //println("image[" + i + "]: " + imagefiles.get(i));            //print the name of the files
    pics[i] = loadImage(imagefiles.get(i));
  }
  println();
  displayImage = true;
}

