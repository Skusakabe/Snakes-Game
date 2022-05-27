public abstract class Projectile implements Everything, Cloneable {
  int radius;
  int damage;
  int x;
  int y;
  double xSpeed;
  double ySpeed;
  PShape sprite;

  // Will take a Snake as a parameter.
  public abstract void onHit(Snake target);
  // Will take the Terrain ArrayList as a parameter and an index corresponding to the target Terrain.
  public abstract void terrainHit(Terrain target);

  /*
  The number before the sin/cos is just a random constant
   that can be changed as seen fit.
   Radius should be a multiple of 5.
   */
  Projectile(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    x = xPos;
    y = yPos;
    xSpeed = 0.8 * Math.cos(radians(angle)) * power;
    ySpeed = 0.8 * -Math.sin(radians(angle)) * power;
    radius = newRadius;
    damage = newDamage;
    sprite = createShape(ELLIPSE, 0, 0, 20, 10);
    sprite.setFill(color(0));
  }

  boolean projectilePhysics() {
    x += xSpeed;
    y += ySpeed;
    ySpeed += GRAV;
    if (x > width - 25 || y > height - 15 || x < 25 || y < 15) {
      scanEffectRadius();
      print("a");
      return true;
    }
    for (int j = (y / 5) * 5; j < (y / 5) * 5 + 15; j+=5) { 
      for (int i = (x / 5) * 5; i < (x / 5) * 5 + 25; i+=5) {
        if (blocks.get((j / 5) * (width / 5) + (i / 5)).x == i && blocks.get((j / 5) * (width / 5) + (i / 5)).y == j) {
          if (blocks.get((j / 5) * (width / 5) + (i / 5)).getType() > 0) {
            scanEffectRadius();
            print("a");
            return true;
          }
        }
      }
    }
    return false;
  }

  /* Once other classes are made, checks for terrain
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
    if (x + radius >= width) {
      xEnd = width - 5;
    }
    if (y < radius) {
      yStart = 0;
    }
    if (y + radius >= height) {
      yEnd = height - 5;
    }
    for (int j = yStart; j < yEnd; j+=5) {
      for (int i = xStart; i < xEnd; i+=5) {
        if (dist(x,y,blocks.get((j / 5) * (width / 5) + (i / 5)).x,blocks.get((j / 5) * (width / 5) + (i / 5)).y) <= radius) {
          if (blocks.get((j / 5) * (width / 5) + (i / 5)).getType() > 0) {
            terrainHit(blocks.get((j / 5) * (width / 5) + (i / 5)));
          }
        }
      }
    }
  }

  //Later replace the shape with a (hopefully imported) image.
  void display() {
    float orientation = -1 * atan((float)((-1 * ySpeed) / xSpeed));
    sprite.resetMatrix();
    sprite.rotate(orientation);
    shape(sprite, x, y);
  }
}
