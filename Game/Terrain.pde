class Terrain{
  int size, x, y;
  int id;
  int health;
  boolean permeable;
  PImage texture;
  //id 0 = background;
  //id 1 = dirt;
  //id 2 = earth;
  //id 3 = air;
  public Terrain(int id, int x, int y){
    this.x = x;
    this.y = y;
    this.id = id;
    if(id == 0){
      health = 1;
      permeable = false;
      size = 5000;
      texture = loadImage("Background.png");
      texture.resize(1200,600);
    }else{
      size = 5;
      permeable = true;
      if(id == 1){
        health = 1;
        texture = loadImage("Dirt.png");
      }else if(id  == 2){
        health = 100;
        texture = loadImage("Rock.png");
      }else if(id == 3){
        health = 1;
        texture = loadImage("Air.png");
      }
    }
  }
  int getType() {
    return id;
  }
  
  void changeType(int newType) {
    id = newType;
    if (id == 0) {
      permeable = true;
    }
    
    if (id == 1) {
      permeable = false;
      texture = loadImage("Dirt.png");
    }
    if (id == 2) {
      permeable = false;
      texture = loadImage("Rock.png");
    }
    if (id == 3) {
      permeable = true;
      texture = loadImage("Air.png");
    }
  }
  
  void display(){
    image(texture, x, y);
  }
}
