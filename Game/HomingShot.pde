public class HomingShot extends Projectile {
  boolean lockOn;
  Snake target;

  HomingShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 7;
    lockOn = false;
  }

  boolean projectilePhysics() {
    int smallestDist = 80;
    float angleToTarget = 0;
    if (turn == player1 && !lockOn) {
      for (Snake a : player2.team) {
        if (dist(x, y, a.x, a.y) < 80) {
          smallestDist = (int)dist(x, y, a.x, a.y);
          target = a;
        }
      }
      if (smallestDist < 80) {
        lockOn = true;
      } else {
        return super.projectilePhysics();
      }
    } else if (!lockOn) {
      for (Snake a : player1.team) {
        if (dist(x, y, a.x, a.y) < 80) {
          smallestDist = (int)dist(x, y, a.x, a.y);
          target = a;
        }
      }
      if (smallestDist < 80) {
        lockOn = true;
      } else {
        return super.projectilePhysics();
      }
    } else {
      xSpeed = dist(x, 0, target.x, 0) * 0.1 + 3 * abs(dist(x, 0, target.x, 0)) / dist(x, 0, target.x, 0);
      ySpeed = dist(y, 0, target.y, 0) * 0.1 + 3 * abs(dist(x, 0, target.x, 0)) / dist(x, 0, target.x, 0);
      if (target.isin(x, y)) {
        scanEffectRadius();
        return true;
      }
      return super.projectilePhysics();
    }
    return false;
  }

  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
