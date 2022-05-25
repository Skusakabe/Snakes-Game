//<>// //<>//
static double GRAV = 4.0;
Snake TestSnake;
BasicShot test;
int timer;
boolean f;
Terrain background;
ArrayList<Terrain> blocks = new ArrayList<Terrain>();
ArrayList<Everything> Elements = new ArrayList<Everything>();
ArrayList<Projectile> Bullets = new ArrayList<Projectile>();

void setup() {
  timer = 0;
  background = new Terrain(-1, 0, 0);
  for (int j = 0; j < 400; j+=5) {
    for (int k = 0; k < width; k+=5) {
      Terrain block = new Terrain(0,k,j);
      block.display();
      blocks.add(block);
    }
  }
  for (int j = 400; j < height; j+= 5) {
    for (int k = 0; k < width; k+=5) {
      Terrain block = new Terrain(2,k,j);
      block.display();
      blocks.add(block);
    }
  }
  f = true;
  size(1200, 600);
  test = new BasicShot(60, 600, 45, 30, 10, 10);
  TestSnake = new Snake(50, 350);
}
void keyPressed() {
  Bullets.add(TestSnake.shoot(45, 30, 1));
}
void draw() {
  background(255);
  test.projectilePhysics();
  test.display();
  //print(" " + test.x);
  ArrayList<Projectile> Bullets2 = new ArrayList<Projectile>();
  //Copying Array Over to a second Array
  //running and displaying bullet on path
  background.display();
  for (Terrain a : blocks) {
    a.display();
  }
  //print(TestSnake.getHealth());
  test.onHit(TestSnake);
  TestSnake.display();
  for (Projectile a : Bullets) {
    Bullets2.add(a);
    if (timer == 2) {
      a.projectilePhysics();
    }
    a.terrainHit(blocks.get((int)random(200)));
    a.display();
    if (a.y > 400) {
      Bullets2.remove(a);
    }
  }
  Bullets = Bullets2;
  if (timer == 2) {
    timer = 0;
  } else {
    timer++;
  }

  //println(" " + TestSnake.getHealth());
}
