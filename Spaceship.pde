class Spaceship extends Floater  
{   
    private WarpParticle[] warpParticles = new WarpParticle[1000];
    private boolean warping;
  
    public Spaceship() {
      corners = 4;
      xCorners = new int[]{-8, 16, -8, -2};
      yCorners = new int[]{-8, 0, 8, 0};
      
      myColor = 255;
      myCenterX = 640;
      myCenterY = 360;
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = 0;
      
      warping = false;
    }
    
    public boolean getWarping() {
      return warping;
    }
    public void setWarping(boolean isWarping) {
      warping = isWarping;
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
      for(int i = 0; i < warpParticles.length; i++) {
        warpParticles[i] = new WarpParticle();
        warpParticles[i].setPos(myCenterX, myCenterY);
        warpParticles[i].setTarget(xTarget, yTarget);
      }
      myPointDirection = (int)(Math.random()*24)*15;
    }
}
