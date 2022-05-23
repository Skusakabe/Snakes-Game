abstract class Projectile {
  int radius;
  int damage;
  int x;
  int y;
  double xSpeed;
  double ySpeed;
  static double GRAV = 4.0;
  
  public abstract void onHit();
  public abstract void terrainHit();
  
  /*
  The number before the sin/cos is just a random constant
  that can be changed as seen fit.
  */
  Projectile(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    x = xPos;
    y = yPos;
    xSpeed = 2 * Math.cos(angle) * power;
    ySpeed = 2 * -Math.sin(angle) * power;
    radius = newRadius;
    damage = newDamage;
  }
  
  void projectilePhysics() {
    x += xSpeed;
    y += ySpeed;
    ySpeed += GRAV;
  }
}
