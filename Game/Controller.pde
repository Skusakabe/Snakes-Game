class Controller {
    static final int W = 0;
    static final int A = 1;
    static final int S = 2;
    static final int D = 3;
    boolean [] inputs;
    public Controller() {
      inputs = new boolean[4];
    }

    boolean isPressed(int code) {
      return inputs[code];
    }

    void press(int code) {
      if(code == 'W')
      inputs[W] = true;
      if(code == 'A')
      inputs[A] = true;
      if(code == 'S')
      inputs[S] = true;
      if(code == 'D')
      inputs[D] = true;
    }
    void release(int code) {
      if(code == 'W')
      inputs[W] = false;
      if(code == 'A')
      inputs[A] = false;
      if(code == 'S')
      inputs[S] = false;
      if(code == 'D')
      inputs[D] = false;
    }
  }
