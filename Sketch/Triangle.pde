class Triangle {
  RPoint[] points;
  RPoint[] _targetPoints;
  color c;
  Triangle(color _c) {
    points = new RPoint[3];
    points[0] = new RPoint();
    points[1] = new RPoint();
    points[2] = new RPoint();
    c = _c;
    
    _targetPoints = new RPoint[3];
  }
  
  void newPoints(RPoint _p1, RPoint _p2, RPoint _p3) {
    _targetPoints[0] = new RPoint(_p1);
    _targetPoints[1] = new RPoint(_p2);
    _targetPoints[2] = new RPoint(_p3);
  }

  void update() {
    for(int i=0; i<3; i++){
      points[i].x += (_targetPoints[i].x - points[i].x ) * 0.5;
      points[i].y += (_targetPoints[i].y - points[i].y ) * 0.5;
    }
  }

  void draw() {
    noStroke();
    fill(c);
    blendMode(MULTIPLY);
    triangle(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y);

    fill(0, 180);
    ellipse(points[0].x, points[0].y, 4, 4);
    ellipse(points[1].x, points[1].y, 4, 4);
    ellipse(points[2].x, points[2].y, 4, 4);
  }
}