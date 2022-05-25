public class BasicShot extends Projectile implements Everything{
  BasicShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos,yPos,angle,power,newRadius,newDamage);
  }
  void onHit(Snake target) {
    target.takeDamage(damage);
  }
  void terrainHit() {
    
  }
}
