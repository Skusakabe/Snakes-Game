class Terrain{
  int size, x, y;
  int id;
  int health;
  boolean permable;
  PImage texture;
  boolean destroyed;
  //id 0 = air;
  //id 1 = dirt;
  //id 2 = earth;
  public Terrain(int id, int x, int y){
    this.x = x;
    this.y = y;
    this.id = id;
    destroyed = false;
    if(id == 0){
      health = 1;
      permable = false;
      size = 5000;
      texture = loadImage("Background.png");
      texture.resize(1200,600);
    }else{
      size = 5;
      permable = true;
      if(id == 1){
        health = 1;
        texture = loadImage("Dirt.png");
      }else if(id  == 2){
        health = 100;
        texture = loadImage("Rock.png");
      }
    }
  }
  void display(){
    image(texture, x, y);
  }
  void die(){
    destroyed = true;
}
}
