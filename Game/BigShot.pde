// This currently uses the exact same code as basic shot, but is just called with different parameters when made. However, it might have its own sprite later or something.
public class BigShot extends Projectile {
  BigShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 3;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
