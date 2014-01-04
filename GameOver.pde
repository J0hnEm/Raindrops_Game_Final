class GameOver {       //class for creating the gameover screen
  PVector loc, gloc;      //declaring Pvector variables, 'loc'(location of the button) and 'gloc' (location of the final score)
  int w, h,d;           //declaring the w (width) and h (height) of the button

  GameOver() {
    w=180;         //setting the values of 'w' and 'h' to 50
    h=40;
    d=40;
    gloc = new PVector(width/2, height*1/4);      //setting the PVector values of gloc and loc)
    loc = new PVector(width/2, height*5/8);
  }

  void display(Score s) {     //creating the gameover screen. 'Score s' is placed inside the parenthesis to identify variables that was used from the Score class   
    textAlign(CENTER);      //the origin point of the text is at its center
    pushMatrix();
    fill(255);                //making messages
    textSize(30);
    text("special message",width/2, height*1/6);
    textSize(50);
    text("YOU HAVE DROWNED", width/2, height*1/8);
    popMatrix();
    pushMatrix();   //trapping the 'message' into its own void
    fill(255);   //the words will be in white
    textSize(50);       //the text size is 50
    translate(gloc.x, gloc.y);      //instantly places the 'message' text to the designated values of the PVector gloc
    if (0 <= s.point && s.point < 25) {     //if the score is greater than or equal to 0 and less than 25, the message 'Mamma Mia' will appear
      text("Mamma Mia", 0, 0);
    }
    if (25 <= s.point && s.point < 50) {   //if the score is greater than or equal to 25 and less than 50, the message 'eehh...' will appear
      text("eehh...", 0, 0);
    }
    if (50 <= s.point && s.point < 100) {   //if the score is greater than or equal to 50 and less than 100, the message 'You're So Cool!' will appear
      text("You're So Cool!", 0, 0);
    }
    if (s.point >= 100) {    //if the score is greater than or equal to 100, the message 'Oou Kill Em!' will appear
      text("Oou Kill Em!", 0, 0);
    }
    popMatrix();
    text("Final Score:" + s.point, width/2, height/2);    //the Final score will be shown at the middle of the screen
    pushMatrix();
    fill(242,141,46);       //the color of the button is orange
    noStroke();
    ellipse(loc.x+90,loc.y-5,d,d);    //creating the buttton
    ellipse(loc.x-90,loc.y-5,d,d);
    rectMode(CENTER);     //the origin of the button will be at its center
    rect(loc.x, loc.y-5, w, h); 
    textSize(20);
    fill(0);
    text("Play Again?", loc.x, loc.y);  //the 'Play Again' message appears at its specified location
    popMatrix();
  }
}

