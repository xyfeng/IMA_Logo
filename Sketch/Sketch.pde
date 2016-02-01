import geomerative.*;
import java.util.*;
import processing.pdf.*;

RShape grp;
Letter[] letters;
Float minY, maxY;
color color1, color2, color3, color4, color5;

void setup() {
  //size(600, 400);
  size(3250, 2400);
  frameRate(2);
  smooth();

  beginRecord(PDF, "poster.pdf");
  background(255);

  RG.init(this);
  grp = RG.getText("IMA", "Gotham-Bold.ttf", 140, CENTER);
  RG.setPolygonizer(RG.UNIFORMSTEP);

  // find point position y boundary
  minY = 1000.0;
  maxY = -1000.0;
  for (RPoint point : grp.getPoints()) {
    if (point.y < minY) {
      minY = point.y;
    }
    if (point.y > maxY) {
      maxY = point.y;
    }
  }

  letters = new Letter[grp.children.length];
  for (int i=0; i<letters.length; i++) {
    Letter letter = new Letter(grp.children[i]);
    for ( RPoint point : grp.children[i].getPoints()) {
      if ( point.y == minY ) {
        letter.addPoint(point, false);
      } else if ( point.y == maxY) {
        letter.addPoint(point, true);
      }
    }
    letters[i] = letter;
  }

  color1 = color(244, 122, 107);
  color2 = color(250, 224, 60);
  color3 = color(152, 221, 222);
  color4 = color(74, 144, 226, 127);
  color5 = color(74, 144, 226, 127);

  // letterI 
  letters[0].addColor( color1 );
  letters[0].addCombination(new int[]{0, 3, 1});
  letters[0].addCombination(new int[]{0, 3, 2});

  // letterM
  letters[1].addColor( color2 );
  letters[1].addColor( color3 );
  //letters[1].addCombination(new int[]{0, 6, 1, 7, 5, 2});
  letters[1].addCombination(new int[]{0, 6, 1, 7, 5, 3});
  letters[1].addCombination(new int[]{0, 6, 1, 7, 5, 4});
  letters[1].addCombination(new int[]{0, 6, 2, 7, 5, 3});
  letters[1].addCombination(new int[]{0, 6, 2, 7, 5, 4});
  //letters[1].addCombination(new int[]{0, 6, 3, 7, 5, 4});

  //letters[1].addCombination(new int[]{0, 6, 1, 0, 5, 2});
  letters[1].addCombination(new int[]{0, 6, 1, 0, 5, 3});
  letters[1].addCombination(new int[]{0, 6, 1, 0, 5, 4});
  letters[1].addCombination(new int[]{0, 6, 2, 0, 5, 3});
  letters[1].addCombination(new int[]{0, 6, 2, 0, 5, 4});
  //letters[1].addCombination(new int[]{0, 6, 3, 0, 5, 4});

  //letters[1].addCombination(new int[]{0, 5, 1, 7, 5, 2});
  letters[1].addCombination(new int[]{0, 5, 1, 7, 5, 3});
  letters[1].addCombination(new int[]{0, 5, 1, 7, 5, 4});
  letters[1].addCombination(new int[]{0, 5, 2, 7, 5, 3});
  letters[1].addCombination(new int[]{0, 5, 2, 7, 5, 4});
  //letters[1].addCombination(new int[]{0, 5, 3, 7, 5, 4});

  //letters[1].addCombination(new int[]{0, 5, 1, 0, 5, 2});
  letters[1].addCombination(new int[]{0, 5, 1, 0, 5, 3});
  letters[1].addCombination(new int[]{0, 5, 1, 0, 5, 4});
  letters[1].addCombination(new int[]{0, 5, 2, 0, 5, 3});
  letters[1].addCombination(new int[]{0, 5, 2, 0, 5, 4});
  //letters[1].addCombination(new int[]{0, 5, 3, 0, 5, 4});

  // letterA
  letters[2].addColor( color4 );
  letters[2].addCombination(new int[]{0, 3, 1, 0, 4, 1});
  letters[2].addCombination(new int[]{0, 3, 1, 5, 4, 1});
  letters[2].addCombination(new int[]{0, 3, 1, 5, 3, 1}); 

  letters[2].addColor( color5 );
  letters[2].addCombination(new int[]{0, 3, 2, 0, 4, 2});
  letters[2].addCombination(new int[]{0, 3, 2, 5, 4, 2});
  letters[2].addCombination(new int[]{0, 3, 2, 5, 3, 2});

  // draw in a grid
  for (int i=0; i<7; i++) {
   for (int j=0; j<7; j++) {
     int posX = 447*i + 300 - 16;
     int posY = 299*j + 300;
     pushMatrix();
     translate(posX, posY);
     //for (Letter letter : letters) {
     //  letter.drawTriangle();
     //}
     drawCrazy();
     popMatrix();
   }
  }
  endRecord();
}

/*
void draw() {
  // Clean frame
  background(255);

  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2 + 60);
  drawCrazy();
}
*/

void drawCrazy() {
  //for (Letter letter : letters) {
    //letter.drawStroke();
    //letter.drawTriangle();
    //letter.drawPoints();
  //}

  RPoint[] bottoms;
  RPoint top;
  noStroke();
  blendMode(MULTIPLY);
  ArrayList<RPoint> allTopPoints = new ArrayList<RPoint>();
  allTopPoints.addAll(letters[0].topPoints);
  allTopPoints.addAll(letters[1].topPoints);
  allTopPoints.addAll(letters[2].topPoints);

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