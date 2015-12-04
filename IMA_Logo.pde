import geomerative.*;
import java.util.*;

RShape grp;
Letter[] letters;
Float minY, maxY;

void setup() {
  size(600, 400);
  frameRate(2);
  smooth();

  RG.init(this);
  grp = RG.getText("IMA", "Gotham-Bold.ttf", 150, CENTER);
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
    Letter letter = new Letter();
    for ( RPoint point : grp.children[i].getPoints()) {
      if ( point.y == minY ) {
        letter.addPoint(point, false);
      } else if ( point.y == maxY) {
        letter.addPoint(point, true);
      }
    }
    letters[i] = letter;
  }

  // letterI 
  letters[0].addColor( color(248, 231, 28, 127) );
  letters[0].addCombination(new int[]{0, 3, 1});
  letters[0].addCombination(new int[]{0, 3, 2});

  // letterM
  letters[1].addColor( color(125, 211, 33, 127) );
  letters[1].addColor( color(167, 240, 224, 127) );
  letters[1].addCombination(new int[]{0, 6, 1, 7, 5, 2});
  letters[1].addCombination(new int[]{0, 6, 1, 7, 5, 3});
  letters[1].addCombination(new int[]{0, 6, 1, 7, 5, 4});
  letters[1].addCombination(new int[]{0, 6, 2, 7, 5, 3});
  letters[1].addCombination(new int[]{0, 6, 2, 7, 5, 4});
  letters[1].addCombination(new int[]{0, 6, 3, 7, 5, 4});

  letters[1].addCombination(new int[]{0, 6, 1, 0, 5, 2});
  letters[1].addCombination(new int[]{0, 6, 1, 0, 5, 3});
  letters[1].addCombination(new int[]{0, 6, 1, 0, 5, 4});
  letters[1].addCombination(new int[]{0, 6, 2, 0, 5, 3});
  letters[1].addCombination(new int[]{0, 6, 2, 0, 5, 4});
  letters[1].addCombination(new int[]{0, 6, 3, 0, 5, 4});

  letters[1].addCombination(new int[]{0, 5, 1, 7, 5, 2});
  letters[1].addCombination(new int[]{0, 5, 1, 7, 5, 3});
  letters[1].addCombination(new int[]{0, 5, 1, 7, 5, 4});
  letters[1].addCombination(new int[]{0, 5, 2, 7, 5, 3});
  letters[1].addCombination(new int[]{0, 5, 2, 7, 5, 4});
  letters[1].addCombination(new int[]{0, 5, 3, 7, 5, 4});

  letters[1].addCombination(new int[]{0, 5, 1, 0, 5, 2});
  letters[1].addCombination(new int[]{0, 5, 1, 0, 5, 3});
  letters[1].addCombination(new int[]{0, 5, 1, 0, 5, 4});
  letters[1].addCombination(new int[]{0, 5, 2, 0, 5, 3});
  letters[1].addCombination(new int[]{0, 5, 2, 0, 5, 4});
  letters[1].addCombination(new int[]{0, 5, 3, 0, 5, 4});

  // letterA
  letters[2].addColor( color(74, 144, 226, 127) );
  letters[2].addCombination(new int[]{0, 3, 1, 0, 4, 1});
  letters[2].addCombination(new int[]{0, 3, 1, 5, 4, 1});
  letters[2].addCombination(new int[]{0, 3, 1, 5, 3, 1}); 

  letters[2].addColor( color(74, 144, 226, 127) );
  letters[2].addCombination(new int[]{0, 3, 2, 0, 4, 2});
  letters[2].addCombination(new int[]{0, 3, 2, 5, 4, 2});
  letters[2].addCombination(new int[]{0, 3, 2, 5, 3, 2});
}

void draw() {
  // Clean frame
  background(255);

  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2 + 60);

  // Draw the group of shapes
  noFill();
  stroke(0, 0, 200, 10);
  grp.draw();

  for (Letter letter : letters) {
    letter.drawTriangle();
    //letter.drawPoints();
  }
}