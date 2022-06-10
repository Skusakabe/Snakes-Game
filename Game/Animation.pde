//For now this is only for projectile explosions, if we decide to add more animations, we can change this to an abstract class and create subclasses for the different animations.
public class Animation {
  int x;
  int y;
  int radius;
  int timer;
  
  Animation(int newX, int newY, int newRadius) {
    x = newX;
    y = newY;
    radius = 2 * newRadius;
    timer = 0;
  }
  
  void animate() {
    noStroke();
    if (timer > 12 && timer < 23) {
      fill(255, 128, 0);
      ellipse(x, y, radius, radius);
    }
    if (timer > 9 && timer < 26) {
      fill(204, 0, 0);
      ellipse(x, y, radius*4/5, radius*4/5);
    }
    if (timer > 6 && timer < 29) {
      fill(255, 128, 0);
      ellipse(x, y, radius*3/5, radius*3/5);
    }
    if (timer > 3 && timer < 32) {
      fill(204, 0, 0);
      ellipse(x, y, radius*2/5, radius*2/5);
    }
    fill(255, 128, 0);
    ellipse(x, y, radius*1/5, radius*1/5);
    timer++;
    stroke(0);
  }
  
  int getTimer() {
    return timer;
  }
}
