abstract class Body{

  PVector location;
  PVector velocity;
  PVector acceleration;

  color col; 
  float size;
  float mass;

  
  Body(PVector location, float size, float mass, color col) {
    this.location = location;
    this.size = size;
    this.mass = mass;
    this.col = col;    
    
    //Default
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);    
  }


  public void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  public void update() {
    //Applying Forces
    velocity.add(acceleration);
    location.add(velocity);

    //reset acceleration
    acceleration.mult(0);
  }
  
  public abstract void display();
  
 
}
