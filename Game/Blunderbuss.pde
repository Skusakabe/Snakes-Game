public class Blunderbuss extends Projectile{
  Blunderbuss(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 12;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
