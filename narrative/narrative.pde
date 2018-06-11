/*
 MSDS 6390 Assignment 3: Dynamic Composition 1
 Dynamic Narrative
 Team: Jostein Barry-Straume, Brian Yu
 Date: 06/10/18
 Sources:
 https://www.youtube.com/watch?v=6VSaneuiaWs
 https://free3d.com/3d-model/puo-3970-23212.html
 */

import processing.opengl.*;

PImage oceanFloor;
PImage sharkTexture;
PImage octopusTexture;
PImage killerWhaleTexture;
PImage fishTexture;
PShape shark;
PShape octopus;
PShape killerWhale;
PShape fish;
float theta = 0;
Shark shark1;
Fish fish1;
PShape fishy;
PShape fishHitBox;
PShape sharky;
PShape sharkHitBox;
ParticleSystem ps;

void setup() {
  size(1000, 1000, P3D);
  noStroke();
  // Source:
  // http://il3.picdn.net/shutterstock/videos/3460097/thumb/1.jpg
  oceanFloor = loadImage("ocean_floor.jpg");
  oceanFloor.resize(width, height);
  background(oceanFloor);

  //octopusTexture = loadImage("OCTOPUS.JPG");
  killerWhaleTexture = loadImage("killerWhaleTexture.jpg");

  //// Source:
  //// https://www.processing.org/reference/loadShape_.html
  //// https://blender.stackexchange.com/questions/47915/when-i-save-something-as-an-obj-file-the-texture-does-not-save-with-it-why
  //shark = loadShape("GreatWhite.obj");
  //shark.setTexture(sharkTexture);

  ////octopus = loadShape("OCTOPUS.OBJ");
  ////octopus.setTexture(octopusTexture);

  killerWhale = loadShape("Killer_Whale.obj");
  killerWhale.setTexture(killerWhaleTexture);
  killerWhale.scale(80);

  shark1 = new Shark();
  fish1 = new Fish(new PVector (0, -300));
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
}

void draw() {
  background(oceanFloor);
  lights();

  //shape(killerWhale, 0, 300);
  //shape(octopus, 0, 0);
  
  if (mousePressed == true) {
    ps.addParticle();
    ps.run();  
  }

  
  shark1.move();
  //fish1.update();

  
  if (shark1.intersect(fish1)){
    fill(0);
    ellipse(100, 100, 300, 300);
    print("Intersection!");
  }
  
  
  fish1.display();
  shark1.display();
  

  theta += .02;
}

void mouseReleased() {
  ps.removeParticles();
}
