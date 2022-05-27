//<>// //<>//
static double GRAV = 1;
Snake TestSnake;
int timer;
Terrain background;
ArrayList<Terrain> blocks = new ArrayList<Terrain>();
ArrayList<Everything> Elements = new ArrayList<Everything>();
ArrayList<Projectile> Bullets = new ArrayList<Projectile>();
boolean overAngle;
boolean overPower;
boolean overShoot;
int angleX;
int angleY;
int angleRectX;
int angleRectY;
int powerX;
int powerY;
int powerRectX;
int powerRectY;
int shootX;
int shootY;
int shootRectX;
int shootRectY;

void setup() {
  timer = 0;
  background = new Terrain(-1, 0, 0);
  for (int j = 0; j < 400; j+=5) {
    for (int k = 0; k < width; k+=5) {
      Terrain block = new Terrain(0, k, j);
      block.display();
      blocks.add(block);
    }
  }
  for (int j = 400; j < height; j+= 5) {
    for (int k = 0; k < width; k+=5) {
      Terrain block = new Terrain(2, k, j);
      block.display();
      blocks.add(block);
    }
  }
  size(1200, 600);
  TestSnake = new Snake(50, 350);
}
void keyPressed() {
  Bullets.add(TestSnake.shoot(45, 30, 1));
}
void draw() {
  background(255);
  //print(" " + test.x);
  ArrayList<Projectile> Bullets2 = new ArrayList<Projectile>();
  //Copying Array Over to a second Array
  //running and displaying bullet on path
  background.display();
  for (Terrain a : blocks) {
    a.display();
  }
  //print(TestSnake.getHealth());
  TestSnake.display();
  for (Projectile a : Bullets) {
    Bullets2.add(a);
    if (a.projectilePhysics()) {
      Bullets2.remove(a);
    } else {
      a.display();
    }
  }
  Bullets = Bullets2;
  //println(" " + TestSnake.getHealth());
}

void update() {
  if ( hoveringButton(angleX, angleY, angleRectX, angleRectY) ) {
    overAngle = true;
    overPower = false;
    overShoot = false;
  } else if ( hoveringButton(powerX, powerY, powerRectX, powerRectY) ) {
    overAngle = false;
    overPower = true;
    overShoot = false;
  } else if ( hoveringButton(shootX, shootY, shootRectX, shootRectY) ) {
    overAngle = false;
    overPower = false;
    overShoot = true;
  } else {
    overAngle = overPower = overShoot = false;
  }
}

/*
Use multiple times in update for the different buttons on the screen.
 */
boolean hoveringButton(int x, int y, int rectWidth, int rectHeight) {
  if (mouseX >= x && mouseX <= x+rectWidth && 
    mouseY >= y && mouseY <= y+rectHeight) {
    return true;
  } else {
    return false;
  }
}
