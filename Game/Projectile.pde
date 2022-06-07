public abstract class Projectile implements Cloneable {
  int radius;
  int damage;
  int x;
  int y;
  float xSpeed;
  float ySpeed;
  float volume;
  PShape sprite;
  int type;
  boolean specialActive;

  public abstract void terrainHit(Terrain target);

  /*
  The number before the sin/cos is just a random constant
   that can be changed as seen fit.
   Radius should be a multiple of 5.
   */
  Projectile(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float newVolume) {
    x = xPos;
    y = yPos;
    xSpeed = 0.25 * cos(radians(angle)) * power;
    ySpeed = 0.25 * -sin(radians(angle)) * power;
    volume = newVolume;
    radius = newRadius;
    damage = newDamage;
    sprite = createShape(ELLIPSE, 0, 0, 20, 10);
    sprite.setFill(color(0));
    type = 0;
    specialActive = false;
  }
  
  boolean projectilePhysics() {
    x += xSpeed;
    y += ySpeed;
    ySpeed += GRAV;
    if (x > GAMEWIDTH - 25 || y > GAMEHEIGHT - 15 || x < 25) {
      scanEffectRadius();
      return true;
    }
    if (y < 15) {
      return false;
    }
    for (int j = (y / tileSize) * tileSize; j < (y / tileSize) * tileSize + 3 * tileSize; j+=tileSize) { 
      for (int i = (x / tileSize) * tileSize; i < (x / tileSize) * 5 + 5 * tileSize; i+=tileSize) {
        if (blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).x == i && blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).y == j) {
          if (blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).getType() > 0) {
            scanEffectRadius();
            return true;
          }
        }
      }
    }
    return false;
  }

  /* Checks for terrain
   and snakes in the radius of the projectile and then
   calls onHit() or terrainHit() respectively on anything
   that is found.
   */
  void scanEffectRadius() {
    int xStart = (x / tileSize) * tileSize - radius;
    int xEnd = xStart + 2 * radius;
    int yStart = (y / tileSize) * tileSize - radius;
    int yEnd = yStart + 2 * radius;
    if (x < radius) {
      xStart = 0;
    }
    if (x + radius >= GAMEWIDTH) {
      xEnd = GAMEWIDTH - 5;
    }
    if (y < radius) {
      yStart = 0;
    }
    if (y + radius >= GAMEHEIGHT) {
      yEnd = GAMEHEIGHT - 5;
    }
    for (int j = yStart; j <= yEnd; j+=tileSize) {
      for (int i = xStart; i <= xEnd; i+=tileSize) {
        if (dist(x,y,blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).x,blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).y) <= radius) {
          if (blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).getType() > 0) {
            if (blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).x > 5 && blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).x < GAMEWIDTH - 5
            && blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).y > 5 && blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)).y < GAMEHEIGHT - 5) {
              terrainHit(blocks.get((j / tileSize) * (GAMEWIDTH / tileSize) + (i / tileSize)));
            }
          }
        }
      }
    }
    for (Snake a : EverySnake) {
      if (dist(x,y,a.x,a.y) <= radius + 10) {
        println("Hit snake for " + onHit(a) + " damage!");
      }
    }
  }
  
  int getType() {
    return type;
  }
  
  // To check for projectiles that have special effects if the conditions for using them are met.
  boolean getSpecial() {
    return specialActive;
  }
  
  void playSound(SoundFile file) {
    file.play(1,volume);
  }
  
  // Projectiles could override this and call super in their override and add other effects
  int onHit(Snake target) {
    int damageDealt = damage;
    if (dist(x,y,target.x,target.y) > (radius + 10) / 2) {
      damageDealt = (int)(damage * (((radius + 10) * 1.5 - dist(x,y,target.x,target.y)) / (radius + 10)));
    }
      target.takeDamage(damageDealt);
      return damageDealt;
    }
 

  //Later replace the shape with a (hopefully imported) image.
  void display() {
    float orientation = -1 * atan((float)((-1 * ySpeed) / xSpeed));
    sprite.resetMatrix();
    sprite.rotate(orientation);
    shape(sprite, x, y);
  }
}
