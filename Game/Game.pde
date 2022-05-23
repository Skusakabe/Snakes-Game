static double GRAV = 4.0;
BasicShot test;

void setup() {
  size(1200,600);
  test = new BasicShot(20,600,45,30,10,10);
}

void draw() {
  test.projectilePhysics();
  test.display();
}
