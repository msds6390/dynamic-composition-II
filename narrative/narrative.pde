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
KillerWhale killerWhale1;
ParticleSystem ps;
ArrayList<Fish> fishes;

void setup() {
  size(1000, 1000, P3D);
  noStroke();
  // Source:
  // http://il3.picdn.net/shutterstock/videos/3460097/thumb/1.jpg
  oceanFloor = loadImage("ocean_floor.jpg");
  oceanFloor.resize(width, height);
  background(oceanFloor);

  shark1 = new Shark();
  killerWhale1 = new KillerWhale();
  fish1 = new Fish(new PVector (0, -300));
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
  fishes = new ArrayList<Fish>();
  for (int i = 0; i < 10; i++) {
    fishes.add(new Fish(new PVector(random(100, width/2), random(-500, 500))));
  }  
}

void draw() {
  background(oceanFloor);
  lights();
  
  if (mousePressed == true) {
    ps.addParticle();
    ps.run();  
  }

  if (keyPressed) {
    killerWhale1.display();
  } else {
    shark1.display();
  }
  //fish1.display();
  
  for (int i = fishes.size() - 1; i >= 0; i--) {
    Fish fish = fishes.get(i);
    fish.display();
  }

  theta += .02;
}

void mouseReleased() {
  ps.removeParticles();
}
