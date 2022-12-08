private Spaceship spaceship = new Spaceship();

private Star[] stars;

private ArrayList < Asteroid > asteroids = new ArrayList < Asteroid > ();

private ArrayList < Bullet > bullets = new ArrayList < Bullet > ();

private int warpTime;


private boolean wPressed = false, sPressed = false, aPressed = false, dPressed = false, spacePressed = false, hPressed = false;


void setup() {
  size(1280, 720);
  stars = new Star[1000];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }

  for (int i = 0; i < 40; i++) {
    asteroids.add(new Asteroid(spaceship.getX(), spaceship.getY()));
  }
}
void draw() {
  background(0);

  if (spaceship.getHealth() == 0) {
    fill(255);
    stroke(255);
    textSize(80);
    textAlign(CENTER, CENTER);
    text("GAME OVER", 0, 0, width, height);
  } else if (asteroids.size() == 0) {
    fill(255);
    stroke(255);
    textSize(80);
    textAlign(CENTER, CENTER);
    text("YOU WIN!", 0, 0, width, height);
  } else {

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
        if (frameCount % 5 == 0)
          bullets.add(new Bullet(spaceship.getX(), spaceship.getY(), spaceship.getXspeed() + Math.cos(spaceship.getPointDirection() * Math.PI / 180) * 25, spaceship.getYspeed() + Math.sin(spaceship.getPointDirection() * Math.PI / 180) * 25));
      }
      if (hPressed) {
        warpTime = 0;
        spaceship.warp();
      }
    }



    if (!spaceship.getWarping()) {

      for (int i = 0; i < asteroids.size(); i++) {
        asteroids.get(i).move();
        asteroids.get(i).show();


        if (spaceship.getShielding()) {
          if (asteroids.get(i).isColliding(spaceship.getX(), spaceship.getY(), 30)) {
            asteroids.remove(asteroids.get(i));
          }
        } else {
          if (asteroids.get(i).isColliding(spaceship.getX(), spaceship.getY(), 15)) {
            asteroids.remove(asteroids.get(i));
            spaceship.setHealth(spaceship.getHealth() - 1);
          }
        }
      }

      for (int i = bullets.size() - 1; i >= 0; i--) {

        if (bullets.get(i).getFramesShown() > 30) {
          bullets.remove(i);
          break;
        }

        bullets.get(i).move();
        bullets.get(i).show();


        for (int j = asteroids.size() - 1; j >= 0; j--) {
          if (bullets.get(i).isColliding(asteroids.get(j).getX(), asteroids.get(j).getY(), 15)) {
            bullets.remove(i);
            if (asteroids.get(j).getNumCorners() >= 16)
              splitAsteroid(asteroids.get(j));
            asteroids.remove(j);
            break;
          }
        }
      }

      spaceship.move();
      spaceship.updateShield();
      spaceship.show();

      stroke(255);
      fill(0, 255, 255, 120);
      rect(10, 10, spaceship.getShieldStrength()*10, 40, 5);

      stroke(255);
      fill(255, 0, 0, 120);
      rect(width-10 - spaceship.getHealth()*40, 10, spaceship.getHealth()*40, 40, 5);
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

public void mousePressed() {
  if (mouseButton == RIGHT) {
    spaceship.setShielding(true);
  }
}

public void mouseReleased() {
  if (mouseButton == RIGHT) {
    spaceship.setShielding(false);
  }
}

public void splitAsteroid(Asteroid asteroid) {
  asteroids.add(new Asteroid(asteroid));
  asteroids.add(new Asteroid(asteroid));
}
