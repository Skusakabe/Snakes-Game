UI UI; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
Controller keyboardInput;
Terrain background;
static double GRAV = 0.75;
int mode;
int mode2;
Snake toMove;
String weaponName;
static String[] weaponList = {"Basic shot", "Dirt shot", "Big shot", "Ground remover", "Scatter shot", "Drill shot"};
boolean move, readyToMove;
int timer, newx, newy, power, angle, upMove;
ArrayList<Snake> EverySnake;
ArrayList<Terrain> blocks;
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
static int BeginX = 200;
static int BeginY = 500;
static int BeginRectX = 100;
static int BeginRectY = 50;
int projID;
//eventually with Random map, edit uppercord to check for bounds.
ArrayList<Integer> uppercord = new ArrayList<Integer>();
Player player1;
Player player2;
Player turn;

void setup() {
  mode2 = 0;
  size(1500, 600);
  EverySnake = new ArrayList<Snake>();
  blocks = new ArrayList<Terrain>();
  mode = 0;
  upMove = 0;
  //Change projID to match proj type with bullets;
  projID = 1;
  power = 20;
  angle = 45;
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
  weaponName = weaponList[projID - 1];
  move = true;
  player1 = new Player(1);
  player2 = new Player(2);
  player1.addSnake(3, "SnakeRed.png");
  player2.addSnake(3, "SnakeBlue.png");
  turn = player1;
  for (Snake a : EverySnake) {
    a.display();
  }
  timer = 0;
  keyboardInput = new Controller();
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
      if (angle < 360) {
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
    if (hoveringButton(BeginX, BeginY, BeginRectX, BeginRectY)) {
      mode2 = 1;
    }
  } else if (mode == -1) {
    textSize(100);
    fill(0);
    text("Player 2 Wins", width/2 - 300, height/2);
    if (hoveringButton(0, 0, 1500, 600)) {
      mode2 = -3;
    }
  } else if (mode == -2) {
    textSize(100);
    fill(0);
    text("Player 1 Wins", width/2 - 300, height/2);
    if (hoveringButton(0, 0, 1500, 600)) {
      mode2 = -3;
    }
  } else {
    if ((player1.team).size() == 0) {
      mode = -1;
    } else if ((player2.team).size() == 0) {
      mode = -2;
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
      textSize(10);
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
          if (a.getType() == 5) {
            for (int k = -10; k <= 10; k+= 5) {
              Bullets2.add(new BasicShot(a.x + (3 * k), a.y-15, 90 + (2 * k), 45, 30, 10));
            }
          }
          if (a.getType() == 6) {
            for (int i = 0; i < 5; i++) {
              Bullets2.add(new BasicShot(a.x, a.y, 270, 40, 30, 10));
            }
          }
          Bullets2.remove(a);
        } else {
          a.display();
        }
      }
      Bullets = Bullets2;
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
      text("Player " +turn.id + "'s turn", 1210, 12);
      text("Power: " + power, 1210, 30);
      text("Angle: " + angle, 1210, 40);
      text("Selected weapon: " + weaponName, 1210, 50);
      fill(255);
      rect(endX, endY, endRectX, endRectY);
      rect(selectX, selectY, selectRectX, selectRectY);
      rect(shootX, shootY, shootRectX, shootRectY);
      fill(0);
      text("END TURN", (endX) + 65, endY + 55);
      text("CHANGE WEAPON", (selectX) + 55, selectY + 55);
      text("SHOOT", (shootX) + 75, shootY + 55);
    }
  }
}
void mousePressed() {
  if (overEndTurn) {
    for (Snake a : turn.team) {
      a.reset();
      toMove = null;
    }
    if (turn == player1) {
      turn = player2;
    } else {
      turn = player1;
    }
  }
  if (overSelect) {
    if (projID == 6) {
      projID = 1;
    } else {
      projID++;
    }
    weaponName = weaponList[projID - 1];
  }
  if (overShoot) {
    if ((toMove != null)&&(!toMove.shootYet)) {
      Bullets.add(toMove.shoot(angle, power, projID));
      toMove.shootYet = true;
    }
  }
  if (mode2 == 1) {
    mode = 1;
  }
  if (mode2 == -3) {
    setup();
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
