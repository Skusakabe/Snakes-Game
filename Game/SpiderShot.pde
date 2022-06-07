public class SpiderShot extends Projectile{
  Snake closestInRange;
  
  SpiderShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float volume) {
    super(xPos, yPos, angle, power, newRadius, newDamage, volume);
    type = 11;
  }
  
  boolean projectilePhysics() {
    int smallestDist = 100;
    if (turn == player1) {
      for (Snake a : player2.team) {
        if (dist(x, y, a.x, a.y) < smallestDist) {
          smallestDist = (int)dist(x, y, a.x, a.y);
          closestInRange = a;
        }
      }
      if (smallestDist < 100) {
        return true;
      } else {
        return super.projectilePhysics();
      }
    } else {
      for (Snake a : player1.team) {
        if (dist(x, y, a.x, a.y) < smallestDist) {
          smallestDist = (int)dist(x, y, a.x, a.y);
          closestInRange = a;
        }
      }
      if (smallestDist < 100) {
        return true;
      } else {
        return super.projectilePhysics();
      }
    }
  }
  
  boolean getSpecial() {
    return closestInRange != null;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
