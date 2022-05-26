class Player{
  ArrayList<Snake> team;
  public Player(){
    team = new ArrayList<Snake>();
  }
  void addSnake(){
    Snake member = new Snake(int(random(width)), 370);
    team.add(member);
    EverySnake.add(member);
  }
  void turn(){
     for(Snake s: team){
  }
}
}
