public class HomingShot extends Projectile {
  boolean lockOn;
  double lockedX;
  double lockedY;

  HomingShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 7;
    lockOn = false;
    lockedX = 0;
    lockedY = 0;
  }

  boolean projectilePhysics() {
    int smallestDist = 80;
    int xDist = 0;
    int yDist = 0;
    if (turn == player1 && !lockOn) {
      for (Snake a : player2.team) {
        if (dist(x, y, a.x, a.y) < smallestDist) {
          smallestDist = (int)dist(x, y, a.x, a.y);
          xDist = a.x - x;
          yDist = a.y - y;
        } else {
          return super.projectilePhysics();
        }
        if (smallestDist < 80) {
          lockOn = true;
          lockedX = xDist / 15;
          lockedY = yDist / 15;
          return super.projectilePhysics();
        }
      }
    } else if (!lockOn) {
      for (Snake a : player1.team) {
        if (dist(x, y, a.x, a.y) < smallestDist) {
          smallestDist = (int)dist(x, y, a.x, a.y);
          xDist = a.x - x;
          yDist = a.y - y;
        } else {
          return super.projectilePhysics();
        }
      }
      if (smallestDist < 80) {
        lockOn = true;
        lockedX = xDist / 15;
        lockedY = yDist / 15;
        return super.projectilePhysics();
      }
    }
    return false;
  }

  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
