class Spaceship extends Floater  
{   
  private WarpParticle[] warpParticles = new WarpParticle[500];
  private boolean warping;
  private boolean shielding;

  private int shieldStrength;
  
  private int health;

  public Spaceship() {
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};

    myColor = 255;
    myStroke = 255;
    myCenterX = 640;
    myCenterY = 360;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;

    warping = false;
    shielding = false;
    shieldStrength = 60;
    health = 5;
  }

  public boolean getShielding() {
    return shielding;
  }

  public int getShieldStrength() {
    return shieldStrength;
  }
  
  public int getHealth() {
    return health;
  }
  
  public void setHealth(int input) {
    health = input;
  }

  public void setShielding(boolean input) {
    shielding = input;
  }

  public void updateShield() {
    if (shielding) {
      if (shieldStrength > 0) {
        shieldStrength--;
      } else {
        shielding = false;
      }
    } else {
      if (frameCount % 5 == 0 && shieldStrength < 60)
        shieldStrength++;
    }
  }

  public boolean getWarping() {
    return warping;
  }
  public void setWarping(boolean input) {
    warping = input;
  }
  public WarpParticle[] getWarpParticles() {
    return warpParticles;
  }

  public void stop() {
    myXspeed = 0;
    myYspeed = 0;
  }

  public void setPos(double x, double y) {
    myCenterX = x;
    myCenterY = y;
  }

  public void warp() {
    warping = true;
    double xTarget, yTarget;

    xTarget = Math.random()*width;
    yTarget = Math.random()*height;

    stop();
    for (int i = 0; i < warpParticles.length; i++) {
      warpParticles[i] = new WarpParticle();
      warpParticles[i].setPos(myCenterX, myCenterY);
      warpParticles[i].setTarget(xTarget, yTarget);
    }
    myPointDirection = (int)(Math.random()*24)*15;
  }
  
  public void show() {
    super.show();
    
    if (shielding) {
      noStroke();
      fill(0, 255, 255, 50);
      ellipse((float)myCenterX, (float)myCenterY, 50, 50);
    }
    
  }
  
}
