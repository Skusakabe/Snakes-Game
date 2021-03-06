import controlP5.*;        //<>// //<>// //<>//
import processing.sound.*;
UI UI; 
int option1;
int option2;
int option3;
int option4;
int H, M;
boolean snakeup, snakedown, healthup, healthdown, moveup, movedown;
int snakeCount;
int toproj;
boolean soundonoff, spawnSnake;
boolean arsenalButton;
Controller keyboardInput;
Terrain background;
boolean drag, setupSnake;
String RealMapName;
int UIradius = 5;
boolean MapSetUp;
boolean setupMode3;
boolean toexit;
static float GRAV = 0.75;
static int tileSize = 5;
int mode;
int mode2;
boolean unlimitedProjectiles;
Snake toMove;
String weaponName;
ArrayList<String> MapName;
static String[] weaponList = {"Basic shot", "Dirt shot", "Big shot", "Ground remover", "Scatter shot", "Drill shot", "Homing shot", "Trail shot", "Carpet bomber", 
  "Nuke", "Spider shot", "Blunderbuss"};
boolean move, readyToMove;
int timer, newx, newy, power, angle, upMove;
ArrayList<Snake> EverySnake;
ArrayList<Terrain> blocks;
ArrayList<Animation> animationList;
ArrayList<Projectile> Bullets = new ArrayList<Projectile>();
boolean overEndTurn;
boolean overSelect;
boolean overShoot;
MapGenerator gameMap;
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
static int SnakeX = 325;
boolean save;
boolean typing;
int projID;
SoundFile blast;
SoundFile PEW;
SoundFile hit;
//could be made into an ArrayList with different songs
SoundFile music;
//eventually with Random map, edit uppercord to check for bounds.
ArrayList<Integer> uppercord = new ArrayList<Integer>();
Player player1;
Player player2;
Player turn;
ControlP5 cp5;
PImage Loading1, Loading2, Loading3, Loading4;
void updateMapList() {
  try {
    Scanner scan = new Scanner(new File(sketchPath("")+"MAPNAME.txt"));
    while (scan.hasNextLine()) {
      MapName.add(scan.nextLine());
    }
    scan.close();
  }
  catch(IOException E) {
    print("File Not Found");
  }
}
void setup() {
  size(1500, 600);
  H = 100;
  M = 20;
  snakeCount = 3;
  spawnSnake = true;
  option1 = -1;
  soundonoff = true;
  unlimitedProjectiles = false;
  arsenalButton = false;
  toproj = 0;
  Loading1 = loadImage("Loading1.png");
  Loading1.resize(1500, 600);
  Loading2 = loadImage("Loading2.png");
  Loading2.resize(1500, 600);
  Loading3 = loadImage("Loading3.png");
  Loading3.resize(1500, 600);
  Loading4 = loadImage("Loading4.png");
  Loading4.resize(1500, 600);
  blast = new SoundFile(this, "explosion.wav");
  PEW = new SoundFile(this, "PEWsfx.wav");
  hit = new SoundFile(this, "hitsfx.mp3");
  music = new SoundFile(this, "bgm1.mp3");
  music.stop();
  MapName = new ArrayList<String>();
  MapSetUp = true;
  setupMode3 = true;
  setupSnake = true;
  toexit = false;
  cp5 = new ControlP5(this);
  updateMapList();
  drag = false;
  save = false;
  typing = false;
  gameMap = new MapGenerator(GAMEWIDTH, GAMEHEIGHT);
  image(Loading2, 0, 0);
  EverySnake = new ArrayList<Snake>();
  blocks = new ArrayList<Terrain>();
  animationList = new ArrayList<Animation>();
  upMove = 0;
  //Change projID to match proj type with bullets;
  projID = 1;
  power = 20;
  angle = 45;
  background = new Terrain(-1, 0, 0);
  blocks = gameMap.map;
  weaponName = weaponList[projID - 1];
  move = true;
  player1 = new Player(1);
  player2 = new Player(2);
  image(Loading3, 0, 0);
  player1.randomizeArsenal();
  player2.randomizeArsenal();
  turn = player1;
  timer = 0;
  keyboardInput = new Controller();
  UI = new UI();
  fill(255);
  rect(endX, endY, endRectX, endRectY);
  rect(selectX, selectY, selectRectX, selectRectY);
  rect(shootX, shootY, shootRectX, shootRectY);
  mode = 0;
  mode2 = 0;
  image(Loading4, 0, 0);
  loop();
}

void keyPressed() {
  if (typing) {
    if (key == BACKSPACE) {
      if ((UI.name).length() > 0) {
        UI.name = (UI.name).substring(0, (UI.name).length() - 1);
      }
    } else {
      if ((key >= 'a')&&(key <= 'z')) {
        UI.name += key;
        print(1);
      }
    }
  }
  if (mode == 1) {
    keyboardInput.press(keyCode);
    if (key == ' ') {
       if (unlimitedProjectiles) {
      if ((toMove != null)&&(!toMove.shootYet)) {
        if (projID == 12) {
          for (int i = 0; i < 11; i++) {
            Bullets.add(toMove.shoot(toMove.angle, toMove.power, projID));
          }
        }
      Bullets.add(toMove.shoot(toMove.angle, toMove.power, projID));
      toMove.shootYet = true;
      }
    } else {
      if ((toMove != null)&&(!toMove.shootYet)) {
        if (turn.arsenal.contains(projID)) {
          if (projID == 12) {
            for (int i = 0; i < 11; i++) {
              Bullets.add(toMove.shoot(toMove.angle, toMove.power, projID));
            }
          }
          Bullets.add(toMove.shoot(toMove.angle, toMove.power, projID));
          turn.arsenal.remove(Integer.valueOf(projID));
          toMove.shootYet = true;
        } else {
          println("You don't have any ammo of this type left!");
        }
      }
    }
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      if (toMove != null){
        if (mode == 1) {
          if (toMove.angle < 360) {
            toMove.angle++;
          }
          else {
            toMove.angle = 0;
          }
        }
    } else if (mode == 3) {
      if (UIradius < 70) {
        UIradius += 5;
      }
    }
  }

  if (keyCode == DOWN) {
    if (mode == 1) {
      if (toMove != null) {
        if (toMove.angle > 0) {
          toMove.angle--;
        }
      }
    } else if (mode == 3) {
      if (UIradius > 0) {
        UIradius -= 5;
      }
    }
  }
  if (keyCode == RIGHT) {
    if (toMove != null) {
      if (toMove.power<100) {
        toMove.power++;
      }
    }
  }
  if (keyCode == LEFT) {
    if (toMove != null) {
      if (toMove.power > 0) {
        toMove.power--;
      }
    }
  }
  }
  if (key == 27) {
    key = 0;
    if (mode == 1) {
      mode = -3;
    } else if (mode == -3) {
      loop();
      mode = 1;
    }
  }
}
void keyReleased() {
  if (mode == 1) {
    if (toMove != null) {
      keyboardInput.release(keyCode);
      if (key == 'w' && toMove != null) {
        if ((upMove == 0)&&(toMove.spotLeft>=10)) {
          upMove += 4;
          toMove.spotLeft = toMove.spotLeft - 10;
        }
      }
    }
  }
}
void mouseReleased() {
  if (mode == 3) {
    drag = false;
  }
  if (mode == 1) {
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
}
//MODE LABELS
//MODE -3 = pause
//MODE -1 and -2 = win screen
//MODE 0 = startscreen
//MODE 1 = GAME
//MODE 2 = Team Editing
//MODE 3 = Terrain editing //<>//
//MODE 4 = MAPSELECTION
void draw() { //<>//
  cp5.hide();
  background(255);
  if(soundonoff){
    while (mode <= 1 && !music.isPlaying()) {
      music.play(1, 0.4); //<>//
    } //<>//
  }else{ //<>//
    music.stop(); //<>//
  } //<>//
  //UI.d1.hide();
  if (!(unlimitedProjectiles)) {
    if (player1.arsenal.size() == 0) {
      player1.randomizeArsenal();
    }
    if (player2.arsenal.size() == 0) {
      player2.randomizeArsenal();
    }
  }
  if (mode == 3) {
    frameRate(10);
    image(Loading2, 0, 0); //<>//
    UI.mapScreen(0, 0, setupMode3); //<>//
  } else if (mode == 0) { //<>//
    frameRate(10);
    UI.startScreen(0, 0);  
    if (hoveringButton(BeginX, BeginY, BeginRectX, BeginRectY)){
      mode2 = 1; 
    } //<>//
  } else if (mode == -1) { //<>// //<>//
    textSize(100); //<>//
    fill(0); //<>// //<>//
    text("Player 2 Wins", width/2 - 300, height/2);   //<>//
    textSize(50); 
    text("Click Anywhere to Continue, wait 5 seconds", width/2 - 500, height/2 + 100);    
    if (hoveringButton(0, 0, 1500, 600)) { 
      mode2 = -4; 
    }
  } else if (mode == -2) {
    textSize(100);
    fill(0);
    text("Player 1 Wins", width/2 - 300, height/2);
    textSize(50);
    text("Click Anywhere to Continue, wait 5 seconds", width/2 - 500, height/2 + 100);
    if (hoveringButton(0, 0, 1500, 600)) {
      mode2 = -4;
    }
  } else if (mode == 4) {
    image(Loading1, 0, 0);
    cp5.show();
    //UI.d1.setBarVisible(true);
    UI.mapSelection(0, 0, MapSetUp);
    MapSetUp = false;
  } else {
    if(spawnSnake){
        player1.addSnake(snakeCount, "SnakeRed.png", H, M*5);
        player2.addSnake(snakeCount, "SnakeBlue.png", H, M*5);
        spawnSnake = false;
      }
    textAlign(LEFT);
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
      ArrayList<Animation> animations = new ArrayList<Animation>();
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
              Bullets2.add(new BasicShot(a.x + (3 * k), a.y-15, 90 + (2 * k), 45, 30, 10, 0.3));
            }
          }
          if (a.getType() == 6) {
            for (int i = 0; i < 5; i++) {
              Bullets2.add(new BasicShot(a.x, a.y, 270, 40, 30, 10, 0.25));
            }
          }
          if (a.getType() == 11) {
            if (a.getSpecial()) {
              for (int i = 0; i < 8; i++) {
                Bullets2.add(new HomingShot(a.x, a.y, i*45, 30, 20, 4, 0.2, 10, getTarget((SpiderShot)a)));
              }
            }
          }
          if (a.getType() != 2) {
            if (a.getType() == 10) {
              animationList.add(new Animation(a.x, a.y, (int)(a.radius * 1.1)));
            }
            else {
              animationList.add(new Animation(a.x, a.y, a.radius));
            }
          }
          a.playSound(blast);
          Bullets2.remove(a);
        } else {
          if (a.getType() == 8) {
            if (a.getSpecial()) {
              Bullets2.add(new BasicShot(a.x, a.y, 270, 10, 20, 10, 0.2));
            }
          }
          if (a.getType() == 9) {
            if (a.getSpecial()) {
              Bullets2.add(new BasicShot(a.x, a.y, 225, 20, 20, 10, 0.2));
              Bullets2.add(new BasicShot(a.x, a.y, 270, 20, 20, 10, 0.2));
              Bullets2.add(new BasicShot(a.x, a.y, 315, 20, 20, 10, 0.2));
            }
          }
          a.display();
        }
      }
      Bullets = Bullets2;
      if (upMove > 0) {
        toMove.y -= upMove;
        upMove--;
      }
      if (setupSnake) {
        for (Snake a : EverySnake) {
          while (!(a.highestBlock())) {
            a.y += 5;
          }
        }
        setupSnake = false;
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
      for (Animation a : animationList) {
        animations.add(a);
        a.animate();
        if (a.getTimer() >= 32) {
          animations.remove(a);
        }
      }
      animationList = animations;
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
      if (toMove != null) {
        text("Power: " + toMove.power, 1210, 30);
        text("Angle: " + toMove.angle, 1210, 40);
      }
      if(toMove != null){
      text("Health: " + toMove.health, 1210, 60);
      }else{
        text("Health: ", 1210, 60);
      }
      text("Selected weapon: " + weaponList[projID - 1], 1210, 50);
      fill(255);
      rect(endX, endY, endRectX, endRectY);
      rect(selectX, selectY, selectRectX, selectRectY);
      rect(shootX, shootY, shootRectX, shootRectY);
      fill(0);
      text("END TURN", (endX) + 65, endY + 55);
      text("CHANGE WEAPON", (selectX) + 55, selectY + 55);
      text("SHOOT", (shootX) + 75, shootY + 55);
      if (toMove != null) {
        strokeWeight(2);
        fill(50,255,50);
        ellipse(toMove.x + 10, toMove.y - 10, 10, 10);
        fill(0);
        line(toMove.x + 10, toMove.y - 10, toMove.x + 10 + (toMove.power+40)/5*(sin((toMove.angle+90)*PI/180)), toMove.y - 10 + (toMove.power+40)/5*(cos((toMove.angle+90)*PI/180)));
        fill(255);
      }
      if (mode == -3) {
        //noLoop();
        fill(0);
        rect(width/2 - 150, 75, 300, 425);
        fill(255);
        rect(width/2 - 125, 100, 250, 75);
        rect(width/2 - 125, 200, 250, 75);
        rect(width/2 - 125, 300, 250, 75);
        rect(width/2 - 125, 400, 250, 75);
        fill(0);
        textSize(25);
        String onoff = "on";
        if(!soundonoff){
          onoff = "off";
        }
        text("Resume", width/2 - 50, 145);
        text("Main Menu", width/2 - 70, 245);
        text("Music-" + onoff, width/2 - 70, 345);
        text("Exit", width/2 - 40, 445);
        
        if (hoveringButton(width/2 - 125, 100, 250, 75)) {
          option4 = 1;
        } 
        else {
         option4 = -1;
        }
      if(hoveringButton(width/2 - 125, 300, 250, 75)){
        option2 = 1;
      }else{
        option2 = -1;
      }
      if(hoveringButton(width/2 - 125, 200, 250, 75)){
        mode2 = 0;
      }else{
        mode2 = 1000000;
      }
      if(hoveringButton(width/2 - 125, 400, 250, 75)){
        option1 = 1;
      }else{
        option1 = -1;
      }
      }
      if (mode == -5) {
        UI.arsenalUI();
        noLoop();
      }
    }
  }
}

void mousePressed() {
  if (mode == -5) {
    for (int x = 0; x < weaponList.length; x++) {
      int y = x;
      int z = x%6;
      if (x == 0) {
        y = 1;
      }
      WeaponButtons butt = new WeaponButtons(200 + (125*z), 150+(75*(y/6)), x, weaponList[x]);
      butt.onhit();
    }
    if (arsenalButton) {
      projID = toproj + 1;
      if (projID > 12) {
        projID = 12;
      }
      mode = 1;
      loop();
    }
  }
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
    mode = -5;
  }
  if (overShoot) {
    if (unlimitedProjectiles) {
      if ((toMove != null)&&(!toMove.shootYet)) {
        if (projID == 12) {
          for (int i = 0; i < 11; i++) {
            Bullets.add(toMove.shoot(toMove.angle, toMove.power, projID));
          }
        }
      Bullets.add(toMove.shoot(toMove.angle, toMove.power, projID));
      toMove.shootYet = true;
      }
    } else {
      if ((toMove != null)&&(!toMove.shootYet)) {
        if (turn.arsenal.contains(projID)) {
          if (projID == 12) {
            for (int i = 0; i < 11; i++) {
              Bullets.add(toMove.shoot(toMove.angle, toMove.power, projID));
            }
          }
          Bullets.add(toMove.shoot(toMove.angle, toMove.power, projID));
          turn.arsenal.remove(Integer.valueOf(projID));
          toMove.shootYet = true;
        } else {
          println("You don't have any ammo of this type left!");
        }
      }
    }
  }
  if (mode == -3) {
    if (hoveringButton(width/2 - 125, 100, 250, 75)) {
      mode = 1;
      loop();
    }
  }
  if(mode2 == 0){
    loop();
    mode = 0;
    mode2 = 1000000;
    image(Loading1, 0, 0);
    noLoop();
    music.stop();
    thread("setup");
  }
  if (mode2 == 4) {
    mode = 1;
    mode2 = 1000000;
  }
  if (mode2 == 3) {
    mode = 3;
    mode2 = 1000000;
  }
  if (mode2 == 1) {
    mode = 4;
    MapSetUp = true;
    mode2 = 10000000;
  }
  if (mode2 == -4) {
    background(255);
    mode = -4;
    while (Bullets.size() > 0) {
      Bullets.remove(0);
    }
    image(Loading1, 0, 0);
    noLoop();
    music.stop();
    thread("setup");
    mode2 = 1000000;
  }
  if (mode == 3) {
    if (UI.dirt) {
      UI.blockType = 1;
    }
    if (UI.stone) {
      UI.blockType = 2;
    }
    if (UI.delete) {
      UI.blockType = 0;
    }
    if (UI.tosave) {
      save = true;
    }
    if (UI.totype) {
      typing = true;
    }
    if ((mouseX < 1200)&&(mouseY<600)) {
      drag = true;
    }
    if (toexit) {
      mode = 0;
    }
  }
  if(mode == -3){
  if(option2 == 1){
      soundonoff = !soundonoff;
  }
  if(option1 == 1){
    exit();
  }
  if(option4 == 1){
    setup();
  }
  } 
  if(option3 == 1){
    unlimitedProjectiles = !unlimitedProjectiles;
  }
  if(moveup){
    if(M < 100){
    M++;
    }
  }
   if(movedown){
     if(M > 0){
    M--;
     }
  }
  if(healthup){
    if(H < 1000){
    H+=5;
    }
  }
    if(healthdown){
      if(H > 5){
    H-=5;
      }
  }
  if(snakeup){
    if(snakeCount < 10){
    snakeCount++;
    }
  }
  if(snakedown){
    if(snakeCount > 1){
    snakeCount--;
    }
  }
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getStringValue()+" from "+theEvent.getController());
    RealMapName = (String)((UI.d1.getItem(int(theEvent.getValue()))).get("value"));
    if (RealMapName.equals("Random")) {
      blocks = gameMap.map;
    } else {
      blocks = UI.openMap(RealMapName);
      print(RealMapName + "1");
    }
    for (Snake a : EverySnake) {
      a.display();
      while (!(a.highestBlock())) {
        a.y += 1;
      }
    }
  }
}
void update() {
  if ( hoveringButton(endX, endY, endRectX, endRectY) ) {
    overEndTurn = true;
  } else {
    overEndTurn = false;
  }
  if ( hoveringButton(selectX, selectY, selectRectX, selectRectY) ) {
    overSelect = true;
  } else {
    overSelect = false;
  }
  if ( hoveringButton(shootX, shootY, shootRectX, shootRectY) ) {
    overShoot = true;
  } else {
    overShoot = false;
  }
}

Snake getTarget(SpiderShot s) {
  return s.closestInRange;
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
