class Choice {
  String[] choicearray1 = new String[8];
  { //Scene 2 text array
    choicearray1[1] = "BACK";
    choicearray1[2] = "CHEST";
    choicearray1[3] = "ABS";
    choicearray1[4] = "BICEPS";
    choicearray1[5] = "TRICEPS";
    choicearray1[6] = "SHOULDERS";
    choicearray1[7] = "LEGS";
  }
  String[] choicearray2 = new String[8];
  { //Scene 3 text array
    choicearray2[1] = "FRONT \nSQUADS";
    choicearray2[2] = "DEADLIFT";
    choicearray2[3] = "SINGLE \nARM ROW";
    choicearray2[4] = "KETTLEBELL \nSWINGS";
    choicearray2[5] = "PULLOVER";
    choicearray2[6] = "WIDE ROW";
    choicearray2[7] = "GOOD \nMORNINGS";
  }

  int diff = 5;
  // PImage imgchoice = loadImage("image.jpg");
  color colorchoice = #3DC9F2;
  int txtc = 0;

  float boxX = 100;
  float boxY = 100;
  float boxS = 45;
  float txtS = 12;

  void display() {

    //  background(imgchoice);
    // image(imgchoice,0,0,400,600);
    float X;
    float Y;
    int c = 7;
    int trans = 100;
    for ( int i = 1; i < 8; i ++) { //loop creating rectangles and text
      if (i < diff) { //diff states how many rectangles are on the left side and the rest on the right side
        X = 0;
        Y = 0;
      } else { //moving the rest of the rectangles to the other side of the screen
        X = width - boxX*2;
        Y = boxY*4;
      }
      fill(colorchoice, trans);
      stroke(colorchoice, trans);
      rectMode(CENTER);
      rect(boxX+X, boxY*i-Y, boxS*2, boxS, c);

      if (currentSceneIndex == 3){
        fill(txtc,trans);
      }
      else{
        fill(txtc);
      }
      textSize(txtS);
      textAlign(CENTER);
      if (currentSceneIndex == 1) { //if statement, which determant which array to use
        text(choicearray1[i], boxX+X, boxY*i-Y);
      }
      if (currentSceneIndex == 2 || currentSceneIndex == 3) {
        text(choicearray2[i], boxX+X, boxY*i-Y-c/2);
      }
    }
  }
  void button() { 
    float lowx = boxX-boxS;
    float highx = boxX+boxS;
    //println(lowx,highx);
    float lowy = boxY-boxS/2;
    float highy = boxY+boxS/2;

    float newlowy = (boxY-boxS/2)*2;
    float newhighy = (boxY+boxS/2)*2;

    //println(lowy,highy);
    println("scene "+currentSceneIndex);

    //Scene 2 button
    if (currentSceneIndex == 1 && mousePressed && mouseX > lowx && mouseX < highx && mouseY > lowy && mouseY < highy) {
      currentSceneIndex ++;
      println(1);
    }
    //scene 3 button
    if (currentSceneIndex == 2 && mousePressed && mouseX > lowx && mouseX < highx && mouseY > newlowy && mouseY < newhighy) {
      currentSceneIndex ++;
      println(2);
    }
  }
}
