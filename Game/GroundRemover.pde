public class GroundRemover extends Projectile implements Everything {
  GroundRemover(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
