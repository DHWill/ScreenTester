void setup() {
  fullScreen(P2D);
  //frameRate(30);
  //size(720, 720, P2D);
}
boolean bongo;
color bongoColor;
int lastSelection = -1;
void draw() {
  float seconds = (millis() /1000) + 1;
  int selection = int(seconds / 10);
  if(selection != lastSelection){
    picker(selection);
    lastSelection = selection;
  }
  if (bongo) {
    movingSquares(5);
  } else {
    frame = 0;
  }
}

color setColor(int _rgb) {
  colorMode(RGB, 255, 255, 255);
  if (_rgb < 0) {
    _rgb = 0;
  }
  _rgb = _rgb % 3;

  color col = color(0);
  if (_rgb == 0) {
    col = color(255, 0, 0);
  }
  if (_rgb == 1) {
    col = color(0, 255, 0);
  }
  if (_rgb == 2) {
    col = color(0, 0, 255);
  }
  return col;
}

void squares(float nSquares) {
  rectMode(CENTER);
  noFill();
  int xPos = width/2;
  int yPos = height/2;
  float wid = width / nSquares;
  float hig = height / nSquares;
  for (int x = 0; x < nSquares +1; x ++) {
    rect(xPos, yPos, wid * x, hig * x);
  }
}

void swatchOne(float res) {
  rectMode(CORNER); 
  noStroke();
  colorMode(RGB, res);
  float wid = width/res;
  float hig = height/res;
  for (int i = 0; i < res + 1; i++) {
    for (int j = 0; j < res + 1; j++) {
      fill(i, j, 0);
      rect(i * wid, j * hig, wid, hig);
    }
  }
}

void swatchThree(float res) {
  rectMode(CORNER); 
  //noStroke();
  colorMode(RGB, res);
  float wid = width/res;
  float hig = height/res;
  for (int i = 0; i < res; i++) {
    for (int j = 0; j < res; j++) {
      fill(j, i, 0);
      rect(i * wid, j * hig, wid, hig);
    }
  }
}
void swatchFour(float res) {
  rectMode(CORNER); 
  //noStroke();
  colorMode(RGB, res);
  float wid = width/res;
  float hig = height/res;
  for (int i = 0; i < res; i++) {
    for (int j = 0; j < res; j++) {
      fill(0, i, j);
      rect(i * wid, j * hig, wid, hig);
    }
  }
}
void swatchTwo(float res) {
  rectMode(CORNER); 
  noStroke();
  colorMode(HSB, res);
  float wid = width/res;
  float hig = height/res;
  for (int i = 0; i < res; i++) {
    for (int j = 0; j < res; j++) {
      fill(i, j, 255);
      rect(i * wid, j * hig, wid, hig);
    }
  }
}

int frame = 0;
void movingSquares(int div) {
  int skip = 20;
  int wid = width/div;
  int hig = height/div;
  int posX = frame % width;
  float _posY = (div / float(width * div)) * frame;
  //int _posY = 0;
  int posY = int(_posY) * hig;
  rect(posX - (wid - skip), posY, wid, hig);
  frame += skip;
  frame = frame % (width * div);
}

int displayCycle = 0;


void picker(int displayCycle) {
      displayCycle = displayCycle % 8;
      bongo = false;
      if (displayCycle < 3) {
        clear();
        background(setColor(displayCycle));
        stroke(setColor(displayCycle + 1));
        squares(50);
      } else {
        if (displayCycle == 3) { 
          swatchOne(96);
        }
        if (displayCycle == 4) { 
          swatchTwo(96);
        }
      }
      if (displayCycle == 5) {
        frame = 0;
        fill(setColor(0));
        noStroke();
        bongo = true;
      }
      if (displayCycle == 6) {
        frame = 0;
        fill(setColor(1));
        noStroke();
        bongo = true;
      }
      if (displayCycle == 7) {
        frame = 0;
        fill(setColor(2));
        noStroke();
        bongo = true;
      }

      //displayCycle ++;
}
