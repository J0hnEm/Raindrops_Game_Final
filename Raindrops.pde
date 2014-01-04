class Raindrops {     //class for raindrops
  PVector loc, vel, acc;              //declaring Pvectors loc(location of the raindrops), vel (velocity of the raindrops), and acc(acceleration of raindrops)
  int d;                //declaring d (size of the circle part of the raindrop

  Raindrops() {
    d=5;        //setting the value of d to 5
    loc = new PVector(random(d, width-d), -10);         //setting the values of the PVectors. a random number will be chosen inside the 'random parenthesis' everytime a raindrop falls 
    vel = new PVector(0, random(.01, 3));
    acc = new PVector(0, random(0, 0.3));
  }

  void display() {     //creating the raindrop
    pushMatrix();       //every code that is between the pushMatrix() and popMatrix() will only apply there 
    fill(127, 212, 242);       //the color of the raindrop is blue
    stroke(0);         //the outline of the raindrop black
    translate(loc.x, loc.y);  //the raindrops will automatically appear at the specified values of loc
    ellipse(0, 0, d, d);         //creating the circle part of the raindrop
    beginShape();    //creating my own shape (triangle) that will connect with the circle part of the raindrop. (the triangle code would've worked the same way)
    vertex(-d/2, 0);   //locations of the three points of the triangle
    vertex(0, -d*2);
    vertex(d/2, 0);
    endShape();
    popMatrix();
  }

  void drop(Flood f) {   //giving the raindrop the ability to fall. 'Flood f' is placed to recognize the variables used from the Flood class
    loc.add(vel);       //makes the raindrop fall
    vel.add(acc);         //makes the raindrop fall faster
    if (loc.y > height + 10) {     //if the raindrop falls at the bottom of the screen, it will disappear outside of the game screen
      loc.set(-width, -height);   
      vel.set(0, 0);      //the raindrop will stop moving
      acc.set(0, 0);       //the raindrop will stop accelerating
      f.level+=5;    //the level will increase by 5, increasing the height of the flood
    }
  }
}

