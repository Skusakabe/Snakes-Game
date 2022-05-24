static double GRAV = 4.0;
Snake TestSnake;
BasicShot test;
 boolean f;
void setup() {
  f = true;
  size(1200,600);
  test = new BasicShot(60,600,45,30,10,10);
  TestSnake = new Snake(50, 500);
}

void draw() {
  if(f){
  //test.projectilePhysics();
  //test.display();
  //print(" " + test.x);
  TestSnake.display();
  TestSnake.shoot(45, 30, test, false);
  print("k");
  f = false;
  }
}
