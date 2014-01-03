class Startscreen { //class for creating the startscreen
  PVector loc;   //declaring values
  int w, h;

  Startscreen() {
    w= 50;   //setting the values for the variables
    h=50;
    loc = new PVector(width/2-w/2, height/2-h/2);
  }

  void display() {
    background(100);  //the background will be gray
    textAlign(CENTER); //the origin of the text is the center and its size is 50
    textSize(50);
    text("Raindrops Game", width/2, height *1/4);  //the text 'Raindrops Game' will appear in the screen
    rect(loc.x, loc.y, w, h);    //the button will show 
  }
}
