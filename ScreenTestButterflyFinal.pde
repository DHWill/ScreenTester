PImage[] images = new PImage[4];
int selection;
void setup() {
  fullScreen(P2D);
  //frameRate(30);
  //size(720, 720, P2D);
  images[0] = loadImage("Images/anna.png");
  images[1] = loadImage("Images/SQGreen_Siproeta_Stelenes.png");
  images[2] = loadImage("Images/SQSolo_Danaus_Gilippus.png");
  images[3] = loadImage("Images/SQSolo_Morpho_Helena.png");
}

boolean flip = true;

void draw() {
  if((millis() % 2000) < 500){
    if(flip){
      picker();
      flip = !flip;
    }
  }
  else{flip = true;}
}

void picker(){
  selection ++;
      selection = selection % (images.length + 2);
      if(selection < 2){
        aCross(boolean(selection));
      }
    else{drawAnna(boolean(selection % 2), selection);}
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      picker();
    }
  }
}

void aCross(boolean sel){
  strokeWeight(1);
  background(color(int(!sel) * 255));
  stroke(color(int(sel) * 255));
  line(0, 0, width, height);
  line(0, height, width, 0);
}

void drawAnna(boolean bg, int sel){
  background(color(int(!bg) * 255));
  image(images[sel % images.length], 0, 0, width, height);
}
