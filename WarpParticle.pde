class WarpParticle extends Floater {
  
  private double myXTarget, myYTarget;
  
  public void show() {
    fill(myColor);
    stroke(myColor);
    
    ellipse((int)myCenterX, (int)myCenterY, 2, 2);
  }
  
  public WarpParticle() {
    myColor = 255;
    
    double speed = (double)(Math.random()*4)+2;
    double angle = (double)(Math.random() * 2 * Math.PI);
    
    myXspeed = (double)(speed*Math.cos(angle));
    myYspeed = (double)(speed*Math.sin(angle));
  }
  
  public void setPos(double x, double y) {
    myCenterX = x;
    myCenterY = y;
  }
  
  public double getTargetX() {
    return myXTarget;
  }
  
  public double getTargetY() {
    return myYTarget;
  }
  
  public void setTarget(double x, double y) {
    myXTarget = x;
    myYTarget = y;
  }
  
  public void setSpeedAndDir() {
      myXspeed *= 0.95;
      myYspeed *= 0.95;
  }
  
  public void pointToTarget() {
    myPointDirection = 180 * Math.atan2((float)(myYTarget-myCenterY),(float)(myXTarget-myCenterX)) / Math.PI;
  }
    
  public boolean atTarget() {
    return Math.sqrt((Math.pow((float)myCenterX - (float)myXTarget, 2) + Math.pow((float)myCenterY - (float)myYTarget, 2))) <= 10;
  }
  
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX >width || myCenterX < 0)
    {     
      myXspeed *= -1;    
    }    
    
    if(myCenterY > height || myCenterY < 0)
    {    
      myYspeed *= -1; 
    } 
  } 
  
}
