//taken from http://processing.org/learning/topics/directorylist.html
File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    // If it's not a directory
    println("This is not a valid file directory");
    return null;
  }
}
