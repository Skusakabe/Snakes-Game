import java.io.Serializable;
class UI implements Serializable{
  PImage background;
  PImage[] StartAni = new PImage[12];
  Terrain Terrbackground = new Terrain(-1, 0, 0);
  ArrayList<Terrain> newblocks = new ArrayList<Terrain>();
  public UI() {
    background = loadImage("UI_Background.png");
    StartAni[0] = loadImage("pixil-frame-0.png");
    StartAni[1] = loadImage("pixil-frame-1.png");
    StartAni[2] = loadImage("pixil-frame-2.png");
    StartAni[3] = loadImage("pixil-frame-3.png");
    StartAni[4] = loadImage("pixil-frame-4.png");
    StartAni[5] = loadImage("pixil-frame-5.png");
    StartAni[6] = loadImage("pixil-frame-6.png");
    StartAni[7] = loadImage("pixil-frame-7.png");
    StartAni[8] = loadImage("pixil-frame-8.png");
    StartAni[9] = loadImage("pixil-frame-9.png");
    StartAni[10] = loadImage("pixil-frame-10.png");
    StartAni[11] = loadImage("pixil-frame-11.png");
  }
  void basicUI(int x, int y) {
    image(background, x, y);
  }
  void startScreen(int x, int y) {
    if(frameCount < 12){
    image(StartAni[frameCount%12], 0, 0);
    }else{
      image(StartAni[11], 0, 0);
       fill(255);
      rect(BeginX, BeginY, BeginRectX, BeginRectY);
      rect(SnakeX, BeginY, BeginRectX, BeginRectY);
      textAlign(CENTER);
      textSize(20);
       fill(0);
      text("Start", BeginX + BeginRectX/2, BeginY + BeginRectY/2 + 7);
  }
}
void mapScreen(int x, int y, boolean setup){
  if(setup){
  for (int j = 0; j < 600; j+=5) {
    for (int k = 0; k < GAMEWIDTH; k+=5) {
      Terrain block = new Terrain(0, k, j);
      block.display();
      newblocks.add(block);
    }
  }
  setup = false;
}else{
  Terrbackground.display();
  for (Terrain a : blocks) {
        a.display();
      }
}
}
if(save){
}
}
