abstract class Projectile {
  int radius;
  int damage;
  int x;
  int y;
  double xSpeed;
  double ySpeed;
  static double GRAV = 4.0;
  
  // Will take a Snake as a parameter.
  public abstract void onHit();
  // Will take the Terrain ArrayList as a parameter and an index corresponding to the target Terrain.
  public abstract void terrainHit();
  
  /*
  The number before the sin/cos is just a random constant
  that can be changed as seen fit.
  */
  Projectile(int xPos, int yPos, int angle, int power, int newRadius, int newDamage) {
    x = xPos;
    y = yPos;
    xSpeed = 2 * Math.cos(radians(angle)) * power;
    ySpeed = 2 * -Math.sin(radians(angle)) * power;
    radius = newRadius;
    damage = newDamage;
  }
  
  // Later on, add collision detection.
  void projectilePhysics() {
    x += xSpeed;
    y += ySpeed;
    ySpeed += GRAV;
  }
  
  /* Once other classes are made, checks for terrain
  and snakes in the radius of the projectile and then
  calls onHit() or terrainHit() respectively on anything
  that is found.
  */
  void scanEffectRadius() {
    
  }
  
  //Later replace the shape with a (hopefully imported) image.
  void display() {
    fill(0);
    ellipse(x,y,80,40);
    float orientation = atan((float)((-1.0 * ySpeed) / xSpeed));
    rotate(orientation);
  }
}

void setup() {
  size(600,1200);
  Projectile test = new Projectile(80,1000,45,60,10,10);
}

void draw() {
  test.projectilePhysics();
  test.display();
}
