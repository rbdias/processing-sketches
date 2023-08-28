/******************************************************
 * Copyright (c) 2023, Rodrigo Dias 
 *
 * Sweet plot of a heart
 *****************************************************/

final int NUM_POINTS = 3000;
final int SIZE = 230;
final float SPEED = 0.03;
final float RANGE_MIN = -1.6;
final float RANGE_MAX = 1.6;

Point[] points;
color fixedBgColor = 12;

void setup() {
  size(900, 900, P2D);
  noSmooth();

  points = new Point[NUM_POINTS];

  //Big Bang
  for (int i = 0; i < NUM_POINTS; i++) {
    points[i] = new Point(0, 0, random(1, 3), SPEED);
  }
}

void draw() {
  background(fixedBgColor);
  int centerX = width/2;
  int centerY = height/2;

  translate(centerX, centerY);

  for (Point p : points) {
    if (p.update()) {
      float x = random(RANGE_MIN, RANGE_MAX);
      float y = drawHeart(x);
      p.setDestiny(x * SIZE, y * SIZE);
    }

    p.display();
  }
}

private float drawHeart(float x) {
  return -(sqrt(cos(x))*cos(400*x)+sqrt(abs(x))-0.4)*(pow(4-x*x, 0.1)); //heart equation
}
