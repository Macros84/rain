
class Rain {
  PVector location;
  PVector bottom;
  PVector velocity;
  PVector gravity;
  PVector wind;
  PVector gust;

  float rainlen=random(10, 50);
  ;

  float startAngle;
  float angleVelocity;
  float angleAcceleration;

  boolean isDead;

  
  float rt=0;
  float gt=0;
  float bt=0;
  float at=0;

  float lifespan=random(100,150);

  float mass=random(1, 5);

  Rain() {



    location=new PVector(random(0, width), random(0, height/8));
    bottom=new PVector(location.x, location.y);
    velocity=new PVector(0, .00);
    gravity=new PVector(0, 0.1);
    wind=new PVector(0, 0);
    gust=new PVector(0.1, 0);
  }


  void edges() {
    if (location.y>=height-rainlen) {
      location.y=0;
      bottom.y=0+rainlen;
      location.x=random(0, width);
    }
    if (location.x<0) {
      location.x=width;
    }
    if (location.x>width) {
      location.x=0;
    }
  }

  void update() {

    bottom.x=location.x+rainlen*sin(startAngle);
    bottom.add(velocity);
    location.add(velocity);
    velocity.add(gravity);
    velocity.add(gust);
    velocity.add(wind);
      velocity.limit(10);
    if (mousePressed==true) {
      velocity.x=velocity.x+gust.x*2;
      startAngle=startAngle+gust.x/2;
      startAngle= constrain(startAngle, 0, .7);
    } else {

      velocity.x=startAngle;
      if (startAngle>0) {
        startAngle=startAngle-.04;
      } else if (startAngle<0) {
        startAngle=0;
      }
      if (gust.x>0) {
        gust.x=gust.x-.001;
      } else if (gust.x<0) {
        gust.x=gust.x;
      }
    }




    if (lifespan>=0) {
      lifespan=lifespan-1;
    }
  }
  boolean isDead() {
    if (lifespan<=0||location.y>height) {
      return true;
    } else {
      return false;
    }
    //  velocity.mult(0);
  }


  boolean isLow() {
    if (location.y>height-height/4) {
      return true;
    } else { 
      return false;
    }
  }

  void display() {
    // point(location.x, location.y);
    line(location.x, location.y, bottom.x, bottom.y+rainlen);
   
  }



  void coloring() {
    rt=rt+0.02;
    gt=gt+0.01;
    bt=bt+0.03;
    at=at+0.02;
    float r=noise(rt);
    float g=noise(gt);
    float b=noise(bt);
    float a=noise(at);
    r=map(r, 0, 1, 200, 255);
    g=map(g, 0, 1, 150, 255);
    b=map(b, 0, 1, 50, 255);
    a=map(a, 0, 1, 50, 100);


    strokeWeight(mass);
    stroke(r, g, b, a);
    fill(0, g, b, a);
  }
  float r = random(1);
}