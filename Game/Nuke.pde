public class Nuke extends Projectile {
  Nuke(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float volume) {
    super(xPos, yPos, angle, power, newRadius, newDamage, volume);
    volume = 0.8;
    type = 10;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
