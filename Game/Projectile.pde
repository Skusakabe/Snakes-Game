public abstract class Projectile implements Cloneable {
  int radius;
  int damage;
  int x;
  int y;
  double xSpeed;
  double ySpeed;
  PShape sprite;
  int type;

  public abstract void terrainHit(Terrain target);

  /*
  The number before the sin/cos is just a random constant
   that can be changed as seen fit.
   Radius should be a multiple of 5.
   */
  Projectile(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    x = xPos;
    y = yPos;
    xSpeed = 0.25 * Math.cos(radians(angle - 1)) * power;
    ySpeed = 0.25 * -Math.sin(radians(angle - 1)) * power;
    radius = newRadius;
    damage = newDamage;
    sprite = createShape(ELLIPSE, 0, 0, 20, 10);
    sprite.setFill(color(0));
    type = 0;
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
    for (int j = (y / 5) * 5; j < (y / 5) * 5 + 15; j+=5) { 
      for (int i = (x / 5) * 5; i < (x / 5) * 5 + 25; i+=5) {
        if (blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).x == i && blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).y == j) {
          if (blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).getType() > 0) {
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
    int xStart = (x / 5) * 5 - radius;
    int xEnd = xStart + 2 * radius;
    int yStart = (y / 5) * 5 - radius;
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
    for (int j = yStart; j < yEnd; j+=5) {
      for (int i = xStart; i < xEnd; i+=5) {
        if (dist(x,y,blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).x,blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).y) <= radius) {
          if (blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).getType() > 0) {
            terrainHit(blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)));
          }
        }
      }
    }
    for (Snake a : EverySnake) {
      if (dist(x,y,a.x,a.y) <= radius) {
        println("Hit snake for " + onHit(a) + " damage!");
      }
    }
  }
  
  int getType() {
    return type;
  }
  
  // Projectiles could override this and call super in their override and add other effects
  int onHit(Snake target) {
    int damageDealt = damage;
    if (dist(x,y,target.x,target.y) > radius / 2) {
      damageDealt = (int)(damage * ((radius * 1.5 - dist(x,y,target.x,target.y)) / radius));
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
