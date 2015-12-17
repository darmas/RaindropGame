class Raindrop {
  PVector loc, vel, acc;
  float diam;
  color c;

  Raindrop() {
    diam=20;
    loc=new PVector(random(0, width), 0);
    vel=PVector.random2D();
    acc=new PVector(0, 5);
    c= color(204, 255, 255);
  }
  void display() {
    fill(c);
    noStroke();
    triangle(loc.x-diam/2, loc.y, loc.x, loc.y-40, loc.x+diam/2, loc.y);
    ellipse(loc.x, loc.y, diam, diam);
  }

  void fall() {
    vel.add(acc);
    loc.add(vel);
  }
  boolean isInContactWith(PVector m) {
    if (loc.dist(m) < diam/2) {
      return true;
    } else {
      return false;
    }
  }
  void reset() {
    loc.y=0;
    vel.y=0;
  }
}