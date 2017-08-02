/* 
 Macro by 3pin.audiovisual@gmail.com
 //
 This programme lists the names of image-files at a specificed location then saves this list to a .txt file
 1. Prompt the user to select a location
 2. Parse the files, removing (if present) the .DS_Store file
 3. Add to a list any file-names whose extension is:
       .psd
       .jpg
       .jpeg
 4. Save this list to a .txt in the location where the files exist
 */

String path;
File[] files; //Class-File array to hold the file names
StringList fileNames;

void setup() {
  selectFolder("Select a folder to process:", "folderSelected");
}

void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } 
  else {
    path = selection.getAbsolutePath();
    println("The image-files to be listed are at: " + path);
    fileNames = new StringList();           //save names to StringList... I use StringList so I can delete elements easily
    files = listFiles(path); //list all files in this location
    println("There maybe upto " +files.length+" .psd/.jpg/.jpeg files to be listed."); //how many files are here
    for (int i=0; i<files.length; i++) {  //check extensions to remove non-image files
      String testName = files[i].getName();  //get a fileName
      try {
        String test = checkExtension(testName);  
        if (test.equals("ds_store")) {
          println("Found a .ds_store so skipped this: " +testName);
        } 
        else if (test.equals("psd")) {
          //println("Found a .psd: " +testName);
          fileNames.append(testName);
        }
        else if ( test.equals("jpg")) {
          //println("Found a .jpg: " +testName);
          fileNames.append(testName);
        } 
        else if ( test.equals("jpeg")) {
          //println("Found a .jpeg: " +testName);
          fileNames.append(testName);
        }
        else {
          println("Found an unknown file so skipped this: " +testName);
        }
      }
      catch (Exception e) {  //cater for corrupt files without extensions
        //e.printStackTrace();
        println("Corrupt OR no-file-extension for file: " +testName);
      }
    }
  }
  String[] attendance = fileNames.array(); //this code removes the extensions before the file-names are saved
  for (int i=0; i<attendance.length; i++) {
    String internal = attendance[i];
    for (int t = 0; t<internal.length(); t++) {
      if ( internal.charAt(t) == '.') {
        String withoutExtension = internal.substring(0, t);
        attendance[i] = withoutExtension;
        //println(attendance[i]);
      }
    }
  }
  saveStrings(path+" attendance.txt", attendance);
  println (attendance.length + " image-files have been listed in file: " + path+" attendance.txt");
  exit();
}

//method taken from http://processing.org/learning/topics/directorylist.html
File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } 
  else {
    // If it's not a directory
    println("This is not a valid file directory");
    return null;
  }
}

