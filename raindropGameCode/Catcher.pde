class Catcher {//declare the bucket
  float diam;   // radius
  color co; // color
  PVector loc; // location

  Catcher(float tempD) {//intialize/call
    diam = tempD;
    co = color(128, 128, 128);
    loc = new PVector(0,0);
  }

  void setLocation(PVector m) {//where the bucket will temporarily be
    loc.set(m.x,m.y);
  }

  void display() {//function for bucket appearance
    noStroke();
    fill(co);
    ellipse(loc.x,loc.y, diam*4, diam*4);
  }

  // A function that returns true or false based on
  // if the catcher intersects a raindrop
  boolean intersect(Raindrop d) {
    // Calculate distance
    float distance = loc.dist(d.loc); 

    // Compare the length of the bucket to the raindrop
    if (distance < diam + d.diam) { 
      return true;
    } else {
      return false;
    }
  }
}