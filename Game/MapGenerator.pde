public class MapGenerator {
  ArrayList<Terrain> map;
  
  MapGenerator(int mapWidth, int mapHeight) {
    ArrayList<Terrain> result = new ArrayList<Terrain>();
    for (int y = 0; y < mapHeight / tileSize; y++) {
      for (int x = 0; x < mapWidth / tileSize; x++) {
        Terrain block = new Terrain(getType(x,y),x * tileSize, y * tileSize);
        block.display();
        result.add(block);
      }
    }
    map = result;
  }
  
  int getType(int x, int y) {
    float value = noise(x * 0.04,y * 0.04);
    if (y < 100 / tileSize) {
      if (value < 0.95) {
        return 0;
      }
      return 2;
    }
    else if (y < 150 / tileSize) {
      if (value < 0.90) {
        return 0;
      }
      return 2;
    }
    else if (y < 200 / tileSize) {
      if (value < 0.85) {
        return 0;
      }
      return 2;
    }
    else if (y < 250 / tileSize) {
      if (value < 0.75) {
        return 0;
      }
      return 2;
    }
    else if (y < 300 / tileSize) {
      if (value < 0.65) {
        return 0;
      }
      return 2;
    }
    if (y < 350 / tileSize) {
      if (value < 0.55) {
        return 0;
      }
      return 2;
    }
    else if (y < 400 / tileSize) {
      if (value < 0.4) {
        return 0;
      }
      return 2;
    }
    else if (y < 450 / tileSize) {
      if (value < 0.25) {
        return 0;
      }
      return 2;
    }
    else if (y < 500 / tileSize) {
      if (value < 0.1) {
        return 0;
      }
      return 2;
    }
    else {
      return 2;
    }
  }
}
