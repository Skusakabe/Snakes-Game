class WeaponButtons{
  int id; 
  int x;
  int y;
  String name;
  public WeaponButtons(int x, int y, int id, String name){
    this.id = id;
    this.x = x;
    this.y = y;
    this.name = name;
  }
  void display(){
    fill(255);
    rect(x, y, 100, 50);
    textAlign(CENTER);
    fill(0);
    text(name, x + 50, y + 25);
    textAlign(LEFT);
  }
  void onhit(){
    if(hoveringButton(x, y, 100, 50)){
      toproj = id;
      arsenalButton = true;
    }
  }
}
