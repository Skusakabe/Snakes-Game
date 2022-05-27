class Snake implements Everything {
  private int health, movement_Radius, x, y;
  private PImage model;
  public Snake(int H, int M, int x, int y) {
    health = H;
    movement_Radius = M;
    this.x = x;
    this.y = y;
    model = loadImage("Snake1.png");
    model.resize(20, 20);
  }
  public Snake(int x, int y) {
    health = 100;
    movement_Radius = 100;
    this.x = x;
    this.y = y;
    model = loadImage("Snake1.png");
    model.resize(20, 20);
  }
  public int getHealth() {
    return health;
  }
  public void takeDamage(int dam) {
    health -= dam;
  }
  public void displayRad() {
    stroke(color(0, 200, 0));
    tint(255, 255);
    circle(x, y, movement_Radius);
  }
  public void display() {
    image(model, x, y);
  }
  //<>//
  // Returns a projectile based on the parameters, this will be added to the active
  // projectile ArrayList, where draw() will make the projectile do its stuff. //<>//
  /*
  ProjectileID's:
  1) BasicShot
  2) DirtShot
  */ //<>//
  public Projectile shoot(int angle, int power, int ProjectileID) {  //<>//
    if (ProjectileID == 1) {  //<>//
      return new BasicShot(x, y, angle, power, 30, 30);  //<>//
    }
    if (ProjectileID == 2) {
      return new DirtShot(x, y, angle, power, 45, 0);
    }
    return new BasicShot(x, y, angle, power, 30, 30);
  }
}
