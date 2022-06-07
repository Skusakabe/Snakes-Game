public class BasicShot extends Projectile {
  BasicShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float volume) {
    super(xPos, yPos, angle, power, newRadius, newDamage, volume);
    volume = 0.3;
    type = 1;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
