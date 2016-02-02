class Letter {
  RShape shape;
  RPoint[] points;
  ArrayList<RPoint> topPoints;
  ArrayList<RPoint> bottomPoints;

  Letter(RShape _shape) {
    shape = _shape;
    points = shape.getPoints();
    topPoints = new ArrayList<RPoint>();
    bottomPoints = new ArrayList<RPoint>();
    for ( int i=0; i<points.length; i++) {
      RPoint one = points[i];
      // add Top Points
      if(topPoints.size() > 0 ){
        if(topPoints.get(0).y > one.y){
          topPoints.clear();
          topPoints.add(one);
        }
        else if( topPoints.get(0).y == one.y ){
          Boolean FOUND = false;
          for(RPoint point:topPoints){
            if(point.x == one.x){
              FOUND = true;
            }
          }
          if(!FOUND) {
            topPoints.add(one);
          }
        }
      }
      else{
        topPoints.add(one);
      }
      
      // add Bottom Points
      if(bottomPoints.size() > 0 ){
        if(bottomPoints.get(0).y < one.y){
          bottomPoints.clear();
          bottomPoints.add(one);
        }
        else if( bottomPoints.get(0).y == one.y ){
          Boolean FOUND = false;
          for(RPoint point:bottomPoints){
            if(point.x == one.x){
              FOUND = true;
            }
          }
          if(!FOUND) {
            bottomPoints.add(one);
          }
        }
      }
      else{
        bottomPoints.add(one);
      }
    }
  }

  void addPoint(RPoint point, boolean onBottom) {
    boolean FOUND = false;
    for ( int i=0; i<points.length; i++) {
      RPoint one = points[i];
      if ( one.x == point.x && one.y == point.y) {
        FOUND = true;
        break;
      }
    }
    if (!FOUND) {
      if (onBottom) {
        bottomPoints.add(point);
      } else {
        topPoints.add(point);
      }
    }
  }

  RPoint[] getRandomPoints(String where, int num) {
    ArrayList<RPoint> ps = new ArrayList<RPoint>(Arrays.asList(points));
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

  void drawStroke() {
    noFill();
    stroke(238, 232, 242);
    shape.draw();
  }

  void drawPoints() {
   for (int i=0; i<points.length; i++ ) {
    RPoint point = points[i];
    // draw dots
    fill(0, 120); 
    noStroke(); 
    ellipse(point.x, point.y, 5, 5);
   }
  }
}