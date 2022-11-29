private Spaceship spaceship = new Spaceship();

private Star[] stars;

private int warpTime;


void setup() {
  size(1280, 720);
  stars = new Star[500];
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
    warpTime++;
    WarpParticle[] wps = spaceship.getWarpParticles();
    
    boolean allAtTarget = true;
    
    for (int i = 0; i < wps.length; i++) {
      wps[i].setSpeedAndDir();
      wps[i].pointToTarget();
      wps[i].accelerate(0.5);
      wps[i].move();
      wps[i].show();
      if (!wps[i].atTarget())
        allAtTarget = false;
    }
    
    if (allAtTarget || warpTime >= frameRate * 10) {
      spaceship.setWarping(false);
      spaceship.setPos(wps[0].getTargetX(), wps[0].getTargetY());
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
      warpTime = 0;
      spaceship.warp();
    }
  }

}
