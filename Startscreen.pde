class Startscreen { //class for creating the startscreen
  PVector loc;   //declaring values
  int d;

  Startscreen() {
    d = 100;   //setting the values for the variables
    loc = new PVector(width/2, height/2);
  }

  void display() {
    pushMatrix();   //closing the code in so that none of it affects the rest of the game
    textAlign(CENTER); //the origin of the text is the center and its size is 50
    textSize(50);
    fill(30,89,95);
    text("Raindrops Game", width/2, height *1/4);  //the text 'Raindrops Game' will appear in the screen
    fill(30,89,95,80);
    stroke(0);        //no outline
    ellipse(loc.x, loc.y, d,d);    //the button will show 
    popMatrix();
  }
}
