void keyPressed() { 
  if (key == ' ') {
    println("Pressed the SPACEBAR.");
  } else if ( key != ENTER && key != CODED ) { 
    displayOption = 'A';
    if (count == ascii.length) {                                   //deal with the array filling up
      ascii = expand(ascii, ascii.length+asciiLength);
      //println("expanded the array 'ascii' to length: :" + ascii.length);
    }
    ascii[count] = Character.toString(key);                       //convert each char to a string
    //println("typed value: " + ascii[count]);
    name = name + ascii[count];
    //name = join(ascii, ' ');
    //name = name.replaceAll(" ", "");
    //println ("name: " + name);
    //
    count++;
  } else if (key == ENTER) {
    //println("typed return key");
    name = join(ascii, ' ');
    name = name.replaceAll(" ", "");
    println("seeking file-name: " + name);
    name = path + "/" + name;
    count=0;
    int i = 0;
    while (i<imagefiles.size ()) {                                 //loop through imagefiles comparing
      String testName = imagefiles.get(i);
      for (int v = 0; v<testName.length (); v++) {
        if ( testName.charAt(v) == '.') {
          testName = testName.substring(0, v);
        }
      }
      //println("testName: "+ testName);
      if ( name.equals( testName ) ) {
        displayOption = 'B';
        displayname = name.substring(path_Length+1);
        println("Found file-name: " + name.substring(path_Length+1));
        println();
        var = i;
        i = pics.length;
      } else { 
        i++;
        if (i == imagefiles.size() ) {
          displayOption = 'C';
          println("DIDNT found file-name: " + name.substring(70));
          println();
        }
      }
    }
    name = "";
    for (int z=0; z<ascii.length; z++) {
      ascii[z] = "";
    }
  }
}

