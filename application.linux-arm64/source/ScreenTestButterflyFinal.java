import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ScreenTestButterflyFinal extends PApplet {

PImage[] images = new PImage[4];
int selection;
public void setup() {
  
  //frameRate(30);
  //size(720, 720, P2D);
  images[0] = loadImage("Images/anna.png");
  images[1] = loadImage("Images/SQGreen_Siproeta_Stelenes.png");
  images[2] = loadImage("Images/SQSolo_Danaus_Gilippus.png");
  images[3] = loadImage("Images/SQSolo_Morpho_Helena.png");
}

boolean flip = true;

public void draw() {
  if((millis() % 2000) < 500){
    if(flip){
      picker();
      flip = !flip;
    }
  }
  else{flip = true;}
}

public void picker(){
  selection ++;
      selection = selection % (images.length + 2);
      if(selection < 2){
        aCross(PApplet.parseBoolean(selection));
      }
    else{drawAnna(PApplet.parseBoolean(selection % 2), selection);}
}

public void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      picker();
    }
  }
}

public void aCross(boolean sel){
  strokeWeight(1);
  background(color(PApplet.parseInt(!sel) * 255));
  stroke(color(PApplet.parseInt(sel) * 255));
  line(0, 0, width, height);
  line(0, height, width, 0);
}

public void drawAnna(boolean bg, int sel){
  background(color(PApplet.parseInt(!bg) * 255));
  image(images[sel % images.length], 0, 0, width, height);
}
  public void settings() {  fullScreen(P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "ScreenTestButterflyFinal" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
