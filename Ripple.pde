class Ripple {

  PVector location;

  int size;

  color strokeColor;

  Ripple(PVector l) {
    location=l;
    size=1;

    strokeColor=color(random(255), random(255), random(255),30);
  }

  void update() {
    size+=1;
  }

  void display() {
    noFill();
    ellipseMode(CENTER);
    strokeWeight(random(1,5));
    stroke(strokeColor);
    ellipse(location.x, location.y, size, size/2);
  }

  boolean isDead() {
    if (size>100) {
      return true;
    } else {
      return false;
    }
  }
}