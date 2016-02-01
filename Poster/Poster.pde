import geomerative.*;
import java.util.*;
import processing.pdf.*;

Letter[] letters;
color color1, color2, color3, color4, color5;

void setup() {
  size(3250, 2400);
  smooth();

  beginRecord(PDF, "poster.pdf");
  background(255);

  RG.init(this);
  RShape grp = RG.getText("IMA", "Gotham-Bold.ttf", 140, CENTER);
  RG.setPolygonizer(RG.UNIFORMSTEP);

  letters = new Letter[grp.children.length];
  for (int i=0; i<letters.length; i++) {
    Letter letter = new Letter(grp.children[i]);
    letters[i] = letter;
  }

  // setup colors
  color1 = color(244, 122, 107);
  color2 = color(250, 224, 60);
  color3 = color(152, 221, 222);
  color4 = color(74, 144, 226, 127);
  color5 = color(74, 144, 226, 127);

  // draw in a grid
  for (int i=0; i<7; i++) {
    for (int j=0; j<7; j++) {
      int posX = 447*i + 300 - 16;
      int posY = 299*j + 300;
      pushMatrix();
      translate(posX, posY);
      //drawLetter();
      drawCrazy();
      popMatrix();
    }
  }
  endRecord();
}

void drawLetter() {
  for (Letter letter : letters) {
    letter.drawStroke();
    letter.drawPoints();
  }
}
void drawCrazy() {
  RPoint[] bottoms;
  RPoint top;
  noStroke();
  blendMode(MULTIPLY);
  ArrayList<RPoint> allTopPoints = new ArrayList<RPoint>();
  for (Letter letter : letters) {
    allTopPoints.addAll(letter.topPoints);
  }

  bottoms = letters[0].getRandomPoints("bottom", 2);
  Collections.shuffle(allTopPoints);
  top = allTopPoints.get(0);
  fill(color1);
  triangle(bottoms[0].x, bottoms[0].y, bottoms[1].x, bottoms[1].y, top.x, top.y);

  bottoms = letters[1].getRandomPoints("bottom", 2);
  Collections.shuffle(allTopPoints);
  top = allTopPoints.get(0);
  fill(color2);
  triangle(bottoms[0].x, bottoms[0].y, bottoms[1].x, bottoms[1].y, top.x, top.y);

  bottoms = letters[1].getRandomPoints("bottom", 2);
  Collections.shuffle(allTopPoints);
  top = allTopPoints.get(0);
  fill(color3);
  triangle(bottoms[0].x, bottoms[0].y, bottoms[1].x, bottoms[1].y, top.x, top.y);

  bottoms = letters[2].getRandomPoints("bottom", 2);
  Collections.shuffle(allTopPoints);
  top = allTopPoints.get(0);
  fill(color4);
  triangle(bottoms[0].x, bottoms[0].y, bottoms[1].x, bottoms[1].y, top.x, top.y);

  bottoms = letters[2].getRandomPoints("bottom", 2);
  Collections.shuffle(allTopPoints);
  top = allTopPoints.get(0);
  fill(color5);
  triangle(bottoms[0].x, bottoms[0].y, bottoms[1].x, bottoms[1].y, top.x, top.y);
}