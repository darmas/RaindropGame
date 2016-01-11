class Raindrop {//declare Raindrop
  PVector loc, vel, acc;//variable for length, speed, color
  float diam;
  color co;


  Raindrop() {//call functionality and intialize
    diam=20;
    loc=new PVector(random(0, width), 0);
    vel=PVector.random2D();
    acc=new PVector(0, .1);
    co= color(204, 255, 255);
  }
  void display() {//function so raindrops appear
    fill(co);
    noStroke();
    triangle(loc.x-diam/2, loc.y, loc.x, loc.y-40, loc.x+diam/2, loc.y);
    ellipse(loc.x, loc.y, diam, diam);
  }
  boolean isInContactWith() {//raindrop is in contact with the mouse, does something
    if (loc.y>height+diam/2) {
      return true;
    } else {
      return false;//disappears
    }
  }
  void fall() {//how the raindrops fall
    vel.add(acc);
    loc.add(vel);
  }
  void reset() {//when its over the screen, disappears 
    loc.y=0;
    vel.y=0;
  }
}