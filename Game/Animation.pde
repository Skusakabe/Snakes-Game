//For now this is only for projectile explosions, if we decide to add more animations, we can change this to an abstract class and create subclasses for the different animations.
public class Animation {
  int x;
  int y;
  int radius;
  int timer;
  
  Animation(int newX, int newY, int newRadius) {
    x = newX;
    y = newY;
    radius = newRadius;
    timer = 0;
  }
  
  void animate() {
    noStroke();
    fill(255, 128, 0);
    ellipse(x, y, radius*1/5, radius*1/5);
    if (timer > 4 && timer < 36) {
      fill(204, 0, 0);
      ellipse(x, y, radius*2/5, radius*2/5);
    }
    if (timer > 8 && timer < 32) {
      fill(255, 128, 0);
      ellipse(x, y, radius*3/5, radius*3/5);
    }
    if (timer > 12 && timer < 28) {
      fill(204, 0, 0);
      ellipse(x, y, radius*4/5, radius*4/5);
    }
    if (timer > 16 && timer < 24) {
      fill(255, 128, 0);
      ellipse(x, y, radius, radius);
    }
    timer++;
  }
  
  int getTimer() {
    return timer;
  }
}
