/*
 MSDS 6390 Assignment 3: Dynamic Composition 1
 Dynamic Narrative
 Team: Jostein Barry-Straume, Brian Yu
 Date: 06/10/18
 Sources:
 https://www.howeart.net/shindahiku-fern-pull
 https://processing.org/discourse/beta/num_1221179611.html
 https://www.openprocessing.org/sketch/346369
 https://youtu.be/1CNU3DQclGs?t=2m40s
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

void setup() {
  size(1000, 1000, P3D);
  noStroke();
  // Source:
  // http://il3.picdn.net/shutterstock/videos/3460097/thumb/1.jpg
  oceanFloor = loadImage("ocean_floor.jpg");
  oceanFloor.resize(width, height);
  background(oceanFloor);

  sharkTexture = loadImage("sharkTexture2.jpg");
  octopusTexture = loadImage("OCTOPUS.JPG");
  killerWhaleTexture = loadImage("killerWhaleTexture.jpg");
  fishTexture = loadImage("fish_texture.png");

  // Source:
  // https://www.processing.org/reference/loadShape_.html
  // https://blender.stackexchange.com/questions/47915/when-i-save-something-as-an-obj-file-the-texture-does-not-save-with-it-why
  shark = loadShape("GreatWhite.obj");
  shark.setTexture(sharkTexture);

  //octopus = loadShape("OCTOPUS.OBJ");
  //octopus.setTexture(octopusTexture);

  killerWhale = loadShape("Killer_Whale.obj");
  killerWhale.setTexture(killerWhaleTexture);
  killerWhale.scale(80);

  fish = loadShape("fish.obj");
  fish.setTexture(fishTexture);
  fish.scale(30);
}

void draw() {
  background(oceanFloor);
  lights();
  pushMatrix();
  rotateX(PI);
  rotateY(theta);
  shape(shark, -mouseX, -mouseY);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotateX(PI);
  rotateY(theta);
  shape(fish, 0, -100);
  shape(fish, -100, -200);
  shape(fish, -200, -300);
  popMatrix();

  //shape(killerWhale, 0, 300);
  //shape(octopus, 0, 0);

  theta += .02;
}
