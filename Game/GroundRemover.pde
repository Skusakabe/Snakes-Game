public class GroundRemover extends Projectile{
  GroundRemover(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float volume) {
    super(xPos, yPos, angle, power, newRadius, newDamage, volume);
    type = 4;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
