import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;


void setup () {
  size(1000, 800, P3D);
  
}

HashSet<Character> keys = new HashSet<Character>();
HashSet<Integer> specialKeys = new HashSet<Integer>();


RubiksCube rubiks = new RubiksCube();

void draw() {
  background(0);
  lights();
  
  controls(keys, specialKeys);
  rubiks.display();
  
}

void controls(HashSet<Character> keys, HashSet<Integer> specialKeys) {
    // VERTICAL
    if (keys.contains('l') && specialKeys.contains(UP)) // l
      rubiks.rotateVertical(0, 1);
    if (keys.contains('l') && specialKeys.contains(DOWN)) // l'
      rubiks.rotateVertical(0, -1);
      
    if (keys.contains('m') && specialKeys.contains(UP)) // m
      rubiks.rotateVertical(1, 1);
    if (keys.contains('m') && specialKeys.contains(DOWN)) // m'
      rubiks.rotateVertical(1, -1);
    
    if (keys.contains('r') && specialKeys.contains(UP)) // r
      rubiks.rotateVertical(2, 1);
    if (keys.contains('r') && specialKeys.contains(DOWN)) // r'
      rubiks.rotateVertical(2, -1);
    
      
    // HORIZONTAL
    if (keys.contains('u') && specialKeys.contains(RIGHT)) // u
      rubiks.rotateHorizontal(0, 1);
    if (keys.contains('u') && specialKeys.contains(LEFT)) // u'
      rubiks.rotateHorizontal(0, -1);
      
    if (keys.contains('e') && specialKeys.contains(RIGHT)) // e
      rubiks.rotateHorizontal(1, 1);
    if (keys.contains('e') && specialKeys.contains(LEFT)) // e'
      rubiks.rotateHorizontal(1, -1);
    
    if (keys.contains('d') && specialKeys.contains(RIGHT)) // d
      rubiks.rotateHorizontal(2, 1);
    if (keys.contains('d') && specialKeys.contains(LEFT)) // d'
      rubiks.rotateHorizontal(2, -1);
      
    // DEPTH
    if (keys.contains('f') && specialKeys.contains(RIGHT)) // f
      rubiks.rotateDepth(0, 1);
    if (keys.contains('f') && specialKeys.contains(LEFT)) // f'
      rubiks.rotateDepth(0, -1);
      
    if (keys.contains('s') && specialKeys.contains(RIGHT)) // s
      rubiks.rotateDepth(1, 1);
    if (keys.contains('s') && specialKeys.contains(LEFT)) // s'
      rubiks.rotateDepth(1, -1);
      
    if (keys.contains('b') && specialKeys.contains(RIGHT)) // b
      rubiks.rotateDepth(2, 1);
    if (keys.contains('b') && specialKeys.contains(LEFT)) // b'
      rubiks.rotateDepth(2, -1);
      
    // remove so that one diretional press = one rotation
    specialKeys.remove(UP);
    specialKeys.remove(DOWN);
    specialKeys.remove(LEFT);
    specialKeys.remove(RIGHT);
  }

void keyPressed() {
  if (key == CODED) {
    specialKeys.add(keyCode);
  } else {
    keys.add(Character.toLowerCase(key));
  }
}

void keyReleased() {
  if (key == CODED) {
    specialKeys.remove(keyCode);
  } else {
    keys.remove(Character.toLowerCase(key));
  }
}
