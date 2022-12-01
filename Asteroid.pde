class Asteroid extends Floater {
  
  private double turnRate;
  
  
  public Asteroid(double xAvoid, double yAvoid) {
    corners = (int)(Math.random()*8)+16;
    
    xCorners = new int[corners];
    yCorners = new int[corners];
    
    for (int i = 0; i < corners; i++) {
      double distance = (Math.random()*corners/3) + 2*corners/3;
      
      xCorners[i] = (int)(distance * Math.cos(2*Math.PI*i/corners));
      yCorners[i] = (int)(distance * Math.sin(2*Math.PI*i/corners));
      
    }
    
    turnRate = Math.random()*11 - 5;
    myXspeed = Math.random()*5 - 2;
    myYspeed = Math.random()*5 - 2;
    
    myCenterX = Math.random() * width;
    myCenterY = Math.random() * height;
    
    while (Math.sqrt(Math.pow(xAvoid - myCenterX, 2) + Math.pow(yAvoid - myCenterY, 2)) < 400) {
      myCenterX = Math.random() * width;
      myCenterY = Math.random() * height;
    }
    
    
    myColor = 0;
    myStroke = 255;
    
  }
  
  public void move() {
    super.move();
    
    turn(turnRate);
  }
  
  public boolean isColliding(double x, double y, double distance) {
    return Math.sqrt(Math.pow(x - myCenterX, 2) + Math.pow(y - myCenterY, 2)) < distance + 2*corners/3;
  }
}
