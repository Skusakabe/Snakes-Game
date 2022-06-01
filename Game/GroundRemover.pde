public class GroundRemover extends Projectile{
  GroundRemover(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 4;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
