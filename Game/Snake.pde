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
  //Spawns a projectile object 
  public void shoot(int angle, int power, Projectile ammo, boolean spawned){ 
    if(spawned == false){
      ammo.spawn(x, y, angle, power);
      spawned = true;
    }
    //replace 0 with terrain. 
    while(ammo.y < 600){
    ammo.projectilePhysics();
    ammo.display();
    print(" " + ammo.y);
  }
}
}
