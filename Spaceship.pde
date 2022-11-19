class Spaceship extends Floater  
{   
    //private WarpParticle[] warpParticles = new WarpParticle[1000];
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
    public void setWarping(boolean in) {
      warping = in;
    }
    /*public WarpParticle[] getWarpParticles() {
      return warpParticles;
    }*/
    
    public void stop() {
      myXspeed = 0;
      myYspeed = 0;
    }
    
    public void warp() {
      warping = true;
      stop();
      /*for(int i = 0; i < warpParticles.length; i++) {
        warpParticles[i] = new WarpParticle();
        warpParticles[i].setPos(myCenterX, myCenterY);
      }*/
    }
}
