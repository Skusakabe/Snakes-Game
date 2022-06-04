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
  }
  
  int getType(int x, int y) {
    float value = noise(x,y);
    if (y < 100) {
      if (value < 0.9) {
        return 0;
      }
      return 1;
    }
    else if (y < 200) {
      if (value < 0.8) {
        return 0;
      }
      return 1;
    }
    else if (y < 300) {
      if (value < 0.6) {
        return 0;
      }
      return 1;
    }
    else if (y < 400) {
      if (value < 0.4) {
        return 0;
      }
      return 1;
    }
    else if (y < 500) {
      if (value < 0.2) {
        return 0;
      }
      return 1;
    }
    else {
      if (value < 0.1) {
        return 0;
      }
      return 1;
    }
  }
}
