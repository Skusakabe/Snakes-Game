abstract class Projectile {
  int radius;
  int damage;
  int x;
  int y;
  double xSpeed;
  double ySpeed;
  
  public abstract void onHit();
  public abstract void terrainHit();
  
  Projectile(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    x = xPos;
    y = yPos;
    xSpeed = 2 * Math.cos(angle) * power;
    ySpeed = 2 * Math.sin(angle) * power;
    radius = newRadius;
    damage = newDamage;
  }
  
  void projectilePhysics()
}
