static double GRAV = 4.0;
Snake TestSnake;
BasicShot test;
ArrayList<Everything> Elements = new ArrayList<Everything>();
ArrayList<Projectile> Bullets = new ArrayList<Projectile>();
 boolean f;
void setup() {
  frameRate(10);
  f = true;
  size(1200,600);
  test = new BasicShot(60,600,45,30,10,10);
  Elements.add(test);
  TestSnake = new Snake(50, 500);
  Elements.add(TestSnake);
}
void keyPressed(){
  Bullets.add(TestSnake.shoot(45, 30, test));
}
void draw() {
  background(255);
  print(Bullets.size());
  ArrayList<Projectile> Bullets2 = new ArrayList<Projectile>();;
  for(Projectile a: Bullets){
    Bullets2.add(a);
  }
  for(Projectile a: Bullets){
  print(1);
  a.projectilePhysics();
  a.display();
  if(a.y > 600){
    Bullets2.remove(a);
  }
  }
  Bullets = Bullets2;
  //print(" " + test.x);
  TestSnake.display();
  
  //print("k");
  f = false;
  
}
