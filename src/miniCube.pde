class MiniCube {
  PVector pos;
  float size;

  color top, bottom, left, right, front, back;

  MiniCube(PVector pos, float s) {
    this.pos = pos;
    this.size = s;

    // Default Rubik's colors
    top    = color(255);      // white
    bottom = color(255, 255, 0); // yellow
    front   = color(0, 0, 255);   // blue
    back  = color(0, 255, 0);   // green
    left  = color(255, 0, 0);   // red
    right   = color(255, 140, 0); // orange
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    drawCube();
    popMatrix();
  }
  
  void rotateX(int dir) {
    if (dir == 1) {
      color temp = top;
      top = back;
      back = bottom;
      bottom = front;
      front = temp;
    } else {
      color temp = top;
      top = front;
      front = bottom;
      bottom = back;
      back = temp;
    }
  }
  
  void rotateY(int dir) {
    if (dir == 1) {
      color temp = front;
      front = left;
      left = back;
      back = right;
      right = temp;
    } else {
      color temp = front;
      front = right;
      right = back;
      back = left;
      left = temp;
    }
  }
  
  void rotateZ(int dir) {
    if (dir == 1) {
      color temp = top;
      top = left;
      left = bottom;
      bottom = right;
      right = temp;
    } else {
      color temp = top;
      top = right;
      right = bottom;
      bottom = left;
      left = temp;
    }
  }


  void drawCube() {
    float h = size / 2; // half of size

    beginShape(QUADS);

    // FRONT (Z+)
    fill(front);
    vertex(-h, -h,  h);
    vertex( h, -h,  h);
    vertex( h,  h,  h);
    vertex(-h,  h,  h);

    // BACK (Z-)
    fill(back);
    vertex( h, -h, -h);
    vertex(-h, -h, -h);
    vertex(-h,  h, -h);
    vertex( h,  h, -h);

    // RIGHT (X+)
    fill(right);
    vertex( h, -h,  h);
    vertex( h, -h, -h);
    vertex( h,  h, -h);
    vertex( h,  h,  h);

    // LEFT (X-)
    fill(left);
    vertex(-h, -h, -h);
    vertex(-h, -h,  h);
    vertex(-h,  h,  h);
    vertex(-h,  h, -h);

    // TOP (Y-)
    fill(top);
    vertex(-h, -h, -h);
    vertex( h, -h, -h);
    vertex( h, -h,  h);
    vertex(-h, -h,  h);

    // BOTTOM (Y+)
    fill(bottom);
    vertex(-h,  h,  h);
    vertex( h,  h,  h);
    vertex( h,  h, -h);
    vertex(-h,  h, -h);

    endShape();
  }
}
