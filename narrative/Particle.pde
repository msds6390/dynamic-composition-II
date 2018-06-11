// Source:
// https://processing.org/examples/simpleparticlesystem.html
class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    pushMatrix();
    translate(mouseX, mouseY);
    // Source:
    // http://www.colourlovers.com/color/8A0707/Blood_red
    //stroke(17, 169, 190, lifespan);
    stroke(138, 7, 7, lifespan);
    fill(138, 7, 7, lifespan);
    ellipse(position.x, position.y, 8, 8);
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
