// Source:
// http://learningprocessing.com/examples/chp10/example-10-03-intersection
class KillerWhale {
  // Constructor
  KillerWhale() {
    // Source:
    // https://www.processing.org/reference/loadShape_.html
    // https://blender.stackexchange.com/questions/47915/when-i-save-something-as-an-obj-file-the-texture-does-not-save-with-it-why
    killerWhaleTexture = loadImage("killerWhaleTexture.jpg");
    killerWhale = loadShape("Killer_Whale.obj");
    killerWhale.setTexture(killerWhaleTexture);
    killerWhale.scale(80);
  }
  
  void display() {
    pushMatrix();
    translate(0, 0);
    rotateX(PI);
    rotateY(theta);
    shape(killerWhale, -mouseX, -mouseY);
    popMatrix();
  }
  
  void move() {
    pushMatrix();
    rotateX(PI);
    rotateY(theta);
    popMatrix();
  }
}
