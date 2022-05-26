 //<>// //<>// //<>//
static double GRAV = 4.0;
Snake TestSnake;
BasicShot test;
boolean f;
ArrayList<Snake> EverySnake = new ArrayList<Snake>();
ArrayList<Terrain> blocks = new ArrayList<Terrain>();
ArrayList<Everything> Elements = new ArrayList<Everything>();
ArrayList<Projectile> Bullets = new ArrayList<Projectile>();
//eventually with Random map, edit uppercord to check for bounds.
ArrayList<Integer> uppercord = new ArrayList<Integer>();
void setup(){
  Terrain background = new Terrain(0, 0, 0);
  blocks.add(background);
  for(int j = height - 5; j >= 400; j-=5){
    for(int k = 0; k < width; k+=5){
      Terrain block = new Terrain(2, k, j);
      block.display();
      blocks.add(block);
    }
    //print(" " + j);
  }
  f = true;
  size(1200,600);
  test = new BasicShot(60,600,45,30,10,10);
  TestSnake = new Snake(50, 350);
}
void keyPressed(){
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
   for(Terrain a: blocks){
     a.display();
   }
  //print(TestSnake.getHealth());
  test.onHit(TestSnake);
    TestSnake.display();
    for(Projectile a: Bullets){
     Bullets2.add(a);
     a.projectilePhysics();
     a.display();
   if(a.y > 400){
     Bullets2.remove(a);
   }
   }
   Bullets = Bullets2;
  //println(" " + TestSnake.getHealth());
}
