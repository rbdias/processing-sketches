
/******************************************************
 * Copyright (c) 2023, Rodrigo Dias
 *
 * Dissolve - Inspired by "Nature of Code" Chapter 2
 * Set HIDE_ATTRACTOR to FALSE to visualize the physics
 *****************************************************/

final int STEP = 9;
final boolean HIDE_ATTRACTOR = true;
final int PIXEL_SIZE = 5;
final color BG_COLOR = #1496BB; 
final String MAIN_TEXT = "DISSOLVA";
final int TEXT_COLOR = 255;

Painter painter;
ArrayList<Painter> painters = new ArrayList<Painter>();
ArrayList<Attractor> attractors = new ArrayList<Attractor>();

PFont font;
TextTexture tt;


void setup() {
  size(1400, 900, P2D);
  font = createFont("Caprasimo-Regular.ttf", 10);
  background(0, 0, 0);
  noStroke();

  //Create Text Texture
  tt = new TextTexture(width, height, font);
  tt.bg=50;
  tt.textSize=230;
  tt.setTextColor(255);
  tt.setText(MAIN_TEXT);
  tt.render();
  tt.loadPixels();

  //On this sketch, painters will not paint.
  //They will behave just like particles.
  for (int i = 0; i < width; i+=STEP) {
    for (int j = 0; j < height; j+=STEP) {
      int index = i + j * tt.getTexture().width;
      color col = tt.getTexture().pixels[index];
      if (col == color(255)) {
        painters.add(createPainter(i, j, TEXT_COLOR, PIXEL_SIZE, 500));
      }
    }
  }

  //Set up 4 attractors and add them initial forces.
  //They will make the text spin
  Attractor top = createAttractor(width/2, height/8, 100, color(200, 0, 0));
  Attractor bottom = createAttractor(width/2, height/8*7, 100, color(200, 0, 0));
  Attractor topLeft = createAttractor(0, 0, 100, color(400, 0, 0));
  Attractor bottomRight = createAttractor(width, height, 100, color(400, 0, 0));

  top.applyForce(new PVector(0, 3* height/100));
  bottom.applyForce(new PVector(0, 3* -height/100));

  attractors.add(top);
  attractors.add(bottom);

  topLeft.applyForce(new PVector(16* width/100, height/100));
  bottomRight.applyForce(new PVector(16* -width/100, -height/100));

  attractors.add(topLeft);
  attractors.add(bottomRight);
}


void draw() {
  background(BG_COLOR);
  drawFrame();
}

void drawFrame() {

  for (Attractor att : attractors) {
    att.update();
    att.display();
    att.mass *= 1.005;

    for (Painter painter : painters) {
      painter.applyForce(att.attract(painter));
      painter.update();
      painter.display();
    }
  }
}

Painter createPainter(float x, float y, color col, float size, float mass) {
  PVector initialPos = new PVector(x, y);
  return new Painter(initialPos, size, mass, col);
}

Attractor createAttractor(float x, float y, float mass, color col) {
  PVector initialPos = new PVector(x, y);
  float size = 10;
  return new Attractor(initialPos, size, mass, col);
}
