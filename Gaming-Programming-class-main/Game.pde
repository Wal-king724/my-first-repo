import processing.sound.*;
class Game {
  //all variables go in here
  boolean gameOver;

  int score;
  int level;
  ScoreBoard theScoreBoard;
  Key tools[];

  Point Coins[];// added an array

  MainCharacter guy;

  EvilMan villians[];

  Gun weapons[];

  boolean opened = false;
  int openTime = 120;

  Bullets ammo1, ammo2, ammo3;

  ArrayList<Bullets> firedBullets = new ArrayList<>();

  ArrayList<Explosives> bomb = new ArrayList<>();
  ArrayList<Explosives> remove = new ArrayList<>();

  Stone barricade[];

  Exit door;

  Medkit heal[];

  int bulletsShot = 0;

  SoundFile gunshot, collect, shot;


  Game() {
    //all initializations go in here
    gameOver = false;

    theScoreBoard = new ScoreBoard();
    score = 5;
    level = 0;

    tools = new Key[1];
    for (int i = 0; i < 1; i++) {
      tools[i] = null;
    }

    barricade = new Stone[1];
    for (int i = 0; i < 1; i++) {
      barricade[i] = new Stone(1);
    }

    door = null;

    guy = new MainCharacter();

    Coins = new Point[10];
    for (int i = 0; i < 10; i++) {
      Coins[i] = new Point(random(00, 400), random(300, 600));
      //Coins.add(new Point());
      //added an array
    }


    //points = new Coin[2];
    //for (int i = 0; i < 1; i++) {
    //  points[i] = new Coin (2);
    //}



    villians = new EvilMan[1];
    for (int i = 0; i < 1; i++) {
      villians[i] = new EvilMan();
    }


    weapons = new Gun[1];
    for (int i = 0; i < 1; i++) {
      weapons[i] = new Gun(random(00, 400), random(300, 600));
    }

    ammo1 = new Bullets(40, 13);
    ammo2 = new Bullets(20, 13);
    ammo3 = new Bullets(0, 13);

    //bomb = new Explosives [3];
    for (int i = 0; i < 8; i++) {
      bomb.add(new Explosives());
    }

    heal = new Medkit[1];
    for (int i = 0; i < 1; i++) {
      heal[i] = new Medkit(random(0, 400), random(300, 600));
    }

    gunshot = new SoundFile(myarcadegame.this, "gunshot.wav");

    collect = new SoundFile(myarcadegame.this, "collect.mp3");
  }


  void display() {
    //everything from draw() goes in here
    push();
    fill(#210B0B);
    textSize(40);
    text("Point " + score, width - 450, height - 150);
    if (opened && openTime > 0) {
      openTime--;
    }
    if (openTime == 0) {
      state = 3;
    }
    if (guy.health > 0) {
      if (bulletsShot == 3) {
        bulletsShot = 0;
        ammo1 = new Bullets(40, 13);
        ammo2 = new Bullets(20, 13);
        ammo3 = new Bullets(0, 13);
      }
      if (guy.iFrames > 0) {
        guy.iFrames--;
      }
      if (villians[0].iFrames > 0) {
        villians[0].iFrames--;
      }
      background(#B49E9E);
      for (Key n : tools) {
        if (n != null) {
          n.display();
        }
      }


      if (door != null) {
        door.display();
      }
      for (Medkit thy : heal) {
        thy.display();
      }

      guy.display();

      for (EvilMan k : villians) {
        k.display();
      }

      for (Point o : Coins) {
        o.display();
        if (dist(guy.xPos, guy.yPos, o.xPos, o.yPos) < 40) {
          score += 1;
          o.xPos += random(2100, 2400);
        }
      }


      for (Gun w : weapons) {
        w.display();
      }

      for (Bullets b : firedBullets) {
        b.display();
      }

      for (Stone barricade : barricade) {
        if (barricade.used == false) {
          barricade.display();
        }
      }

      for (Explosives b : bomb) {
        if (dist(b.xPos, b.yPos, guy.xPos, guy.yPos) <= 60) {
          if (guy.health > 0) {
            guy.health -= 50;
          }
          //b.xPos = random(0, 500);
          //b.yPos = random(-400, 0);
          remove.add(b);
        }
      }
      for (Bullets b : firedBullets) {
        if (dist(b.xPos, b.yPos, villians[0].xPos, villians[0].yPos) <= 60) {
          if (villians[0].health > 0) {
            if (!b.enemy) {
              if (villians[0].iFrames == 0) {

                villians[0].iFrames = 1*60;
                villians[0].health -= 50;
              }
            }
          }
        }
        if (dist(b.xPos, b.yPos, guy.xPos, guy.yPos) <= 60) {
          if (b.enemy) {
            if (guy.health > 0) {
              if (guy.iFrames == 0) {
                guy.health -= 25;
                guy.iFrames = 1*60;
              }
            }
          }
        }
        for (EvilMan g : villians) {
          if (!g.dead) {
            if (dist(g.xPos, g.yPos, guy.xPos, guy.yPos) <= 60) {
              if (guy.health > 0) {
                if (guy.iFrames == 0) {
                  guy.health -= 25;
                  guy.iFrames = 1*60;
                }
              }
            }
          }
        }
      }

      if (ammo1 != null) {
        ammo1.display();
      }
      if (ammo2 != null) {
        ammo2.display();
      }
      if (ammo3 != null) {
        ammo3.display();
      }
      for (Explosives p : bomb) {
        p.display();
      }

 fill(#210B0B);
    textSize(40);
    text("Point " + score, width - 450, height - 150);
      push();
      float hBarWidth = 120;
      fill(#00ff00);
      rect(10, 100, 30, hBarWidth);
      fill(#ff0000);
      rect(10, 100, 30, hBarWidth - hBarWidth*(guy.health/100));
      pop();



      push();
      fill(#00ff00);
      rect(1500, 100, 30, hBarWidth);
      fill(#ff0000);
      rect(1500, 100, 30, hBarWidth - hBarWidth*(villians[0].health/300));
      pop();


      for (Stone bar : barricade) {
        for (Explosives b : bomb) {
          if (dist(bar.xPos, bar.yPos, b.xPos, b.yPos) <= 70) {
            if (bar.used == false) {
              remove.add(b);
              bar.used = true;
            }
          }
        }
      }
      bomb.removeAll(remove);
      remove.removeAll(remove);

      if (villians[0].health == 0 && door == null) {
        villians[0].dead = true;
        door = new Exit();
        tools[0] = new Key(1);
        tools[0].xPos = random(width);
        tools[0].yPos = random(height);
      }
    } else {
      gameOver = true;
      background(#000000);
      push();

      fill(#ff0000);

      textAlign(CENTER);
      textSize(40);
      scale(1);

      text("GAME OVER", width/2, height/2);



      pop();

      //state = 0;
    }
    pop();
  }



  void keyPressed() {
    score++;  //should be removed
    theScoreBoard.updateScore(score);
    if (key == 'w') {
      guy.yVelo = -3;
    }
    if (key == 's') {
      guy.yVelo = 3;
    }
    if (key == 'a') {
      guy.xVelo = -3;
    }
    if (key == 'd') {
      guy.xVelo = 3;
    }
    if (key == '6') {
      villians[0].health = 0;
    }
    if (key == '1' || key == '1') {
      if (guy.bullets > 0) {
        if (guy.weapon != null) {
          Bullets b = new Bullets(guy.weapon.xPos, guy.weapon.yPos);
          b.xVelo = 10;
          b.yVelo = 0;
          gunshot.play();
          b.fired = true;
          firedBullets.add(b);
          guy.bullets--;
        }
      }
    }

    if (key == '2') {
      boolean bulletPickup = false;
      boolean pickedUp = false;
      if (ammo1 != null) {
        if (dist(ammo1.xPos, ammo1.yPos, guy.xPos, guy.yPos) <= 60) {
          if (ammo1.displayed == false) {
            bulletPickup = true;
            Bullets[] b = {ammo1, ammo2, ammo3};
            for (Bullets bullet : b) {
              bullet.display = true;
              bullet.xVelo = 0;
              bullet.yVelo = 0;
              guy.bullets++;
              collect.play();
            }
            ammo1 = null;
            ammo2 = null;
            ammo3 = null;
          }
        }
      }
      for (Medkit m : heal) {
        if (dist(m.xPos, m.yPos, guy.xPos, guy.yPos) <= 80) {
          if (guy.m != null) {
            if (!bulletPickup) {
              guy.m = null;
            }
          } else {
            //if (guy.weapon == null) {
            guy.m = m;
            guy.weapon = null;
            guy.tools = null;
            guy.m.yPos+=10;
            guy.health =min(100, guy.health+50);
            if (m.used == false) {
              m.xPos = 10;
              m.used = true;
              collect.play();
              //}
            }
            pickedUp = true;
          }
        }
      }
      if (!pickedUp) {
        for (Gun w : weapons) {
          if (dist(w.xPos, w.yPos, guy.xPos, guy.yPos) <= 80) {
            if (guy.weapon == null) {
              guy.weapon = w;
              collect.play();
            }
          }
          if (guy.weapon == w) {
            w.yPos += 10;
            if (bulletPickup == false) {
              guy.weapon = null;
            }
          }
          if (dist(w.xPos, w.yPos, guy.xPos, guy.yPos) <= 80) {
            if (guy.weapon == null) {
              guy.weapon = w;
            }
          }
        }
      }
      for (Key w : tools) {
        if (w != null) {
          if (guy.tools == w) {
            w.yPos+=10;
            guy.tools = null;
            guy.m = null;
            collect.play();
          }
          if (dist(w.xPos, w.yPos, guy.xPos, guy.yPos) <= 80) {
            if (guy.weapon == null) {
              guy.tools = w;
            }
          }
        }
      }
      if (guy.tools != null) {
        if (dist(door.xPos, door.yPos, guy.xPos, guy.yPos) <= 150) {
          state = 3;
        }
      }
      //for (Point o : Coins) {
      //  if (o != null) {
      //    if (guy.Coins == o) {
      //      o.yPos+=10;
      //      guy.Coins = null;
      //      guy.m = null;
      //      collect.play();
      //    }
      //    if (dist(o.xPos, o.yPos, guy.xPos, guy.yPos) <= 80) {
      //      if (guy.Point == null) {
      //        guy.tools = o;
      //      }
      //    }

      //  }
      //}
    }
  }

  void keyReleased() {
    guy.yVelo = 0;
    guy.xVelo = 0;
  }
}
