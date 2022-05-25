public abstract class Projectile implements Everything, Cloneable{
  int radius;
  int damage;
  int x;
  int y;
  double xSpeed;
  double ySpeed;
  PShape sprite;
  
  // Will take a Snake as a parameter.
  public abstract void onHit(Snake target);
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
    sprite = createShape(ELLIPSE,0,0,40,20);
    sprite.setFill(color(0));
  }
  void spawn(int xPos, int yPos, int angle, int power){
    x = xPos;
    y = yPos;
    xSpeed = 2 * Math.cos(radians(angle)) * power;
    ySpeed = 2 * -Math.sin(radians(angle)) * power;
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
    float orientation = -1 * atan((float)((-1 * ySpeed) / xSpeed));
    sprite.resetMatrix();
    sprite.rotate(orientation);
    shape(sprite,x,y);
  }
  void deleteDisplay(){
    
  }
}
