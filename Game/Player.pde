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
    for (int i = 0; i < team.size() * 10; i++) {
      choice = random(1);
      if (choice < 0.2) {
        arsenal.add(1);
      }
      if (choice < 0.285) {
        arsenal.add(2);
      }
      if (choice < 0.37) {
        arsenal.add(3);
      }
      if (choice < 0.455) {
        arsenal.add(4);
      }
      if (choice < 0.54) {
        arsenal.add(5);
      }
      if (choice < 0.625) {
        arsenal.add(6);
      }
      if (choice < 0.71) {
        arsenal.add(7);
      }
      if (choice < 0.795) {
        arsenal.add(8);
      }
      if (choice < 0.835) {
        arsenal.add(9);
      }
      if (choice < 0.875) {
        arsenal.add(10);
      }
      if (choice < 0.915) {
        arsenal.add(11);
      }
      if (choice < 1) {
        arsenal.add(12);
      }
    }
  }
}
