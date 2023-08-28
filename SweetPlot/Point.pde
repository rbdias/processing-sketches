/**
 * Points will float around from position to destiny changing colors in the way
 */
class Point {
  
  final private color[][] COLOR_TONES = new color[][]{
    {#f8f9fa, #e9ecef, #dee2e6, #ced4da, #adb5bd, #6c757d, #495057, #343a40, #212529}, //gray
    {#03045e, #023e8a, #0077b6, #0096c7, #00b4d8, #48cae4, #90e0ef, #ade8f4}, //ocean
    {#10002b, #240046, #3c096c, #5a189a, #7b2cbf, #9d4edd, #c77dff, #e0aaff}, //purple
    {#641220, #6e1423, #85182a, #a11d33, #a71e34, #b21e35, #bd1f36, #c71f37, #da1e37, #e01e37} //red
  };    
  
  private PVector position;
  private PVector destiny = null;
  private float radius;
  private float speed;
  private color c;     
  private int currentColorIndex = 0;

  Point(float x, float y, float radius, float speed) {
    position = new PVector(x, y);
    this.radius = radius;
    this.speed = speed;
    
    float iX = random(-width/2, width/2);
    float iY = random(-height/2, height/2);
        
    setDestiny(iX, iY);
    updateColor();
  }

  void setDestiny(float x, float y) {
    destiny = new PVector(x, y);
  }

  //Returns true if it reached Destination
  boolean update() {

    position.x= lerp(position.x, destiny.x, speed);
    position.y= lerp(position.y, destiny.y, speed);

    if (PVector.dist(destiny, position) < 1f) {
      position = destiny;
      updateColor();
      return true;
    }      

    return false;
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  private void updateColor(){
    color[] currentPallete = COLOR_TONES[currentColorIndex]; 
    c = currentPallete[int(random(0,currentPallete.length))];
    currentColorIndex = (currentColorIndex + 1)%COLOR_TONES.length;
  }
  

}
