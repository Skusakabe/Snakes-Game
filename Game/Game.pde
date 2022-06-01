UI UI; //<>// //<>// //<>// //<>// //<>//
Controller keyboardInput;
Terrain background;
static double GRAV = 0.75;
int mode;
Snake toMove;
BasicShot test;
boolean move, readyToMove;
int timer, newx, newy, power, angle, upMove;
ArrayList<Snake> EverySnake = new ArrayList<Snake>();
ArrayList<Terrain> blocks = new ArrayList<Terrain>();
ArrayList<Everything> Elements = new ArrayList<Everything>();
ArrayList<Projectile> Bullets = new ArrayList<Projectile>();
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
int projID;
//eventually with Random map, edit uppercord to check for bounds.
ArrayList<Integer> uppercord = new ArrayList<Integer>();
Player player1;
Player player2;
Player turn;

void setup() {
  mode = 0;
  upMove = 0;
  //Change projID to match proj type with bullets;
  projID = 1;
  power = 20;
  angle = 45;
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
  for (int j = 0; j < 400; j+=5) {
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
  if (key == ' ') {
    if ((toMove != null)&&(!toMove.shootYet)) {
      Bullets.add(toMove.shoot(angle, power, projID));
      toMove.shootYet = true;
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      if (angle < 180) {
        angle++;
      }
    }
    if (keyCode == DOWN) {
      if (angle > 0) {
        angle--;
      }
    }
    if (keyCode == RIGHT) {
      if (power<100) {
        power++;
      }
    }
    if (keyCode == LEFT) {
      if (power > 0) {
        power--;
      }
    }
  }
}
void keyReleased() {
  keyboardInput.release(keyCode);
  if (key == 'w') {
    if ((upMove == 0)&&(toMove.spotLeft>=10)) {
      upMove += 4;
      toMove.spotLeft = toMove.spotLeft - 10;
    }
  }
}
void mouseReleased() {
  if (move) {
    for (Snake a : turn.team) {
      if (a.moveYet == false) {
        if (a.isin(mouseX, mouseY)) {
          toMove = a;
          move = false;
          break;
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
  background(255);
  if (mode == 0) {
    frameRate(10);
    UI.startScreen(0, 0);
  } else {
    frameRate(60);
    update();
    if (keyboardInput.isPressed(Controller.D)) {
      if (toMove != null) {
        if ((toMove.spotLeft) > 0) {
          if ((toMove.x < width)) {
            if (!(toMove.rightBlock())) {
              toMove.x += 3;
              toMove.spotLeft = toMove.spotLeft - 3;
            }
          }
        }
      }
    }
    if (keyboardInput.isPressed(Controller.A)) {
      if (toMove != null) {
        if ((toMove.spotLeft) > 0) {
          if ((toMove.x > 0)) {
            if (!(toMove.leftBlock())) {
              toMove.x -= 3;
              toMove.spotLeft = toMove.spotLeft - 3;
            }
          }
        }
      }
    }
    if (keyboardInput.isPressed(Controller.A)) {
      if (toMove != null) {
        if ((toMove.spotLeft) > 0) {
          if ((toMove.x > 0)) {
            if (!(toMove.leftBlock())) {
              toMove.x -= 3;
              toMove.spotLeft = toMove.spotLeft - 3;
            }
          }
        }
      }
    }
    ArrayList<Projectile> Bullets2 = new ArrayList<Projectile>();
    ArrayList<Snake> EverySnake2 = new ArrayList<Snake>();
    ArrayList<Snake> P1Team = new ArrayList<Snake>();
    ArrayList<Snake> P2Team = new ArrayList<Snake>();
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
    if (upMove > 0) {
      toMove.y -= upMove;
      upMove--;
    }
    for (Snake a : EverySnake) {
      if (!(a.highestBlock())) {
        a.y += 1;
      }
      if (a.health > 0) {
        EverySnake2.add(a);
      }
      a.display();
      text(a.health, a.x, a.y+5);
    }  
    EverySnake = EverySnake2;
    for (Snake a : player1.team) {
      if (a.health > 0) {
        P1Team.add(a);
      }
    }
    player1.team = P1Team;
    EverySnake = EverySnake2;
    for (Snake a : player2.team) {
      if (a.health > 0) {
        P2Team.add(a);
      }
    }
    player2.team = P2Team;
    UI.basicUI(1200, 0);
    text("player " +turn.id + "'s turn", 1210, 12);
    text("Power: " + power, 1210, 30);
    text("angle: " + angle, 1210, 40);
    fill(255);
    rect(endX, endY, endRectX, endRectY);
    rect(selectX, selectY, selectRectX, selectRectY);
    rect(shootX, shootY, shootRectX, shootRectY);
    fill(0);
    text("END TURN", (endX) + 65, endY + 55);
    text("SHOOT", (shootX) + 75, shootY + 55);
  }
}
void mousePressed() {
  if (overEndTurn) {
    for (Snake a : turn.team) {
      a.reset();
    }
    if (turn == player1) {
      turn = player2;
    } else {
      turn = player1;
    }
  }
  if (overSelect) {
    //opens the weapon select screen
  }
  if (overShoot) {
    if ((toMove != null)&&(!toMove.shootYet)) {
      Bullets.add(toMove.shoot(angle, power, 1));
    }
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
