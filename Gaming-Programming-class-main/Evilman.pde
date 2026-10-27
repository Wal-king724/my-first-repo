import processing.sound.*;
class EvilMan {
  //variables
  float xPos;
  float yPos;
  float xVelo;
  float yVelo;
  float health;
  int bullets;
  int shootTime = round(random(5, 60));
  boolean dead = false;
  int iFrames = 0;
  SoundFile  shot;
  PImage pRight ;

  EvilMan() {
    //initializations from setup()
    xPos = random(1000, 1400);
    yPos = random(0, 600);
    xVelo = 1;
    yVelo = 6;
    health = 300;
  shot = new SoundFile(myarcadegame.this, "boosshooting.mp3");
    pRight = loadImage("villian134.png");
    pRight.resize(120, 150);
  }


  void display() {
    //draw()
    if (!dead) {
      xPos += xVelo;
      yPos += yVelo;

      //xPos = mouseX;
      //yPos = mouseY;

      ////teleport from right to left
      //if (xPos > 800) {
      //  mouseX = 0;
      //}

      ////teleport from bottom to top
      //if (yPos > 600) {
      //  mouseY = 0;
      //}

      //teleport from right to left
      if (xPos > width) {
        xPos = 800;
      }
      //teleport from bottom to top
      if (yPos > height) {
        xPos = random(1000, 1400);
        yPos = random(0, 0);
      }

      //Evil Man
      push();
      translate(xPos, yPos);
      imageMode(CENTER);
      image(pRight, 0, 0);
      translate(-80, -20);
      scale(-1, 1);

      fill(#C1C1BF);
      rect( -50, -10, 80, 20);
      fill(#1A0D0B);
      rect( 0, 10, 5, 20);
      fill(#A79997);
      rect( -20, 10, 10, 10);
      fill(#1A0D0B);
      rect( -20, 25, 25, 5);
      fill(#1A0D0B);
      rect( -40, 10, 20, 40);
      fill(#D3CFC6);
      rect( 20, -10, 10, 20);
      pop();

      if (shootTime > 0) {
        shootTime--;
      } else {
        shootTime = round(random(20, 60));
        Bullets b = new Bullets(xPos, yPos);
        b.xVelo = -8;
        b.yVelo = 0;
        b.fired = true;
        b.enemy = true;
        theGame.firedBullets.add(b);
        shot.play();
      }
    }
  }
}
