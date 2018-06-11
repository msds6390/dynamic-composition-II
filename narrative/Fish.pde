// Source:
// http://learningprocessing.com/examples/chp10/example-10-03-intersection
class Fish {
  
  float x, y, z;
  
  // Constructor
  Fish() {
    //fishTexture = loadImage("fish_texture.png");
    
    //fish = loadShape("fish.obj");
    //fish.setTexture(fishTexture);
    //fish.scale(30);
    //println("Fish1 width = " + fish.width);
    //println("Fish1 height = " + fish.height);
    //x = random(-300, 300);
    //y = random(-300, 300);
    //z = random(-300, 300);
    x = 0;
    y = 0;
    z = 0;
    
    fishy = createShape(GROUP);
    fishTexture = loadImage("fish_texture.png");
    fish = loadShape("fish.obj");
    fish.setTexture(fishTexture);
    fish.scale(30);
    stroke(10);
    noFill();
    translate(width/2 - 20, height/2);
    fishHitBox = createShape(BOX, 20, 30, 100);
    //fishy.addChild(fish);
    fishy.addChild(fishHitBox);
    fishy.addChild(fish);
  }
  
  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotateX(PI);
    rotateY(theta);
    //rotateY(PI);
    shape(fishy, 0, 0);
    popMatrix();
  }
  
  void move() {
    pushMatrix();
    translate(width/2, height/2);
    rotateX(PI);
    rotateY(-theta);
    popMatrix();
  }
  

  
  boolean intersect(Shark b) {
    float distance = dist(this.x, this.y, this.z, b.x, b.y, b.z);
    
    if (distance < fish.width * fish.height + shark.width * shark.height) {
      return true;
    } else {
      return false;
    }
  }
}
