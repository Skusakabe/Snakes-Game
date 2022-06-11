class WeaponButtons{
  int id; 
  int x;
  int y;
  int count;
  String name;
  public WeaponButtons(int x, int y, int id, String name, int count){
    this.id = id;
    this.x = x;
    this.y = y;
    this.name = name;
    this.count = count;
  }
  void display(){
    fill(255);
    rect(x, y, 100, 50);
    textAlign(CENTER);
    fill(0);
    text(name + ": " + count, x + 50, y + 25);
    textAlign(LEFT);
  }
  void onhit(){
    if(hoveringButton(x, y, 100, 50)){
      toproj = id;
      arsenalButton = true;
    }
  }
}
