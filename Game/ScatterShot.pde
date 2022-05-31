public class ScatterShot extends Projectile implements Everything {
  ScatterShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 5;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
