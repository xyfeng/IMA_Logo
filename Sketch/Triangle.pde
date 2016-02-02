class Triangle {
  RPoint[] points;
  color c;
  Triangle(color _c) {
    points = new RPoint[3];
    c = _c;
  }

  void update(RPoint _p1, RPoint _p2, RPoint _p3) {
    points[0] = new RPoint(_p1);
    points[1] = new RPoint(_p2);
    points[2] = new RPoint(_p3);
  }

  void draw() {
    fill(c);
    blendMode(MULTIPLY);
    triangle(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y);

    fill(0, 180);
    ellipse(points[0].x, points[0].y, 4, 4);
    ellipse(points[1].x, points[1].y, 4, 4);
    ellipse(points[2].x, points[2].y, 4, 4);
  }
}