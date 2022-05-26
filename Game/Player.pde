class Player{
  ArrayList<Snake> team;
  int angle, power;
  int id;
  public Player(int x){
    team = new ArrayList<Snake>();
    id = x;
  }
  void addSnake(int num){
    for(int i = 0; i < num; i++){
    Snake member = new Snake(int(random(width)), 370, id);
    team.add(member);
    EverySnake.add(member);
    }
  } 
  
}
