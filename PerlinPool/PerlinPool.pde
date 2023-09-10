/******************************************************
 * Copyright (c) 2023, Rodrigo Dias 
 *
 * Floating pattern using Perlin noise.
 * Variation of exercise I.10 from "The Nature of Code"
 * by Daniel Shiffman.
 *****************************************************/

final int SIZE = 22;
final int AMPLITUDE = 100;

//Actual Perlin parameters
float xOff = 0;
float yOff = 10000;

//More increment, more noise (smaller patterns)
float xIncr = 0.15;
float yIncr = 0.15; 

//Waving animation
float xOffBase = 0;
float yOffBase = 0;
float xOffBaseIncr = 0.009;
float yOffBaseIncr = 0.009;

float [][] vert = new float[SIZE][SIZE];

void setup() {
  size(1080, 1080, P3D);
  stroke(0, 0, 90);
}

void draw() {
  background(0);
  
  updatePerlin(xIncr, yIncr);
  drawFromMatrix(vert);
  
  //Create movement
  xOffBase += random(xOffBaseIncr);
  yOffBase += random(yOffBaseIncr);
}

//Apply noise to Z vertex matrix.
//Reset xOff and yOff to base and increment it to create
//noise movement.
void updatePerlin(float xInc, float yInc) {
  xOff = xOffBase;
  yOff = yOffBase;
  
  for (int j = 0; j < vert.length; j++) {
    xOff = xOffBase;
    
    for (int i = 0; i < vert.length; i++) {      
      vert[i][j] = map(noise(xOff, yOff), 0, 1, 0, AMPLITUDE);
      xOff += xInc;
    }
    yOff += yInc;
  }
}

//Split the screen into squares, distribute X and Y evenly and
//read Z data from the input vertices vector
void drawFromMatrix(float[][] v) {
  float numVertices = v.length - 1;
  float size = width/numVertices;

  for (int j = 0; j < numVertices; j++) {
    for (int i = 0; i < numVertices; i++) {
      fill(0, 20, 120 + (i*i*j*j*70)%100); //blue pattern
      beginShape();
      vertex(i*size, j*size, v[i][j]);
      vertex((i+1)*size, j*size, v[i+1][j]);
      vertex((i+1)*size, (j+1)*size, v[i+1][j+1]);
      vertex(i*size, (j+1)*size, v[i][j+1]);
      vertex(i*size, j*size, v[i][j]);
      endShape();
    }
  }
}
