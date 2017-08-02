/*  
 this loads all image files in the 'data' folder 
 Randomly toggles between displaying them all in quick succession 
 Spacebar PAUSES - picking 1 - such that once chosen it is not chosen again 
 */
import processing.sound.*;
SoundFile song1;
SoundFile song2;

int dw;
int dh;
int w = 720;
int h = 576;

String path;                                  //folder location where files exist
int path_Length;
File[] files; //Class-File array to hold the file names
StringList fileNames;
StringList chosenNames;
String[] chosen; //the array that is saved to a text file to remember who has already been chosen

PImage display;
int var; //the image that is chosen for displaying
int index;

Boolean flag = true;
Boolean fullscreen = false;
Boolean displayImage = false;

void setup() {
  frameRate(8);
  if (fullscreen) {
    dw = displayWidth;
    dh = displayHeight;
  } else {
    dw = w;
    dh = h;
  }
  size(dw, dh);
  
  song1 = new SoundFile(this, "looping.aif");
  song2 = new SoundFile(this, "selected.aif");
  
  chosenNames = new StringList();                       //chosen-names saved to this StringList... use StringList so I can delete elements easily
  String[] chosenLines = loadStrings("chosen.txt");     //load previously-chosen-names from textfile
  for (int i = 0; i<chosenLines.length; i++) {
    chosenNames.append(chosenLines[i]);
  }
  println("chosenNames StringList: " + chosenNames);    //see the previously-chosen-names
  println();
  
  selectFolder("Select a folder to process:", "folderSelected");
}

