UI UI; //<>// //<>// //<>//
Controller keyboardInput;
Terrain background;
static double GRAV = 4.0;
Snake toMove;
BasicShot test;
boolean move, readyToMove;
int timer, newx, newy;
ArrayList<Snake> EverySnake = new ArrayList<Snake>();
ArrayList<Terrain> blocks = new ArrayList<Terrain>();
ArrayList<Everything> Elements = new ArrayList<Everything>();
ArrayList<Projectile> Bullets = new ArrayList<Projectile>();
int angle;
int power;
boolean overEndTurn;
boolean overSelect;
boolean overShoot;
static int endX = 1250;
static int endY = 150;
static int endRectX = 200;
static int endRectY = 100;
static int selectX = 1250;
static int selectY = 300;
static int selectRectX = 200;
static int selectRectY = 100;
static int shootX = 1250;
static int shootY = 450;
static int shootRectX = 200;
static int shootRectY = 100;
static int GAMEHEIGHT = 600;
static int GAMEWIDTH = 1200;
//eventually with Random map, edit uppercord to check for bounds.
ArrayList<Integer> uppercord = new ArrayList<Integer>();
Player player1;
Player player2;
Player turn;

void setup() {
  move = true;
  player1 = new Player(1);
  player2 = new Player(2);
  player1.addSnake(3, "SnakeRed.png");
  player2.addSnake(3, "SnakeBlue.png");
  turn = player1;
  timer = 0;
  for (Snake a : EverySnake) {
    a.display();
  }
  timer = 0;
  background = new Terrain(-1, 0, 0);
  for (int j = 0; j < GAMEHEIGHT; j+=5) {
    for (int k = 0; k < GAMEWIDTH; k+=5) {
      Terrain block = new Terrain(0, k, j);
      block.display();
      blocks.add(block);
    }
  }
  for (int j = 400; j < GAMEHEIGHT; j+= 5) {
    for (int k = 0; k < GAMEWIDTH; k+=5) {
      Terrain block = new Terrain(2, k, j);
      block.display();
      blocks.add(block);
    }
  }
  keyboardInput = new Controller();
  size(1500, 600);
  test = new BasicShot(60, 600, 45, 30, 10, 10);
  UI = new UI();
  fill(255);
  rect(endX, endY, endRectX, endRectY);
  rect(selectX, selectY, selectRectX, selectRectY);
  rect(shootX, shootY, shootRectX, shootRectY);
}

void keyPressed() {
  keyboardInput.press(keyCode);
}
void keyReleased() {
  keyboardInput.release(keyCode);
}
void mouseReleased() {
  if (move) {
    for (Snake a : turn.team) {
      if (a.moveYet == false) {
        if (a.isin(mouseX, mouseY)) {
          toMove = a;
          move = false;
          break;
        } else {
          if (!(overEndTurn || overSelect || overShoot)) {
            toMove = null;
          }
        }
      }
    }
    move = true;
  } else {
    //if(dist()){
    //}
  }
}
void draw() {
  update();
  if (keyboardInput.isPressed(Controller.D)) {
    if (toMove != null) {
      if ((toMove.spotLeft) > 0) {
        if ((toMove.x < width)) {
          toMove.x += 3;
          toMove.spotLeft = toMove.spotLeft - 3;
        }
      }
    }
  }
  if (keyboardInput.isPressed(Controller.A)) {
    if (toMove != null) {
      if ((toMove.spotLeft) > 0) {
        if ((toMove.x > 0)) {
          toMove.x -= 3;
          toMove.spotLeft = toMove.spotLeft - 3;
        }
      }
    }
  }

  background(255);
  ArrayList<Projectile> Bullets2 = new ArrayList<Projectile>();
  background.display();
  //Copying Array Over to a second Array
  //running and displaying bullet on path
  for (Terrain a : blocks) {
    a.display();
  }
  for (Projectile a : Bullets) {
    Bullets2.add(a);
    if (a.projectilePhysics()) {
      Bullets2.remove(a);
    } else {
      a.display();
    }
  }
  Bullets = Bullets2;
  if (timer == 2) {
    timer = 0;
  } else {
    timer++;
  }
  for (Snake a : EverySnake) {
    a.display();
  }  
  UI.basicUI(1200, 0);
  fill(255);
  rect(endX, endY, endRectX, endRectY);
  rect(selectX, selectY, selectRectX, selectRectY);
  rect(shootX, shootY, shootRectX, shootRectY);
}

void mousePressed() {
  if (overEndTurn) {
    //changes turn/goes to the next turn
  }
  if (overSelect) {
    //opens the weapon select screen
  }
  if (overShoot) {
    Bullets.add(toMove.shoot(45,20,1));
  }
}

void update() {
  if ( hoveringButton(endX, endY, endRectX, endRectY) ) {
    overEndTurn = true;
    overSelect = false;
    overShoot = false;
  } else if ( hoveringButton(selectX, selectY, selectRectX, selectRectY) ) {
    overEndTurn = false;
    overSelect = true;
    overShoot = false;
  } else if ( hoveringButton(shootX, shootY, shootRectX, shootRectY) ) {
    overEndTurn = false;
    overSelect = false;
    overShoot = true;
  } else {
    overEndTurn = overSelect = overShoot = false;
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
