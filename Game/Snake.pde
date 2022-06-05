class Snake {
  private int health, movement_Radius, x, y, spotLeft;
  private boolean dead;
  private PImage model;
  int team;
  boolean moveYet;
  boolean shootYet;
  public Snake(int H, int M, int x, int y, int team, String mod){
    health = H;
    movement_Radius = M;
    this.x = x;
    this.y = y; 
    dead = false;
    model = loadImage(mod);
    model.resize(20, 20);
    moveYet = false;
    shootYet = false;
    spotLeft = movement_Radius;
  }
  public Snake(int x, int y, int team, String mod){
      model = loadImage(mod);
    health = 100;
    movement_Radius = 100;
     this.x = x;
     this.y = y;
     this.team = team;
     dead = false;
     model.resize(20, 20);
     moveYet = false;
     shootYet = false;
     spotLeft = movement_Radius;
    }
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

  public void displayRad(){  //<>// //<>// //<>// //<>//
    stroke(color(0,200,0)); //<>// //<>// //<>// //<>// //<>//
    tint(255,255);
    circle(x-10, y-10, movement_Radius);
  } //<>// //<>// //<>// //<>// //<>// //<>//
  boolean isin(int m1, int m2){ //<>// //<>// //<>// //<>// //<>// //<>//
    return(((m1 >= x)&&(m1 <= x+20))&&((m2 >= y)&&(m2 <= y+20)));
  }
  public void display() { //<>// //<>// //<>//
    image(model, x, y); //<>// //<>// //<>// //<>//
  }
   boolean highestBlock(){
     for(int k = 0; k < tileSize * 4; k+= tileSize){
       Terrain temp = blocks.get((((y+tileSize * 4)/tileSize)*(GAMEWIDTH/tileSize))+((x + k)/tileSize));
       if(temp.id > 0){
         return true; //<>// //<>// //<>// //<>//
       }
     } //<>// //<>// //<>// //<>//
     return false;
  }
  boolean rightBlock(){
     for(int k = 0; k < tileSize * 4; k+= tileSize){
       Terrain temp = blocks.get((((y+k)/tileSize)*(GAMEWIDTH/tileSize))+((x + tileSize * 4)/tileSize)); //<>// //<>// //<>//
       if(temp.id > 0){ //<>// //<>// //<>// //<>//
         return true; //<>// //<>// //<>// //<>// //<>//
       } //<>// //<>// //<>// //<>//
     } //<>// //<>// //<>// //<>//
     return false;
  } 
  boolean leftBlock(){
     for(int k = 0; k < tileSize * 4; k+= tileSize){
       Terrain temp = blocks.get((((y+k)/tileSize)*(GAMEWIDTH/tileSize))+((x)/tileSize));
       if(temp.id > 0){
         return true; //<>// //<>// //<>//
       }
     } //<>// //<>// //<>//
     return false;
  }//<>//
  // Returns a projectile based on the parameters, this will be added to the active
  // projectile ArrayList, where draw() will make the projectile do its stuff. //<>// //<>//
  /* //<>// //<>// //<>//
  ProjectileID's: //<>// //<>// //<>//
  1) BasicShot //<>// //<>// //<>//
  2) DirtShot //<>// //<>// //<>//
  3) BigShot //<>// //<>//
  4) GroundRemover
  5) ScatterShot
  6) DrillShot
  7) HomingShot
  8) TrailShot
  9) CarpetBomber
  10) Nuke
  11) SpiderShot //<>//
  */ //<>// //<>// //<>//
  public Projectile shoot(int angle, int power, int ProjectileID) {  //<>// //<>//
    if (ProjectileID == 1) {  //<>//
      return new BasicShot(x, y, angle, power, 30, 25); 
    }
    if (ProjectileID == 2) {
      return new DirtShot(x, y, angle, power, 45, 0);
    }
    if (ProjectileID == 3) {
      return new BigShot(x, y, angle, power, 50, 35);
    }
    if (ProjectileID == 4) {
      return new GroundRemover(x, y, angle, power, 60, 0);
    }
    if (ProjectileID == 5) {
      return new ScatterShot(x, y, angle, power, 20, 20);
    }
    if (ProjectileID == 6) {
      return new DrillShot(x, y, angle, power, 25, 20);
    }
    if (ProjectileID == 7) {
      return new HomingShot(x, y, angle, power, 40, 25);
    }
    if (ProjectileID == 8) {
      return new TrailShot(x, y, angle, power, 30, 20);
    }
    if (ProjectileID == 9) {
      return new CarpetBomber(x, y, angle, power, 30, 20);
    }
    if (ProjectileID == 10) {
      return new Nuke(x, y, angle, power, 90, 40);
    }
    if (ProjectileID == 11) {
      return new SpiderShot(x, y, angle, power, 20, 10);
    }
    return new BasicShot(x, y, angle, power, 30, 30);
  }
}
