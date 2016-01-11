class Timer {//declare the timer
  int s;
  int m;

  Timer() {//initialize
    s=0;
    m=0;
  }

  void display() {//call functionality
    fill(153, 204, 0);
    textAlign(CENTER);//how the text will look like 
    textSize(50);
    delay(1000);
    if (s<=59) {//before it reaches 60 seconds, only the right hand side will change 
      text(m+":"+s, width/2, height/2);
      s=s+1;
    } else {//the left side will now change after 60 seconds
      m=m+1;
      s=0;
      text(m+";"+s, width/2, height/2);
    }
  }
  void reset(){//function so time resets when game over
    m=0;
    s=0;
  }
}