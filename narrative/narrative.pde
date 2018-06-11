/*
 MSDS 6390 Assignment 4: Dynamic Composition 2
 Dynamic Narrative- Attack on Bikini Bottom!
 Team: Jostein Barry-Straume, Brian Yu
 Date: 06/10/18
 Sources:
 https://www.youtube.com/watch?v=6VSaneuiaWs
 https://free3d.com/3d-model/puo-3970-23212.html
 */

import processing.opengl.*;

PImage bikiniBottom;
PImage oceanFloor;
PImage sharkTexture;
PImage octopusTexture;
PImage killerWhaleTexture;
PImage fishTexture;

PShape squidHouse;
PShape spongebobPineapple;
PShape shark;
PShape killerWhale;
PShape fish;
ArrayList<Fish> fishes;

Shark shark1;
KillerWhale killerWhale1;
ParticleSystem ps;

float theta = 0;

void setup() {
  size(1279, 689, P3D); // Match size of the bikini bottom background image
  noStroke();
  
  // Source:
  // http://il3.picdn.net/shutterstock/videos/3460097/thumb/1.jpg
  oceanFloor = loadImage("ocean_floor.jpg");
  oceanFloor.resize(width, height);
  //background(oceanFloor);
  
  // Source:
  // http://www.guibingzhuche.com/WDF-853091.html
  bikiniBottom = loadImage("bikini_bottom.jpg");
  //print(bikiniBottom.width, bikiniBottom.height);
  
  // Source:
  // https://www.yobi3d.com/q/3d-model-spongebob-house
  squidHouse = loadShape("squidhouse.obj");
  squidHouse.scale(10);
  
  // Source:
  // https://www.models-resource.com/pc_computer/spongebobsquarepantskrabbyquest/model/21884/
  spongebobPineapple = loadShape("building_pineapple01.obj");
  spongebobPineapple.scale(1);
  
  // Instantiate the various sea creatures and blood particle system
  shark1 = new Shark();
  killerWhale1 = new KillerWhale();
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
  fishes = new ArrayList<Fish>();
  for (int i = 0; i < 10; i++) {
    fishes.add(new Fish(new PVector(random(200, width/2), random(-500, 500))));
  }  
}

void draw() {
  background(bikiniBottom);
  //background(oceanFloor);
  lights();
  
  // Draw SpongeBob's and Squidward's houses
  pushMatrix();
  translate(width/2, height/2);
  rotateX(PI);
  rotateY(PI);
  shape(squidHouse, -100, -150);
  shape(spongebobPineapple, -225, -150);
  popMatrix();
  
  // Event to trigger predator attack
  // Creates blood particles
  if (mousePressed == true) {
    ps.addParticle();
    ps.run();  
  }

  // Draws a great white shark if any key is pressed
  // Otherwise draws a killer whale
  if (keyPressed) {
    shark1.display();
  } else {
    killerWhale1.display();
  }
  
  // For loop that iterates through the array list 
  // of fishes and updates each of their movements
  for (int i = fishes.size() - 1; i >= 0; i--) {
    Fish fish = fishes.get(i);
    fish.display();
  }

  // Update theta for rotation of shark, whale, and fishes
  theta += .02;
}

// Clears the array list of particles when the mouse is released
// This is to simulate a new predator attack
void mouseReleased() {
  ps.removeParticles();
}
