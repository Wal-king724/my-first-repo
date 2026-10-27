 //variables for system don't change
EnteringInitialsScreen theEnteringInitialsScreen;
GameOverScreen theGameOverScreen;
Instructions theInstructions;
Game theGame;
long noInputCnt;
int state;

void setup() {
  size(1600, 900, P2D);
  //fullScreen(P2D);
  state = 0;
  noInputCnt = 0;
  theEnteringInitialsScreen = new EnteringInitialsScreen();
  theGameOverScreen = new GameOverScreen();
  theInstructions = new Instructions();
  theGame = new Game();
}

void restartGame() {  
  theGame = new Game();
}

void draw() {
  noInputCnt++;
  scale(width/1600, height/900);

  //FINITE STATE MACHINE
  if (noInputCnt == 60 * 60 * 30) {
    state = 4; //If no one touches the game for 30 minutes the screen will go black
    noInputCnt = 0;
  } else if (noInputCnt == 60 * 60 * 2) {
    noInputCnt = 0;
    state = 0;  //no one touches the game for 2 minutes, go to gaveOver/playAgain screen
  } else if (noInputCnt == 60 * 10 && state == 1) { //instructions and initials only stay up for 10 seconds
    state = 2;
    restartGame();
    noInputCnt = 0;
  } else if (noInputCnt == 60 * 10 && state == 3) {  //clear the initials screen after 10 seconds
    noInputCnt = 0;
    state = 0;
  } else if (state == 2 && theGame.gameOver) {
    state = 3;
    noInputCnt = 0;
    theEnteringInitialsScreen = new EnteringInitialsScreen();
  }

  //DRAW CORRECT SCREEN
  if (state == 0) {
    theGameOverScreen.display();
  } else if (state == 1) {
    theInstructions.display();
  } else if (state == 2) {
    theGame.display();
  } else if (state == 3) {
    theEnteringInitialsScreen.display();
  } else if (state == 4) {
    background(0);
  }
}

void keyPressed() {
  noInputCnt = 0;
  if (state == 0) {
    state = 1;
  } else if (state == 1) {
    state = 2;
    restartGame();
  } else if (state == 2) {
    theGame.keyPressed();
  } else if (state == 3) {
    theEnteringInitialsScreen.keyPressed();
    if (key == 'z') {
      state = 0;
    }
  } else if (state == 4) {
    state = 0;
  }
}

void keyReleased() {
  if (state == 2) {
    theGame.keyReleased();
  }
}
