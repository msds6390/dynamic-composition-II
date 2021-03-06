// Source:
// http://learningprocessing.com/examples/chp10/example-10-03-intersection
class Shark {
  
  float x, y, z;
  
  // Constructor
  Shark() {
    // Source:
    // https://www.processing.org/reference/loadShape_.html
    // https://blender.stackexchange.com/questions/47915/when-i-save-something-as-an-obj-file-the-texture-does-not-save-with-it-why
    sharkTexture = loadImage("sharkTexture2.jpg");
    shark = loadShape("GreatWhite.obj");
    shark.setTexture(sharkTexture);

    x = random(-300, 300);
    y = random(-300, 300);
    //z = random(-300, 300);
    z = 0;
  }
  
  void display() {
    //shark.setTexture(sharkTexture);
    pushMatrix();
    translate(0, 0);
    rotateX(PI);
    rotateY(theta);
    shape(shark, -mouseX, -mouseY);
    popMatrix();
  }
  
  void move() {
    pushMatrix();
    rotateX(PI);
    rotateY(theta);
    //rotate(PI);
    popMatrix();
  }
}
