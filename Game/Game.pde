 //<>// //<>// //<>// //<>//
 UI UI;
Controller keyboardInput;
static double GRAV = 4.0;
Snake toMove;
BasicShot test;
boolean move, readyToMove;
int timer, newx, newy;
ArrayList<Snake> EverySnake = new ArrayList<Snake>();
ArrayList<Terrain> blocks = new ArrayList<Terrain>();
ArrayList<Everything> Elements = new ArrayList<Everything>();
ArrayList<Projectile> Bullets = new ArrayList<Projectile>();
//eventually with Random map, edit uppercord to check for bounds.
ArrayList<Integer> uppercord = new ArrayList<Integer>();
Player player1;
Player player2;
Player turn;
void setup(){
  move = true;
  player1 = new Player(1);
  player2 = new Player(2);
  player1.addSnake(3, "SnakeRed.png");
  player2.addSnake(3, "SnakeBlue.png");
  turn = player1;
  timer = 0;
  for(Snake a:EverySnake){
    a.display();
  }
  Terrain background = new Terrain(0, 0, 0);
  blocks.add(background);
  for(int j = height - 5; j >= 400; j-=5){
    for(int k = 0; k < width; k+=5){
      Terrain block = new Terrain(1, k, j);
      block.display();
      blocks.add(block);
    }
  }
  keyboardInput = new Controller();
  size(1500,600);
  test = new BasicShot(60,600,45,30,10,10);
  UI = new UI();
}

void keyPressed() {
    keyboardInput.press(keyCode);
  }
void keyReleased() {
    keyboardInput.release(keyCode);
  }
void mouseReleased(){
  if(move){
    for(Snake a:turn.team){
      if(a.moveYet == false){
        if(a.isin(mouseX, mouseY)){
          toMove = a;
          move = false;
          break;
        }
      }
    }
    move = true;
   }else{
     //if(dist()){
     //}
   }
}
void draw() {
  if(keyboardInput.isPressed(Controller.D)){
    if((toMove.spotLeft) > 0){
      if((toMove.x < width)){
        toMove.x += 3;
        toMove.spotLeft = toMove.spotLeft - 3;
      }
    }
  }
  if(keyboardInput.isPressed(Controller.A)){
    if((toMove.spotLeft) > 0){
      if((toMove.x > 0)){
        toMove.x -= 3;
        toMove.spotLeft = toMove.spotLeft - 3;
      }
    }
  }
      
  background(255);
  test.projectilePhysics();
  test.display();
  ArrayList<Projectile> Bullets2 = new ArrayList<Projectile>();
  //Copying Array Over to a second Array
  //running and displaying bullet on path
   for(Terrain a: blocks){
     a.display();
   }
  for(Projectile a: Bullets){
    Bullets2.add(a);
    if (timer == 2) {
      a.projectilePhysics();
    }
    a.terrainHit(blocks.get((int)random(100)));
    a.display();
    if(a.y > 400){
      Bullets2.remove(a);
    }
  }
  Bullets = Bullets2;
  if (timer == 2) {
    timer = 0;
  }
  else {
    timer++;
  }
  for(Snake a:EverySnake){
    a.display();
  }  
  UI.basicUI(1100, 0);
}
