import geomerative.*;
import java.util.*;
import processing.pdf.*;

RShape grp;
Letter[] letters;
Triangle[] triangles;
ArrayList<RPoint> allTopPoints;
color color1, color2, color3, color4, color5;

void setup() {
  size(600, 400);
  noStroke();
  smooth();

  RG.init(this);
  grp = RG.getText("IMA", "Gotham-Bold.ttf", 140, CENTER);
  RG.setPolygonizer(RG.UNIFORMSTEP);

  letters = new Letter[grp.children.length];
  for (int i=0; i<letters.length; i++) {
    Letter letter = new Letter(grp.children[i]);
    letters[i] = letter;
  }

  allTopPoints = new ArrayList<RPoint>();
  for (Letter letter : letters) {
    allTopPoints.addAll(letter.topPoints);
  }

  triangles = new Triangle[5];
  triangles[0] = new Triangle(color(244, 122, 107));
  triangles[1] = new Triangle(color(250, 224, 60));
  triangles[2] = new Triangle(color(152, 221, 222));
  triangles[3] = new Triangle(color(74, 144, 226, 127));
  triangles[4] = new Triangle(color(74, 144, 226, 127));
  
  updateTriangles();
}


void draw() {
  // Clean frame
  background(255);
  if(frameCount % 60 == 0){
    updateTriangles();
  }

  // Set the origin to draw in the middle of the sketch
  translate(width/2, height/2 + 50);

  for (Letter letter : letters) {
    letter.drawStroke();
  }

  drawTriangles();
}

void updateTriangles() {
  RPoint[] bottoms;
  RPoint top;

  Collections.shuffle(allTopPoints);
  top = allTopPoints.get(0);
  bottoms = letters[0].getRandomPoints("bottom", 2);
  triangles[0].newPoints(bottoms[0], bottoms[1], top);

  top = allTopPoints.get(1);
  bottoms = letters[1].getRandomPoints("bottom", 2);
  triangles[1].newPoints(bottoms[0], bottoms[1], top);
  top = allTopPoints.get(2);
  bottoms = letters[1].getRandomPoints("bottom", 2);
  triangles[2].newPoints(bottoms[0], bottoms[1], top);

  top = allTopPoints.get(3);
  bottoms = letters[2].getRandomPoints("bottom", 2);
  triangles[3].newPoints(bottoms[0], bottoms[1], top);
  top = allTopPoints.get(3);
  bottoms = letters[2].getRandomPoints("bottom", 2);
  triangles[4].newPoints(bottoms[0], bottoms[1], top);
}

void drawTriangles() {
  for (Triangle tri : triangles) {
    tri.update();
    tri.draw();
  }
}