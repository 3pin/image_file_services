/* 
 Macro by 3pin.audiovisual@gmail.com
 Use with Processing 2.*
 This macro assumes you have a folder containing .jpg images that you want to display according to a filename.
 1. The macro loads the compatible .jpg files contained at the /data folder and starts by displaying the first .jpg
 2. You type the filename (without its extension) that you are seeking to display, then hit RETURN. 
 3. The macro searches for a match; if it is found it displays
 */

int dw;
int dh;
int w = 720;
int h = 576;
char displayOption = 'A';                      //gate-switch labelling what text to display onScreen
PFont f;
int fontHeight = 20;
String name = "";                                //file name being typed
String displayname;
String path;                                  //folder location where files exist
int path_Length;

File[] files;                                 //array to hold the file names... see class at end of code
StringList imagefiles = new StringList();     //array to hold the file names... see class at end of code
PImage[] pics;                                 //image array to hold the files
int var = 0;                                   //the image that is chosen for displaying

String[] ascii;                     //array to hold characters as they are typed
int asciiLength = 8;                 //initial length of the 
int count = 0;                         //counter to step through this array

Boolean fullscreen;
Boolean displayImage = false;

void setup() {
  //frameRate(1);
  fullscreen = false;
  if (fullscreen) {
    dw = displayWidth;
    dh = displayHeight;
  } else {
    dw = w;
    dh = h;
  }
  size(dw, dh);

  ascii = new String[asciiLength];
  for (int i = 0; i<ascii.length; i++) {
    ascii[i] = "0";
  }
  f = loadFont("Courier-Bold-20.vlw");
  textFont(f);
  textAlign(CENTER);
  noStroke();
  rectMode(CENTER);
  selectFolder("Select a folder to process:", "folderSelected");
  //path = sketchPath+"/data/";
}

void draw() {
  if (displayImage) {
    //println("displayOption: " + displayOption);
    switch(displayOption) {
    case 'A':                                            //currently typing  
      //println("displayOption: " + displayOption);
      fill(0);
      rect(w/2, h/2, w, h);
      fill(255);
      text("User Typing: " + name, w/2, h/2);
      break;
    case 'B':                                            //found  
      //println("displayOption: " + displayOption);
      image(pics[var], 0, 0, dw, dh);  
      fill(0); 
      rect(w/2, h/2, w/2, h/8);
      fill(255);
      text("File Found: " + displayname, w/2, h/2); 
      break;
    case 'C':                                            //not found  
      //println("displayOption: " + displayOption);
      fill(0);
      rect(w/2, h/2, w, h);
      fill(255);
      text("File Not Found.", w/2, h/2);
      break;
    }
  }
}

