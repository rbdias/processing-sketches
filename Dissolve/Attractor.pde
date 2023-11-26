class Attractor extends Body {

  final float G = .01;

  Attractor(PVector location, float size, float mass, color col) {
    super(location, size, mass, col);
  }

  public PVector attract(Body body) {
    PVector force = PVector.sub(location, body.location);
    float distance = force.mag();

    distance = constrain(distance, 5, 25);
    force.normalize();

    float strength = (G * mass * body.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }

  public void display() {
    if (!HIDE_ATTRACTOR) {
      fill(col, 255);
      ellipse(location.x, location.y, size, size);
    }
  }

}
