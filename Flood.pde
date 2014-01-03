class Flood {    //class for making the Flood
  int level;          //declaring the level variable which signifies how high the flood is

  Flood() {
  }

  void display() {         //creating the flood
    for (int i = 0; i< level; i+=5) {       //a 'for' statement that limits the height of the flood by what number the level is set at 
      fill(33, 40, 106);                    //the color of the flood is blue
      rect(0, height - i, width*2, 5);       //the flood covers the whole width of the screen. The flood starts at the bottom of the screen and then rises to the top as 'i' gets larger 
    }
  }
}

