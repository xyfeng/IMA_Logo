class Letter {
  RShape shape;
  ArrayList<RPoint> points;
  ArrayList<RPoint> topPoints;
  ArrayList<RPoint> bottomPoints;

  ArrayList colors;
  ArrayList<RPoint []> combinations;

  Letter(RShape _shape) {
    shape = _shape;
    points = new ArrayList<RPoint>();
    topPoints = new ArrayList<RPoint>();
    bottomPoints = new ArrayList<RPoint>();
    colors = new ArrayList();
    combinations = new ArrayList<RPoint []>();
  }

  void addPoint(RPoint point, boolean onBottom) {
    boolean FOUND = false;
    for ( int i=0; i<points.size(); i++) {
      RPoint one = points.get(i);
      if ( one.x == point.x && one.y == point.y) {
        FOUND = true;
        break;
      }
    }
    if (!FOUND) {
      points.add(point);
      if (onBottom) {
        bottomPoints.add(point);
      } else {
        topPoints.add(point);
      }
    }
  }

  void addColor(color c) {
    colors.add(c);
  }

  void addCombination(int[] indexes) {
    RPoint[] ps = new RPoint[indexes.length];
    int i = 0;
    for (int index : indexes) {
      ps[i] = points.get(index);
      i ++;
    }
    combinations.add(ps);
  }

  RPoint[] getRandomPoints(String where, int num) {
    ArrayList<RPoint> ps = new ArrayList<RPoint>(points);
    if ( where.equals("top") ) {
      ps = new ArrayList<RPoint>(topPoints);
    } else if( where.equals("bottom") ){
      ps = new ArrayList<RPoint>(bottomPoints);
    }
    
    RPoint[] results = new RPoint[num];
    Collections.shuffle(ps);
    for (int i=0; i<num; i++) {
      results[i] = ps.get(i);
    }
    return results;
  }

  RPoint[] shuffle() {
    int index = int(random(combinations.size()));
    return combinations.get(index);
  }

  void drawStroke() {
    noFill();
    stroke(248, 242, 254);
    shape.draw();
  }

  void drawTriangle() {
    RPoint[] ps = shuffle();
    noStroke(); 
    for (int i = 0; i*3 < ps.length; i ++) {
      fill( (color)colors.get(i) );
      blendMode(MULTIPLY);
      triangle(ps[i*3].x, ps[i*3].y, 
        ps[i*3 + 1].x, ps[i*3 + 1].y, 
        ps[i*3 + 2].x, ps[i*3 + 2].y);
    }
  }

  void drawPoints() {
    for (int i=0; i<points.size(); i++ ) {
      RPoint point = points.get(i);
      // draw dots
      fill(0); 
      stroke(0); 
      ellipse(point.x, point.y, 5, 5);
    }
  }
}