class Snake {
  int angle, power;
  private int health, movement_Radius, x, y, spotLeft;
  private PImage model;
  int team;
  boolean moveYet;
  boolean shootYet;
  public Snake(int H, int M, int x, int y, int team, String mod){
    health = H;
    movement_Radius = M;
    this.x = x;
    this.y = y; 
    model = loadImage(mod);
    model.resize(20, 20);
    moveYet = false;
    shootYet = false;
    spotLeft = movement_Radius;
    angle = 45;
    power = 50;
  }
  public Snake(int x, int y, int team, String mod){
      model = loadImage(mod);
    health = 100;
    movement_Radius = 100;
     this.x = x;
     this.y = y;
     this.team = team;
     model.resize(20, 20);
     moveYet = false;
     shootYet = false;
     spotLeft = movement_Radius;
     angle = 45;
     power = 50;
    }
  public void setRadius(int x){
    movement_Radius = x;
  }
  public void setHealth(int x){
  health = x;}
  public void reset(){
    moveYet = false;
    shootYet = false;
    spotLeft = movement_Radius;
  }
  public int getHealth() {
    return health;
  }
  public void takeDamage(int dam) {
    health -= dam;
  }

  public void displayRad(){     //<>//
    stroke(color(0,200,0));     //<>//
    tint(255,255);
    circle(x-10, y-10, movement_Radius);
  }      //<>//
  boolean isin(int m1, int m2){      //<>//
    return(((m1 >= x)&&(m1 <= x+20))&&((m2 >= y)&&(m2 <= y+20)));
  }
  public void display() {   //<>//
    image(model, x, y);    //<>//
  }
   boolean highestBlock(){
     for(int k = 0; k < tileSize * 4; k+= tileSize){
       Terrain temp = blocks.get((((y+tileSize * 4)/tileSize)*(GAMEWIDTH/tileSize))+((x + k)/tileSize));
       if(temp.id > 0){
         return true;    //<>//
       }
     }    //<>//
     return false;
  }
  boolean rightBlock(){
     for(int k = 0; k < tileSize * 4; k+= tileSize){
       Terrain temp = blocks.get((((y+k)/tileSize)*(GAMEWIDTH/tileSize))+((x + tileSize * 4)/tileSize));   //<>//
       if(temp.id > 0){    //<>//
         return true;     //<>//
       }    //<>//
     }    //<>//
     return false;
  } 
  boolean leftBlock(){
     for(int k = 0; k < tileSize * 4; k+= tileSize){
       Terrain temp = blocks.get((((y+k)/tileSize)*(GAMEWIDTH/tileSize))+((x)/tileSize));
       if(temp.id > 0){
         return true;   //<>//
       }
     }   //<>//
     return false;
  }
  // Returns a projectile based on the parameters, this will be added to the active
  // projectile ArrayList, where draw() will make the projectile do its stuff.  //<>//
  /*   //<>//
  ProjectileID's:   //<>//
  1) BasicShot   //<>//
  2) DirtShot   //<>//
  3) BigShot  //<>//
  4) GroundRemover
  5) ScatterShot
  6) DrillShot
  7) HomingShot
  8) TrailShot
  9) CarpetBomber
  10) Nuke
  11) SpiderShot
  12) Blunderbuss
  */   //<>//
  public Projectile shoot(int angle, int power, int ProjectileID) {   //<>//
    if (ProjectileID == 12) {
      PEW.play(1, 0.4);
    }
    else {
      PEW.play(1, 0.9);
    }
    if (ProjectileID == 1) { 
      return new BasicShot(x, y, angle, power, 30, 25, 0.35); 
    }
    if (ProjectileID == 2) {
      return new DirtShot(x, y, angle, power, 45, 0, 0.35);
    }
    if (ProjectileID == 3) {
      return new BigShot(x, y, angle, power, 50, 30, 0.35);
    }
    if (ProjectileID == 4) {
      return new GroundRemover(x, y, angle, power, 60, 0, 0.35);
    }
    if (ProjectileID == 5) {
      return new ScatterShot(x, y, angle, power, 20, 20, 0.35);
    }
    if (ProjectileID == 6) {
      return new DrillShot(x, y, angle, power, 25, 20, 0.4);
    }
    if (ProjectileID == 7) {
      return new HomingShot(x, y, angle, power, 40, 25, 0.35);
    }
    if (ProjectileID == 8) {
      return new TrailShot(x, y, angle, power, 30, 20, 0.35);
    }
    if (ProjectileID == 9) {
      return new CarpetBomber(x, y, angle, power, 30, 20, 0.35);
    }
    if (ProjectileID == 10) {
      return new Nuke(x, y, angle, power, 90, 35, 0.6);
    }
    if (ProjectileID == 11) {
      return new SpiderShot(x, y, angle, power, 20, 10, 0.35);
    }
    if (ProjectileID == 12) {
      return new Blunderbuss(x, y, angle + (int)random(-20,20), power + (int)random(-10,10), 20, 15, 0.2);
    }
    return new BasicShot(x, y, angle, power, 30, 30, 0.35);
  }
}
