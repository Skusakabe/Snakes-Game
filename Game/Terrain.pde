class Terrain {
  int size, x, y;
  int id;
  int health;
  boolean permeable;
  PImage texture;
  //id -1 = background;
  //id 0 = air;
  //id 1 = dirt;
  //id 2 = earth;
  public Terrain(int id, int x, int y) {
    this.x = x;
    this.y = y;
    this.id = id;
    if (id == -1) {
      health = 1;
      permeable = true;
      size = 5000;
      texture = loadImage("Background.png");
      texture.resize(1200, 600);
    } else if (id == 0) {
      permeable = true;
      size = 5;
      texture = loadImage("Air.png");
    } else {
      size = 5;
      permeable = false;
      if (id == 1) {
        health = 1;
        texture = loadImage("Dirt.png");
      } else if (id  == 2) {
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

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  void changeType(int newType) {
    id = newType;
    if (id == 0) {
      permeable = true;
      texture = loadImage("Air.png");
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

  void display() {
    image(texture, x, y);
  }
}
