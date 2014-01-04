class Catcher {          //class for making the catcher
  int w = displayWidth/10;           //declares and sets value for the width of the catcher
  int h;              //declaring the height of the catcher
  PVector loc;           //declaring a PVector for the location of the catcher

  Catcher() {
    h = 20;             // setting the value of the catcher to be twenty
  }

  void display () {         //the void for the actual catcher
    if (0 < mouseX - w/2 && mouseX +w/2 < width) {              //as long as the catcher doesn't go beyond the size of the screen, the given location of the catcher will always be true
      loc = new PVector(mouseX, height*3/4);           
    }
    pushMatrix();              //pushMatrix and popMatrix closes the code in between them into its own little void
    rectMode(CENTER);                 //sets the origin of the catcher at the center
    translate(loc.x, loc.y);              //places the catcher to its designated location
    fill(255);              //makes the color of the catcher white
    stroke(0);                      //makes the outline of the catcher black
    rect(0, 0, w, h);                //the creation of the catcher
    popMatrix();              
  }
  
  void increase(Score s, Raindrops r){    //giving the score the ability to increase and the catcher the ability to catch raindrops
    if (loc.dist(r.loc) < w/2 + r.d/2) {  //if the raindrops touch the catcher, it will disappear outside of the gamescreen
      r.loc.set(-width, -height);
      r.vel.set(0, 0);    //the raindrop will stop moving and accelerating
      r.acc.set(0, 0);
      s.point++;   //the score will increase by one everytime the catcher catches a raindrop
    }
  }
}

