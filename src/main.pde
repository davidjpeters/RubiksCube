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
  
  controls(keys);
  rubiks.display();
  
}

void controls(HashSet<Character> input) {
    // VERTICAL
    if (input.contains('u') && input.contains(','))
      rubiks.rotateVertical(0, -1);
    if (input.contains('e') && input.contains(','))
      rubiks.rotateVertical(1, 1);
    if (input.contains('v') && input.contains(','))
      rubiks.rotateVertical(2, -1);
    
    if (input.contains('v') && input.contains('.'))
      rubiks.rotateVertical(0, 1);
    if (input.contains('v') && input.contains('.'))
      rubiks.rotateVertical(1, 1);
    if (input.contains('v') && input.contains('.'))
      rubiks.rotateVertical(2, 1);
      
      
    // HORIZONTAL
    if (input.contains('h') && input.contains(','))
      rubiks.rotateHorizontal(0, -1);
    if (input.contains('h') && input.contains(','))
      rubiks.rotateHorizontal(1, -1);
    if (input.contains('h') && input.contains(','))
      rubiks.rotateHorizontal(2, -1);
    
    if (input.contains('h') && input.contains('.'))
      rubiks.rotateHorizontal(0, 1);
    if (input.contains('h') && input.contains('.'))
      rubiks.rotateHorizontal(1, 1);
    if (input.contains('h') && input.contains('.'))
      rubiks.rotateHorizontal(2, 1);
      
      
    // DEPTH
    if (input.contains('d') && input.contains(','))
      rubiks.rotateDepth(2, -1);
    if (input.contains('d') && input.contains(','))
      rubiks.rotateDepth(1, -1);
    if (input.contains('d') && input.contains(','))
      rubiks.rotateDepth(0, -1);
    
    if (input.contains('d') && input.contains('.'))
      rubiks.rotateDepth(2, 1);
    if (input.contains('d') && input.contains('.'))
      rubiks.rotateDepth(1, 1);
    if (input.contains('d') && input.contains('.'))
      rubiks.rotateDepth(0, 1);
      
    // remove so that one diretional press = one rotation
    keys.remove(',');
    keys.remove('.');
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
