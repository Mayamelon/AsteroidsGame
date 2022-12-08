class Bullet extends Floater {
  
  private int framesShown;
  
  public Bullet(double x, double y, double xSpeed, double ySpeed) {
    myCenterX = x;
    myCenterY = y;
    myXspeed = xSpeed;
    myYspeed = ySpeed;
    
    framesShown = 0;
    
    myColor = 255;
    myStroke = 255;
  }
  
  public void show() {
    framesShown++;
    fill(myColor);
    stroke(myStroke);
    
    ellipse((float)myCenterX, (float)myCenterY, 5, 5);
  }
  
  public int getFramesShown() {
    return framesShown;
  }
  
}
