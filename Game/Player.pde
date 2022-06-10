class Player{
  ArrayList<Snake> team;
  int angle, power;
  int id;
  ArrayList<Integer> arsenal;
  public Player(int x){
    team = new ArrayList<Snake>();
    id = x;
    arsenal = new ArrayList<Integer>();
  }
  void addSnake(int num, String mod){
    for(int i = 0; i < num; i++){
      Snake member = new Snake(int(random(1100)), 0, id, mod);
      team.add(member);
      EverySnake.add(member);
    }
  }
  
  // maybe add another way to fill arsenal later, such as a weapon selection screen
  void randomizeArsenal() {
    double choice = 0;
    int choice2 = 0;
    for (int i = 0; i < team.size() * 10; i++) {
      choice = random(1);
      if (choice < 0.35) {
        choice2 = (int)random(3);
        if (choice2 == 0) {
          arsenal.add(1);
        }
        else if (choice2 == 1) {
          arsenal.add(2);
        }
        else {
          arsenal.add(4);
        }
      }
      else if (choice < 0.8) {
        choice2 = (int)random(6);
        if (choice2 == 0) {
          arsenal.add(3);
        }
        else if (choice2 == 1) {
          arsenal.add(5);
        }
        else if (choice2 == 2) {
          arsenal.add(6);
        }
        else if (choice2 == 3) {
          arsenal.add(7);
        }
        else if (choice2 == 4) {
          arsenal.add(8);
        }
        else {
          arsenal.add(12);
        }
      }
      else {
        
      }
    }
  }
}
