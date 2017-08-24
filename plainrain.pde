//Rain [] r=new Rain[50000]; 
ArrayList<Rain> rain;
ArrayList<Ripple> ripple;
void setup() {
  //size(1000,800);
  fullScreen(P2D);
  rain=new ArrayList<Rain>();
  ripple=new ArrayList<Ripple>();
  background(55);
  //   frameRate(1);
}

void keyPressed() {
  if (key=='a') {
    rain.add(new Rain());
  }
}


void draw() {

  rain.add(new Rain());
  background(55);
  for (int i=rain.size()-1; i>0; i--) {
    Rain r=rain.get(i);
    r.coloring();
    r.edges();
    r.update();
    r.display();
    if (r.isLow()&&r.isDead()) {
      Ripple rip=new Ripple(r.bottom); 
      ripple.add(rip);

      rain.remove(i);
    }
  }
  for (int j=ripple.size()-1; j>0; j--) {
    Ripple rip=ripple.get(j);
    rip.update();
    rip.display();
    if (ripple.get(j).isDead()) {
      ripple.remove(j);
    }


    println(ripple.size());
  }
}