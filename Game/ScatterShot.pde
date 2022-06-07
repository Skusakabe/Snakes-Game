public class ScatterShot extends Projectile{
  ScatterShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float volume) {
    super(xPos, yPos, angle, power, newRadius, newDamage, volume);
    type = 5;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
