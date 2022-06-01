public class DirtShot extends Projectile{
  DirtShot(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    super(xPos, yPos, angle, power, newRadius, newDamage);
    type = 2;
  }
  void terrainHit(Terrain target) {
    target.changeType(1);
  }
  
  void scanEffectRadius() {
    int xStart = (x / 5) * 5 - radius;
    int xEnd = xStart + 2 * radius;
    int yStart = (y / 5) * 5 - radius;
    int yEnd = yStart + 2 * radius;
    if (x < radius) {
      xStart = 0;
    }
    if (x + radius >= GAMEWIDTH) {
      xEnd = GAMEWIDTH - 5;
    }
    if (y < radius) {
      yStart = 0;
    }
    if (y + radius >= GAMEHEIGHT) {
      yEnd = GAMEHEIGHT - 5;
    }
    for (int j = yStart; j < yEnd; j+=5) {
      for (int i = xStart; i < xEnd; i+=5) {
        if (dist(x,y,blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).x,blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).y) <= radius) {
          if (blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)).getType() == 0) {
            terrainHit(blocks.get((j / 5) * (GAMEWIDTH / 5) + (i / 5)));
          }
        }
      }
    }
  }
}
