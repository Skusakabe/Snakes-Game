public class HomingShot extends Projectile {
  HomingShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 7;
  }

  boolean projectilePhysics() {
    if (turn == player1) {
      for (Snake a : player2.team) {
        if (dist(x, y, a.x, a.y) <= 100) {
          xSpeed += dist(x, 0, a.x, 0) * 0.03;
          ySpeed += dist(0, y, 0, a.y) * 0.03;
          return super.projectilePhysics();
        } else {
          return super.projectilePhysics();
        }
      }
    } else {
      for (Snake a : player1.team) {
        if (dist(x, y, a.x, a.y) <= 100) {
          xSpeed += dist(x, 0, a.x, 0) * 0.03;
          ySpeed += dist(0, y, 0, a.y) * 0.03;
          return super.projectilePhysics();
        } else {
          return super.projectilePhysics();
        }
      }
    }
    return false;
  }

  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
