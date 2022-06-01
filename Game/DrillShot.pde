public class DrillShot extends Projectile{
  DrillShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 6;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
