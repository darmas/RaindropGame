PVector mouse;   //declare a P
ArrayList<Raindrop> r= new ArrayList<Raindrop>();      //declare a new ArrayList called r for the raindrop
Catcher C;//declare Bucket
Timer timer;//declare Timer
PImage background;
// On your own, create an array of Raindrop objects instead of just one
// Use the array instead of the single object
// You can start out by just using the single Raindrop as you test

int mode=0;//0 is intro, 1 is normal play, 2 means game has ended

void setup() {//run settings once

  mouse = new PVector();         //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  //Initialize r. The parameters used are the initial x and y positions
  C= new Catcher(20);//initalize catcher
  timer= new Timer();//initialize timer
  background= loadImage("background.jpg");
  for ( int i=0; i<5; i++) {//for loop and arraylist. 
    r.add(new Raindrop ());
  }
}
void draw() {//run settings in loop
  if (mode==0) {//intro 
    fill(0, 255, 0);
    imageMode(CENTER);//background 
    image(background, width/2, height/2);
    textSize(20);
    textAlign(CENTER);
    fill(255);
    text("WELCOME TO THE DROP", width/2, height/2-50);
    text("YOU ARE TIMED. CATCH ALL THE RAINDROPS OR ELSE.", width/2, height/2+25);
    text("PRESS ENTER TO START", width/2, height/2+50);
    if (keyPressed==true) {
      //if(keyCode==ENTER)
      mode=1;
    }
  }

  if (mode==1) {//normal play
    background(0);
    mouse.set(mouseX, mouseY);//set value of mouse as mouseX,mouseY
    C.setLocation(mouse);//call functions for catcher and raindrop
    C.display();
    timer.display();//call function for timer
    for (int i=0; i<r.size(); i++) {
      Raindrop rd= r.get(i);
      rd.fall();         //make the raindrop fall. It should accelerate as if pulled towards the ground by earth's gravity
      rd.display();      //display the raindrop
      if (C.intersect(rd)) {      //check to see if the raindrop is in contact with the point represented by the PVector called mouse
        r.remove(i);                         //remove the raindrops once it goes pass the height 
      }
      //if (rd.loc.y > height + rd.diam/2) {     //check to see if the raindrop goes below the bottom of the screen
      //  r.remove(i);                           //if it does, reset the raindrop
      //}
      if (rd.loc.y>height) {
        mode=2;
      }
    }
  }
  if (mode==2) {//game over screen
    background(0);
    fill(0, 255, 0);
    textSize(20);
    textAlign(CENTER);
    text("GAME", width/2, height/2);
    text("OVER", width/2, height/2+75);
    text("PRESS ENTER TO PLAY AGAIN", width/2, height/2+150);
    timer.reset();
    if ( keyPressed==true) {
      //if(keyCode==ENTER)
      mode=0;//returns to the beginning screen and timer is reset
    }
  }
}