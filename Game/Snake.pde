class Snake{
  private int health, movement_Radius, x, y;
  private boolean dead;
  private PImage model;
  public Snake(int H, int M, int x, int y){
    health = H;
    movement_Radius = M;
    this.x = x;
    this.y = y;
    dead = false;
    model = loadImage("Snake1.png");
  }
  public Snake(int x, int y){
    health = 100;
    movement_Radius = 100;
     this.x = x;
     this.y = y;
     dead = false;
     model = loadImage("Snake1.png");
    }
  public int getHealth(){
    return health;
  }
  public void die(){
    dead = true;
  }
  public void takeDamage(int dam){
    health -= dam;
    if(health <= 0){
      die();
    }
  }
  public void displayRad(){
    stroke(color(0,200,0));
    tint(255,255);
    circle(x, y, movement_Radius);
  }
  public void display(){
    image(model, x, y);
  }
  // Returns a projectile based on the parameters, this will be added to the active
  // projectile ArrayList, where draw() will make the projectile do its stuff.
  public Projectile shoot(int angle, int power, int projectileID, boolean spawned){ 
    if (projectileID == 1) {
      return BasicShot(x,y,angle,power,30,30);
    }
    return BasicShot(x,y,angle,power,30,30);
  }
}
}
