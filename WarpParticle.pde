class WarpParticle extends Floater {
  
  private double myXTarget, myYTarget;
  
  public void show() {
    fill(myColor);
    stroke(myColor);
    
    ellipse((float)myCenterX, (float)myCenterY, 2, 2);
  }
  
  public WarpParticle() {
    myColor = 255;
    myXTarget = mouseX;
    myYTarget = mouseY;
    
    double speed = (double)(Math.random()*4)+2;
    double angle = (double)(Math.random() * 2 * Math.PI);
    
    myXspeed = (double)(speed*Math.cos(angle));
    myYspeed = (double)(speed*Math.sin(angle));
  }
  
  public void setPos(double x, double y) {
    myCenterX = x;
    myCenterY = y;
  }
  
  public void setSpeedAndDir() {
      myXspeed *= 0.95;
      myYspeed *= 0.95;
      myXTarget = mouseX;
      myYTarget = mouseY;
  }
  
  public void PointToTarget() {
    myPointDirection = 180 * atan2((float)(myYTarget-myCenterY),(float)(myXTarget-myCenterX)) / Math.PI;
  }
    
  public boolean atTarget() {
    return dist((float)myCenterX, (float)myCenterY, (float)myXTarget, (float)myYTarget) <= 10;
  }
  
}
