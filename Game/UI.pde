  class UI{
  PImage background;
  public UI(){
    background = loadImage("UI_Background.png");
  }
  void basicUI(int x, int y){
    image(background, x, y);  
  }
}
