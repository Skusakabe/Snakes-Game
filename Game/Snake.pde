class Snake implements Everything{
  private int health, movement_Radius, x, y;
  private boolean dead;
  private PImage model;
  int team;
  public Snake(int H, int M, int x, int y, int team){
    health = H;
    movement_Radius = M;
    this.x = x;
    this.y = y;
    this.team = team;
    dead = false;
    model = loadImage("Snake1.png");
    model.resize(20, 20);
  }
  public Snake(int x, int y, int team){
    health = 100;
    movement_Radius = 100;
     this.x = x;
     this.y = y;
     this.team = team;
     dead = false;
     model = loadImage("Snake1.png");
     model.resize(20, 20);
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
    circle(x-10, y-10, movement_Radius);
  }
  boolean isin(int m1, int m2){ //<>//
    return(((m1 >= x)&&(m1 <= x+20))&&((m2 >= y)&&(m2 <= y+20)));
  }
  public void display(){
    image(model, x, y); //<>//
  } //<>//
 //<>//
  // Returns a projectile based on the parameters, this will be added to the active
  // projectile ArrayList, where draw() will make the projectile do its stuff. //<>//
  // Creates a new projectile based on the parameters, which will be added to the
  // active projectile ArrayList later where draw() will make it do its stuff. //<>//
  public Projectile shoot(int angle, int power, int ProjectileID){  //<>//
    if (ProjectileID == 1) {  //<>//
      return new BasicShot(x,y,angle,power,30,30);  //<>//
    }
    return new BasicShot(x,y,angle,power,30,30);
}
  }
