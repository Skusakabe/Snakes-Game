public class ScatterShot extends Projectile implements Everything {
  ScatterShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 5;
  }
  
  boolean projectilePhysics() {
    x += xSpeed;
    y += ySpeed;
    ySpeed += GRAV;
    if (x > GAMEWIDTH - 25 || y > GAMEHEIGHT - 15 || x < 25 || y < 15) {
      scanEffectRadius();
      return true;
    }
    for (int j = (y / 5) * 5; j < (y / 5) * 5 + 15; j+=5) { 
      for (int i = (x / 5) * 5; i < (x / 5) * 5 + 25; i+=5) {
        if (blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).x == i && blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).y == j) {
          if (blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).getType() > 0) {
            scanEffectRadius();
            return true;
          }
        }
      }
    }
    return false;
  }
  
  void terrainHit(Terrain target) {
    target.changeType(0);
  }
}
