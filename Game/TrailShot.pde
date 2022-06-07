public class TrailShot extends Projectile{
  int internalTimer;
  
  TrailShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float volume) {
    super(xPos, yPos, angle, power, newRadius, newDamage, volume);
    type = 8;
    internalTimer = 0;
  }
  
  boolean projectilePhysics() {
    if (internalTimer == 9) {
      internalTimer = 0;
      specialActive = true;
    }
    else {
      internalTimer++;
      specialActive = false;
    }
    return super.projectilePhysics();
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
