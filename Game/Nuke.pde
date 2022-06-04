public class Nuke extends Projectile {
  Nuke(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 10;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
