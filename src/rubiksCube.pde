class RubiksCube {
  
  MiniCube[][][] cubes = new MiniCube[3][3][3];
  float cubeSize = 100;
  float half = (3 * cubeSize) / 2.0;

  RubiksCube() {
  
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          PVector coords = new PVector(
            i * cubeSize - half + cubeSize/2,
            j * cubeSize - half + cubeSize/2,
            k * cubeSize - half + cubeSize/2
          );
          cubes[i][j][k] = new MiniCube(coords, cubeSize);
        }
      }
    }
 
  }
 
  void rotateVertical(int layer, int dir) { // 0 = left, 1 = mid, 2 = right
    MiniCube[][] temp = new MiniCube[3][3];
    
    for (int y = 0; y < 3; y++) {
      for (int z = 0; z < 3; z++) {
        temp[y][z] = cubes[layer][y][z];
      }
    }
    
    for (int y = 0; y < 3; y++) {
      for (int z = 0; z < 3; z++) {
        if (dir == 1) { // layer = 1 : 1 - 0 % 3 = 1, 1 - 1 % 3 = 0, 1 - 2 % 3 = 1 (abs)
          cubes[layer][y][z] = temp[abs((layer - z) % 3)][y];
          if (layer == 1 && z == 2) {
            cubes[layer][y][z] = temp[2][y];
          }
        } else {
          cubes[layer][y][z] = temp[z][abs((layer - y) % 3)];
          if (layer == 1 && y == 2) {
            cubes[layer][y][z] = temp[z][2];
          }
        }

        cubes[layer][y][z].rotateX(dir);
      }
    }  
    
  }
  
  void rotateHorizontal(int layer, int dir) { // 0 = top, 1 = mid, 2 = bottom
    MiniCube[][] temp = new MiniCube[3][3];
    
    for (int y = 0; y < 3; y++) {
      for (int z = 0; z < 3; z++) {
        temp[y][z] = cubes[y][layer][z];
      }
    }
    
    for (int y = 0; y < 3; y++) {
      for (int z = 0; z < 3; z++) {
        if (dir == 1) { // layer = 1 : 1 - 0 % 3 = 1, 1 - 1 % 3 = 0, 1 - 2 % 3 = 1 (abs)
          cubes[y][layer][z] = temp[abs((layer - z) % 3)][y];
          if (layer == 1 && z == 2) {
            cubes[y][layer][z] = temp[2][y];
          }
        } else {
          cubes[y][layer][z] = temp[z][abs((layer - y) % 3)];
          if (layer == 1 && y == 2) {
            cubes[y][layer][z] = temp[z][2];
          }
        }

        cubes[y][layer][z].rotateY(dir);
      }
    }  
    
  }
  
  void rotateDepth(int layer, int dir) { // 0 = top, 1 = mid, 2 = bottom
    MiniCube[][] temp = new MiniCube[3][3];
    
    for (int y = 0; y < 3; y++) {
      for (int z = 0; z < 3; z++) {
        temp[y][z] = cubes[y][z][layer];
      }
    }
    
    for (int x = 0; x < 3; x++) {
      for (int y = 0; y < 3; y++) {
        if (dir == 1) { // clockwise
          cubes[x][y][layer] = temp[2 - y][x];
        } else { // counter-clockwise
          cubes[x][y][layer] = temp[y][2 - x];
        }

      // Rotate stickers to match new orientation
        cubes[x][y][layer].rotateZ(dir);
      }
    }

  }
  
  void updatePositions() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
  
          cubes[i][j][k].pos = new PVector(
            i * cubeSize - half + cubeSize/2,
            j * cubeSize - half + cubeSize/2,
            k * cubeSize - half + cubeSize/2
          );

        }
      }
    }
  }
  
  void display() {
    
    pushMatrix();
    translate(width/2, height/2);
    rotateX(-mouseY*PI/200);
    rotateY(mouseX*PI/200);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          cubes[i][j][k].display();
        }
      }
    }
    popMatrix();
  }


}
