

class Painter extends Body{
   
  float currentSpotLight = 8;
  final float SPOTLIGHT_MIN = 1.5;
  
  Painter(PVector location, float size, float mass, color col){
     super(location, size, mass, col); 
  }

  public void display(){
    
    fill(col, 255);
    
    ellipse(location.x, location.y, size, size);
    currentSpotLight = Math.max(SPOTLIGHT_MIN, currentSpotLight-= 0.05);
  }

}
