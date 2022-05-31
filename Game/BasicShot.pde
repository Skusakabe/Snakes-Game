public class BasicShot extends Projectile implements Everything {
  BasicShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 1;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
