void draw() {
  if (displayImage) {                                  //if all folderSelected calculations are done...
    if (flag == true) {                                           //if flag is true i.e if spacebar has not been pressed draw a random image from those available to be chosen from
      if (fileNames.size() > 0) {
        var = int( random(fileNames.size() ) );
        String displayFile = path + "/" + fileNames.get(var);                   //pick a file randomly but index in the StringList
        display = loadImage(displayFile);                              //load that file name
        int x = display.width;    
        if (x == -1) {                                                      //if the image is bad the x value will be -1
          println("bad file removed: " + displayFile + "\n");
          fileNames.remove(var);                                                    //now remove this from those available to be chosen from
          println("fileNames StringList after removing bad file: " + fileNames);
        } else {
          image(display, 0, 0, dw, dh);                                       //draw the found image-file to screen
        }
      } else {  
        println("You have chosen all files");
        noLoop();
      }
    } else if (flag == false) {                                           //else if flag is false display and hold one from those available
      if (fileNames.size() > 0) {
        index = int( random(fileNames.size() ) );
        //println("Random index: " + index);  
        //println("Show then remove: " + fileNames.get(index));
        String displayFile = path + "/" + fileNames.get(index);
        display = loadImage(displayFile);
        int x = display.width;    
        if (x == -1) {                                                  //if the image is bad the x value will be -1
          fileNames.remove(index);                                        //now remove this from those available to be chosen from
          println("bad file removed: " + displayFile + "\n");
          println("fileNames StringList after removing bad file: " + fileNames);
          flag = !flag;                                                     //exit back into the randomly looping mode
        } else {
          image(display, 0, 0, dw, dh);                                         //draw the found image-file to screen and pause
        }
        chosenNames.append(displayFile.substring(path_Length+1));      
        chosen = chosenNames.array();
        saveStrings("chosen.txt", chosen);

        fileNames.remove(index);      //now remove this from those available to be chosen from
        //println("StringList 'fileNames': " + fileNames);
        noLoop();
      } else {
        println("You have chosen all files");
        noLoop();
      }
    }
  }
}

