class Score { //class for creating the Score
  int point = 0;      //declaring 'point' and setting its starting value to be zero

  Score() {
  }

  void display() { //creating the score
    pushMatrix();
    fill(0);  //the score will be colored black
    textSize(50);     //the size of the text is 50
    textAlign(CENTER);    //the origin of the text will be its center
    text("Score:" + point, width/2, height*1/4); //the score will be shown at the top of the screen
    popMatrix();
  }
}
