class Snake{
  private int health, movement_Radius, x, y;
  private boolean dead;
  public Snake(int H, int M, int x, int y){
    health = H;
    movement_Radius = M;
    this.x = x;
    this.y = y;
    dead = false;
  }
  public Snake(int x, int y){
    health = 100;
    movement_Radius = 100;
     this.x = x;
     this.y = y;
     dead = false;
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
  
}
