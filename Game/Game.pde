 //<>// //<>//
static double GRAV = 4.0;
Snake TestSnake;
BasicShot test;
boolean f;
ArrayList<Everything> Elements = new ArrayList<Everything>();
 ArrayList<Projectile> Bullets = new ArrayList<Projectile>();
 
void setup() {
  f = true;
  size(1200,600);
  test = new BasicShot(60,600,45,30,10,10);
  TestSnake = new Snake(50, 500);
}
void keyPressed(){
   Bullets.add(TestSnake.shoot(45, 30, 1));
 }
void draw() {
  background(255);
  test.projectilePhysics();
  test.display();
  //print(" " + test.x);
  TestSnake.display();
  ArrayList<Projectile> Bullets2 = new ArrayList<Projectile>();
  //Copying Array Over to a second Array
  //running and displaying bullet on path
   for(Projectile a: Bullets){
     Bullets2.add(a);
     a.projectilePhysics();
     a.display();
   if(a.y > 600){
     Bullets2.remove(a);
   }
   }
   Bullets = Bullets2;
  print(TestSnake.getHealth());
  test.onHit(TestSnake);
  println(" " + TestSnake.getHealth());
}
