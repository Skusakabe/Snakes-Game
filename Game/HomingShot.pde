public class HomingShot extends Projectile {
  boolean lockOn;
  Snake target;
  int timer;

  HomingShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float volume) {
    super(xPos, yPos, angle, power, newRadius, newDamage, volume);
    type = 7;
    lockOn = false;
    timer = -1;
  }

  HomingShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage, float volume, int t, Snake s) {
    super(xPos, yPos, angle, power, newRadius, newDamage, volume);
    type = 7;
    lockOn = false;
    timer = t;
    target = s;
  }

  boolean projectilePhysics() {
    int smallestDist = 80;
    float angleToTarget = 0;
    //These lines only matter for HomingShots made with the second constructor.
    if (timer > 0) {
      timer--;
    }
    if (timer == 0) {
      lockOn = true;
      angleToTarget = atan2((float)(y - target.y), (float)(target.x - x));
      xSpeed = 5 * cos(angleToTarget);
      ySpeed = 5 * -sin(angleToTarget);
    }
    
    if (turn == player1 && !lockOn) {
      for (Snake a : player2.team) {
        if (dist(x, y, a.x, a.y) < smallestDist) {
          smallestDist = (int)dist(x, y, a.x, a.y);
          target = a;
        }
      }
      if (smallestDist < 80) {
        lockOn = true;
        angleToTarget = atan2((float)(y - target.y), (float)(target.x - x));
        xSpeed = 3 * cos(angleToTarget);
        ySpeed = 3 * -sin(angleToTarget);
      } else {
        return super.projectilePhysics();
      }
    } else if (!lockOn) {
      for (Snake a : player1.team) {
        if (dist(x, y, a.x, a.y) < smallestDist) {
          smallestDist = (int)dist(x, y, a.x, a.y);
          target = a;
        }
      }
      if (smallestDist < 80) {
        lockOn = true;
        angleToTarget = atan2((float)(y - target.y), (float)(target.x - x));
        xSpeed = 3 * cos(angleToTarget);
        ySpeed = 3 * -sin(angleToTarget);
      } else {
        return super.projectilePhysics();
      }
    } else {
      angleToTarget = atan2((float)(y - target.y), (float)(target.x - x));
      xSpeed += 1 * cos(angleToTarget);
      ySpeed += 1 * -sin(angleToTarget);
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
