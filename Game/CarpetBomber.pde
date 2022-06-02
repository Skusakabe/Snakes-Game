public class CarpetBomber extends Projectile{
  int internalTimer;
  CarpetBomber(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 9;
    internalTimer = 0;
  }
  
  boolean projectilePhysics() {
    if (internalTimer == 4) {
      internalTimer = 0;
    }
    else {
      internalTimer++;
    }
    return super.projectilePhysics();
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
