Raindrops[] r;      //declaring raindrops array variable
Catcher c;          //declaring catcher, score, Gameover, Startscreen, and Flood variables
Score s;
GameOver go;
Startscreen sc;
Flood f;
PImage img, imgGo;            //declaring image variables
boolean a = true;             //declaring boolean variables to control the transitions between the Startscreen, the actual game, and the Gameover screen
boolean b = false;
boolean d = false;
int currentTime, oldTime, lastScore;
int index = 0;   //declaring currentTime, oldTime, waitTime and index to control the amount of raindrops that would appear
int time = 100;                   //declaring time to show how long it takes for the next raindrop to fall
int waitTime = time;              //waitime acts the same purpose as the time variable;
int difficulty = 10;              //difficulty sets how many points the player has to get to make the game harder

void setup() {
  size(displayWidth, displayHeight);                //size of the screen
  r = new Raindrops[100000];               //setting the value of the total amount of raindrops that can fall
  for (int i = 0; i < r.length; i++) {        //setting the value of the raindrops array variable
    r[i] = new Raindrops();
  }
  c = new Catcher();              // giving value to each of the variables that was declared
  s =new Score();
  go = new GameOver();
  sc = new Startscreen();
  f = new Flood();
  img = loadImage("rain.jpg");         //loading up the images
  imgGo = loadImage("gameover.png");
}

void draw() {
  if (d) {                               //if 'd' is true, the gameover screen will apear width its specified image
    image(imgGo, 0, 0,displayWidth,displayHeight);   
    go.display(s);
  }
  if (a) {                            //if 'a' is true, the startscreen will appear width its specified image
    image(img, 0, 0, displayWidth, displayHeight);
    sc.display();
  }
  if (b) {                              // if 'b' is true, the raindrops game will start
    currentTime = millis();               //setting currentTime to equal to milliseconds
    image(img, 0,0,displayWidth,displayHeight);                 //the image is shown
    f.display();                         //display the flood
    c.display();                           //display the catcher
    for (int i = 0; i < index; i++) {          //display the raindrops array; the number for index will determine how many raindrops can fall
      r[i].display();                   //display raindrops
      r[i].drop(f);               //give the raindrops the ability to fall
      c.increase(s, r[i]);             //if catcher catches a raindrops, the score will increase by one
    }
    if (currentTime - oldTime >= waitTime) {          //if currentTime becomes greater than or equal to the waitTime, one raindrop will fall
      if (index<r.length) {             //if index is less than the total amount of raindrops that was set before, the index can increase as fast as the waitTime tells it to
        index++;
      }
      oldTime = currentTime;            //oldTime balances the currentTime back to zero again
    }
    if (s.point - lastScore >= difficulty) {     //s.point represents the amount of raindrops that the catcher caught; if s.point becomes greater than or equal to difficulty, the 'if' statement will apply
      waitTime -= 100;                         //the waitTime will decrease by a hundred and the last Score will balance the s.point back to zero
      lastScore = s.point;
    }
    s.display();                           //displays the score (s.point)
  }
  if (f.level >= displayHeight) {               //once the flood covers the whole screen, the game will end
    d = true;                          //displays the gameover screen
    b = false;                  //removes the game
  }
}

void mousePressed() {
  if (mouseX > go.loc.x && mouseX < go.loc.x + go.w && mouseY > go.loc.y && mouseY < go.loc.y + go.h) {      //if the button in the gameover screen is pressed, the given values will restart back to zero
    a=true;              //the startscreen is displayed
    d=false;                 //the gameover screen is removed
    f.level = 0;                  //restarts the variables back to their original values
    s.point = 0;
    waitTime = time;
    lastScore = 0;
  }
  if (mouseX > sc.loc.x - sc.d && mouseX < sc.loc.x + sc.d && mouseY > sc.loc.y - sc.d && mouseY < sc.loc.y + sc.d) {
    a=false;              //if the button in the startscreen is pressed, the startscreen will disappear and the game will start
    b=true;
  }
}

