UI UI; //<>// //<>//
Controller keyboardInput;
Terrain background;
static double GRAV = 4.0;
Snake toMove;
BasicShot test;
boolean move, readyToMove;
int timer, newx, newy, power, angle;
ArrayList<Snake> EverySnake = new ArrayList<Snake>();
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
//eventually with Random map, edit uppercord to check for bounds.
ArrayList<Integer> uppercord = new ArrayList<Integer>();
Player player1;
Player player2;
Player turn;
void setup() {
  power = 5;
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
  keyboardInput = new Controller();
  size(1500, 600);
  test = new BasicShot(60, 600, 45, 30, 10, 10);
  UI = new UI();
}

void keyPressed() {
  keyboardInput.press(keyCode);
   if (key == CODED) {
    if (keyCode == UP) {
      if(angle < 360){
      angle++;
      }
    }
    if (keyCode == DOWN) {
      angle--;
    }
    if (keyCode == RIGHT) {
      power++;
    }
    if (keyCode == LEFT) {
      power--;
    }
   }
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
          toMove = null;
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
    if(!(a.highestBlock())){
      a.y += 1;
    }
    a.display();
  }  
  UI.basicUI(1200, 0);
  text("Power: " + power, 1210, 10);
  text("angle: " + angle, 1210, 20);
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
