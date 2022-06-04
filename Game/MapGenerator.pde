public class MapGenerator {
  ArrayList<Terrain> map;

  MapGenerator(int mapWidth, int mapHeight) {
    ArrayList<Terrain> result = new ArrayList<Terrain>();
    for (int y = 0; y < mapHeight / tileSize; y++) {
      for (int x = 0; x < mapWidth / tileSize; x++) {
        Terrain block = new Terrain(getType(x,y),x*tileSize,y*tileSize);
        block.display();
        result.add(block);
      }
    }
    map = result;
  }

  int getType(int x, int y) {
    float value = noise(x * 0.03, y * 0.03);
    if (y < 200 / tileSize) {
      return 0;
    } else if (y < 275 / tileSize) {
      if (value < 0.75) {
        return 0;
      }
      return 2;
    }
    if (y < 300 / tileSize) {
      if (value < 0.7) {
        return 0;
      }
      return 2;
    } else if (y < 325 / tileSize) {
      if (value < 0.65) {
        return 0;
      }
      return 2;
    } else if (y < 350 / tileSize) {
      if (value < 0.6) {
        return 0;
      }
      return 2;
    } else if (y < 375 / tileSize) {
      if (value < 0.45) {
        return 0;
      }
      return 2;
    } else if (y < 400 / tileSize) {
      if (value < 0.4) {
        return 0;
      }
      return 2;
    } else if (y < 450 / tileSize) {
      if (value < 0.25) {
        return 0;
      }
      return 2;
    } else if (y < 500 / tileSize) {
      if (value < 0.1) {
        return 0;
      }
      return 2;
    } else {
      return 2;
    }
  }
}
