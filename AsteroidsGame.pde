private Spaceship spaceship = new Spaceship();

private Star[] stars;

void setup() {
  size(1280, 720);
  frameRate(60);
  stars = new Star[1000];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}
void draw() {
  background(0);
  spaceship.move();
  if (!spaceship.getWarping()) {
    spaceship.show();
  } else {
    //WarpParticle[] wps = spaceship.getWarpParticles();
    
    boolean atTarget = true;
    
    /*for (int i = 0; i < wps.length; i++) {
      wps[i].setSpeedAndDir();
      wps[i].PointToTarget();
      wps[i].accelerate((double).5);
      wps[i].move();
      wps[i].show();
      if (!wps[i].atTarget())
        atTarget = false;
    }*/
    
    if (atTarget) {
      spaceship.setWarping(false);
      spaceship.myCenterX = mouseX;
      spaceship.myCenterY = mouseY;
    }
  }
  
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
}

public void keyPressed() {
  if (!spaceship.getWarping()) {
    if (key == 'w') {
      spaceship.accelerate(1.5);
    }
    if (key == 's') {
      spaceship.accelerate(-1);
    }
    if (key == 'a') {
      spaceship.turn(-15);
    }
    if (key == 'd') {
      spaceship.turn(15);
    }
    if (key == ' ') {
      spaceship.stop();
    }
    if (key == 'h') {
      spaceship.warp();
    }
  }

}
