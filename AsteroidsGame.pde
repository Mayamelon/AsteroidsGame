private Spaceship spaceship = new Spaceship();

private Star[] stars;

private ArrayList < Asteroid > asteroids = new ArrayList < Asteroid > ();

private int warpTime;


private boolean wPressed = false, sPressed = false, aPressed = false, dPressed = false, spacePressed = false, hPressed = false;


void setup() {
  size(1280, 720);
  stars = new Star[1000];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  
  for (int i = 0; i < 50; i++) {
    asteroids.add(new Asteroid(spaceship.getX(), spaceship.getY()));
  }
  
}
void draw() {
  
  
  
  if (!spaceship.getWarping()) {
    if (wPressed) {
      spaceship.accelerate(0.2);
    }
    if (sPressed) {
      spaceship.accelerate(-0.1);
    }
    if (aPressed) {
      spaceship.turn(-5);
    }
    if (dPressed) {
      spaceship.turn(5);
    }
    if (spacePressed) {
      spaceship.stop();
    }
    if (hPressed) {
      warpTime = 0;
      spaceship.warp();
    }
  }
  
  
  background(0);
  spaceship.move();
  if (!spaceship.getWarping()) {
    
    for (int i = 0; i < asteroids.size(); i++) {
      asteroids.get(i).move();
      asteroids.get(i).show();
      
      if (asteroids.get(i).isColliding(spaceship.getX(), spaceship.getY(), 15)) {
        asteroids.remove(asteroids.get(i));
      }
      
    }
    
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
      
      for (int i = 0; i < asteroids.size(); i++) {
        asteroids.set(i, new Asteroid(spaceship.getX(), spaceship.getY()));
      }
    }
  }
  
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
}

public void keyPressed() {
    if (key == 'w') {
      wPressed = true;
    }
    if (key == 's') {
      sPressed = true;
    }
    if (key == 'a') {
      aPressed = true;
    }
    if (key == 'd') {
      dPressed = true;
    }
    if (key == ' ') {
      spacePressed = true;
    }
    if (key == 'h') {
      hPressed = true;
    }

}

public void keyReleased() {
    if (key == 'w') {
      wPressed = false;
    }
    if (key == 's') {
      sPressed = false;
    }
    if (key == 'a') {
      aPressed = false;
    }
    if (key == 'd') {
      dPressed = false;
    }
    if (key == ' ') {
      spacePressed = false;
    }
    if (key == 'h') {
      hPressed = false;
    }
}
