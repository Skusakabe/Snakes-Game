public class Blunderbuss extends Projectile{
  Blunderbuss(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float volume) {
    super(xPos, yPos, angle, power, newRadius, newDamage, volume);
    volume = 0.2;
    type = 12;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
