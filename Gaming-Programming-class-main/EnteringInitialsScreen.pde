class EnteringInitialsScreen {
  char selection = 65;
  int[] result = {65, 65, 65};
  String initials = "";
  boolean wait = false;
  int time = 0;
  int index = 0;
  int x, y;
  PFont font;
  int size;

  EnteringInitialsScreen() {
    this.x = width/2;
    this.y = 100;
    font = createFont("zig.ttf", 133); // Monospaced font to make my life easier with the cursor
    this.size = 200;
  }

  void display() {
    background(#220022);
    selecting(); // Basically my own keyPressed
    setSelection(); // Sets the index to the selection
    waiting(); // To stop the program from cycling all the way down to z or up to a when pressing button once
    setInitials(); // Sets the initials string to the result array
    push();
    drawText(); // Draws the text
    drawCursor(); // Draws the cursor
    pop();
    //println(result[0], result[1], result[2]); // Debug code
  }
  
  void keyPressed() {
    if (key == 'z') {
      saveNewScore(initials, theGame.score, "scoreBoard.json"); 
    }
  }

  void setSelection() {
    result[index] = selection; // Sets the character at the index
  }

  void setInitials() {
    initials = "" + char(result[0])+char(result[1])+char(result[2]); // Final String
  }

  void drawText() {
    textAlign(CORNER);
    fill(255);
    textFont(font);
    textSize(size);
    text(initials, x - (textWidth(initials)/2), y); // Draws the text
  }

  void drawCursor() {
    noStroke();
    rect((x-textWidth(initials)/2) + (textWidth(char(result[index]))*index), y + 10, textWidth(char(result[index])), 10); // Draws a cursor
    //Sets cursor to start of text, then this moves cursor based on index, basic spacing, sets width of cursor to width of char at index, basic height
  }

  void waiting() {
    if (wait) {
      time++;
    }
    if (time == 10) {
      wait = false;
      time = 0;
    }
  }

  void selecting() {
    if (keyPressed) {
      switch(key) {
      case 'w':
        if (selection == 'A' && !wait) {
          selection = 'Z';
          wait = true;
        } else if (selection > 'A' && !wait) {
          selection--;
          wait = true;
        }
        break;
      case 's':
        if (selection == 'Z' && !wait) {
          selection = 'A';
          wait = true;
        } else if (selection < 'Z' && !wait) {
          selection++;
          wait = true;
          println(selection);
        }
        break;
      case 'd':
        if (index < 2 && !wait) {
          index++;
          selection = char(result[index]);
          wait = true;
        }
        break;
      case 'a':
        if (index > 0 && !wait) {
          index--;
          selection = char(result[index]);
          wait = true;
        }
        break;
      }
    }
  }

  void saveNewScore(String initials, int score, String fileName)
  {
    JSONObject json = loadJSONObject(fileName);
    JSONArray scores = json.getJSONArray("scores");
    JSONObject finalEntry = new JSONObject();
    JSONArray finalArray = scores;
    finalEntry.setString("name", initials);
    finalEntry.setInt("value", score);
    for (int i = 0; i < finalArray.size(); i++) // Goes through each item in the array
    {
      JSONObject tValue = finalArray.getJSONObject(i);
      if (tValue.getInt("value") < finalEntry.getInt("value")) // Checking if current score is greater than score at index
      {
        for (int j = finalArray.size()-1; j >= i; j--) // If it is then it shifts all the scores from the current index to the size of the array down by one
        {
          JSONObject store = finalArray.getJSONObject(j);
          finalArray.setJSONObject(j+1, store);
          println(j);
        }
        finalArray.setJSONObject(i, finalEntry);  // Sets the current score to the index
        break;                                    // Breaks because already found score lower than current score, no need to search further
      }
    }

    json.setJSONArray("scores", finalArray);
    saveJSONObject(json, fileName);
  }

  void displayScores(String fileName, float x, float y)
  {
    JSONObject json = loadJSONObject(fileName);
    JSONArray scores = json.getJSONArray("scores");
    push();
    noStroke();
    textSize(35);
    textAlign(CORNER);
    fill(0);
    rect(x-324, y, 620, height * .6);
    fill(255);
    for (int i = 0; i < 6 && i < scores.size(); i++)
    {
      JSONObject entry = scores.getJSONObject(i);
      text(entry.getString("name") + " " + entry.getInt("value"), x - (textWidth(entry.getString("name") + " " + entry.getInt("value"))/2), y + 35 + 40*i);
    }
    pop();
  }
}
