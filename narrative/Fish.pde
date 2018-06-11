// Source:
// http://learningprocessing.com/examples/chp10/example-10-03-intersection
class Fish {
  float x, y, z;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  // Constructor
  Fish(PVector l) {
    fishTexture = loadImage("fish_texture.png");
    fish = loadShape("fish.obj");
    fish.setTexture(fishTexture);
    fish.scale(30);
    x = 0;
    y = 0;
    z = 0;
    
    acceleration = new PVector(0.0, 0);
    //velocity = new PVector(random(-1, 1), random(-2, 0));
    velocity = new PVector(0, 0);
    position = l.copy();
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
  }
  
  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotateX(PI);
    rotateY(-theta);
    shape(fish, position.x, position.y);
    popMatrix();
  }
  
  void move() {
    pushMatrix();
    translate(width/2, height/2);
    rotateX(PI);
    rotateY(theta);
    popMatrix();
  }
}
