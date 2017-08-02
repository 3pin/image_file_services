void keyPressed() { 
  //println(key);
  if (key == ' ') {
    //println("Pressed the SPACEBAR.");
    flag = !flag;
    //println("flag: " + flag);
    if (flag == true) {
      //println("Flag true");
      song2.stop();
      //song2.cue(1);
      song1.loop();
      loop();
    } else if (flag == false) {
      //println("Flag false");
      song1.stop();
      //song1.cue(1);
      song2.play();
    }
  } else if (key == '0') {
    println("User pressed '0' to 'exit programme' ");
    chosen = chosenNames.array();
    saveStrings("chosen.txt", chosen);
    stop();
    exit();
  } else if (key == '1') {
    println("User pressed '1' to clear the already-chosen list");
    chosenNames.clear();      
    chosen = chosenNames.array();
    saveStrings("chosen.txt", chosen);
  }
}

