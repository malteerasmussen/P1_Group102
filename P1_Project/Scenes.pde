class Scenes {

  Images SceneImage = new Images();
  Text liftText = new Text();

  void display() {
    // displaying background image on all subclasses / scenes.

    PImage bgImage;
    imageMode(CENTER);
    bgImage = loadImage(SceneImage.background);
    bgImage.resize(0, height);
    image(bgImage, width/2, height/2);

    backButton();
  }
  // Displaying visuals for the back Button on certain scenes
  void backButton() {
    int backSize = height/10;
    int backX = backSize/2;
    int backY = (height-(backSize/2));

    if (currentSceneIndex != 0 && currentSceneIndex != 5 && currentSceneIndex != 3) {
      PImage back;
      imageMode(CENTER);
      back = loadImage("back.png");
      back.resize(backSize, backSize);
      image(back, backX, backY);
    }
  }

  // declaring variables for slider
  PImage imgLift;
  PImage arrow;
  float sliderX = width/9*7;
  float sliderY = height/10;
  float sliderWidth = width/10;
  float sliderHeight = height/10*5;
  float boxX = width/6;
  float boxY = height/9;
  float boxWidth = width/6*3;
  float boxHeight = height/9*2;

  boolean liftStart= false;

  boolean completed = false;

  //Slider visuals and behaviour
  void slider() {
    imageMode(CENTER);

    // variable liftStart sets to true if bottom of slider is touched
    if (touchIsStarted && mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) && mouseY > (sliderY+sliderHeight) - (sliderHeight/SceneImage.liftArray.length)) {
      liftStart = true;
      if (completed) {
        currentSceneIndex=5;
      }
      // reset slider if touched above or below slider. Or if not touched.
    } else if (mouseY < sliderY || mouseY > sliderY + sliderHeight || !touchIsStarted) {
      liftStart = false;
      completed = false;
    }
    // display text and image if not started
    if (!liftStart) {
      imgLift = loadImage(SceneImage.liftReady);
      imgLift.resize(0, height);
      image(imgLift, width/2, height/2);
      noStroke();
      fill(255, 200);
      rect(boxX, boxY, boxWidth, boxHeight, 20);
      textSize(height/40);
      fill(0);
      textAlign(CORNER);
      text(liftText.SliderText, boxX+20, boxY+20, boxWidth-20, boxHeight-20);
      mistake = false;
      noTint();
    }

    // if slided to the top - variable 'completed' is set to true
    if (liftStart && mouseY < (sliderY+sliderHeight) - (SceneImage.liftArray.length-1)*(sliderHeight/SceneImage.liftArray.length) && mouseY > (sliderY)) {
      completed = true;
    }

    // mapping y-coordinate of touch from bottom of slider to touch onto variable 'sy' from 0 to length of array.
    float sy = map(mouseY, sliderY+sliderHeight, sliderY, 0, SceneImage.liftArray.length-0.1);

    // If liftStart is true display images from string arrays in Images class.
    // Position in the arrays depend on y-coordinate of slider using variable 'sy'
    if (liftStart) {
      if (mouseX > sliderX && mouseX < (sliderX + sliderWidth)) {
        imgLift = loadImage(SceneImage.liftArray[int(sy)]);
        noTint();
      } else if (mouseX < sliderX) {
        imgLift = loadImage(SceneImage.liftLeftArray[int(sy)]);
        //setting global boolean mistake to true
        mistake = true;
        tint(#FFE2DB);
      } else if (mouseX > sliderX+sliderWidth) {
        imgLift = loadImage(SceneImage.liftRightArray[int(sy)]);
        mistake = true;
        tint(#FFE2DB);
      }
      imgLift.resize(0, height);
      image(imgLift, width/2, height/2);
    }

    //Slider rectangle
    rectMode(CORNER);
    strokeWeight(10);
    stroke(200, 0, 0);
    fill(255, 200);
    rect(sliderX, sliderY, sliderWidth, sliderHeight, 20);

    // displaying arrow on slider pointing in direction to slide.
    if (liftStart && mouseY < (sliderY+sliderHeight-(sliderHeight/SceneImage.liftArray.length)/3*2)) {
      imageMode(CORNER);
      image(arrow, sliderX, mouseY);
      if (mouseY < (sliderY+sliderHeight) - (SceneImage.liftArray.length-1)*(sliderHeight/SceneImage.liftArray.length)) {
        arrow = loadImage("downArrow.png");
        arrow.resize(int(sliderWidth), int((sliderHeight/SceneImage.liftArray.length)/2));
      }
    }
    if (!liftStart) {
      imageMode(CORNER);
      arrow = loadImage("upArrow.png");
      arrow.resize(int(sliderWidth), int((sliderHeight/SceneImage.liftArray.length)/2));
      image(arrow, sliderX, sliderY+sliderHeight-(sliderHeight/SceneImage.liftArray.length)/3*2);
    }
  }
  // review visuals and behaviour
  void Review() {

    Text reviewText = new Text();

    float boxX = width/2;
    float boxY = height/2;
    float boxWidth = width-100;
    float boxHeight = height/2;
    int boxOpacity = 200;
    PImage retry;
    int retrySize = height/10;
    float retryX = boxX-boxWidth/5;
    float retryY = boxY+boxHeight/2-retrySize;
    PImage quit;
    int quitSize = height/10;
    float quitX = boxX+boxWidth/5;
    float quitY = boxY+boxHeight/2-quitSize;
    float border = 100;


    textAlign(CENTER);
    textSize(height/20);

    // Show different text depending on global boolean mistake
    if (!mistake) {
      fill(0, 200, 0);
      text("GOOD JOB!", width/2, height/7);
    }
    if (mistake) {
      fill(200, 0, 0);
      text("Room for improvement", width/2, height/7);
    }

    rectMode(CENTER);
    fill(255, boxOpacity);
    noStroke();
    textSize(height/32);
    rect(boxX, boxY, boxWidth, boxHeight, 20);
    fill(0);

    // Show different text depending on global boolean mistake
    if (!mistake) {
      text(reviewText.goodReview, boxX, boxY+border, boxWidth-border*2, boxHeight-border);
    }
    if (mistake) {
      text(reviewText.badReview, boxX, boxY+border, boxWidth-border*2, boxHeight-border);
    }

    // Retry Button
    retry = loadImage("retry.png");
    imageMode(CENTER);
    retry.resize(retrySize, retrySize);
    image(retry, retryX, retryY);

    if (touchIsStarted && dist(mouseX, mouseY, retryX, retryY) < retrySize/2) {
      --currentSceneIndex;
    }

    // Quit button
    quit = loadImage("quit.png");
    imageMode(CENTER);
    quit.resize(quitSize, quitSize);
    image(quit, quitX, quitY);

    if (touchIsStarted && dist(mouseX, mouseY, quitX, quitY) < quitSize/2) {
      currentSceneIndex = 0 ;
    }
  }

  // Choice scenes visuals and behaviour
  void Choice() {
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

    int diff = 5; //Determent how many boxes are on each side
    // PImage imgchoice = loadImage("image.jpg");
    color colorchoice = #D9FFD8;
    color transcolor = 255;
    int txtc = 0;

    float boxX = width/4;
    float boxY = height/5;
    float boxS = width/10;
    float txtS = 50;



    //  background(imgchoice);
    // image(imgchoice,0,0,400,600);
    float X;
    float Y;
    int c = 7;
    int transn = 200;
    int trans3 = 50;
    for ( int i = 1; i < 8; i ++) { //loop creating rectangles and text
      if (i < diff) { 
        X = 0;
        Y = 0;
      } else { //moving the rest of the rectangles to the other side of the screen
        X = width - boxX*2;
        Y = boxY*4;
      }
      if (currentSceneIndex == 1 && i == 1 || currentSceneIndex == 2 && i == 2) {
        fill(colorchoice, transn);
      } else {
        fill(transcolor, transn);
      }
      noStroke();
      //stroke(colorchoice, transn);
      rectMode(CENTER);
      rect(boxX+X, boxY*i-Y, boxS*2, boxS, c);

      if (currentSceneIndex == 3) { //Makes the rectancles transparent in scene 4
        fill(txtc, trans3);
      } else {
        fill(txtc);
      }
      textSize(txtS);
      textAlign(CENTER);
      if (currentSceneIndex == 1) { //if-statements, which determant which array to use
        text(choicearray1[i], boxX+X, boxY*i-Y);
      }
      if (currentSceneIndex == 2 || currentSceneIndex == 3) {
        text(choicearray2[i], boxX+X, boxY*i-Y-c/2);
      }
    }

    float lowx = boxX-boxS;
    float highx = boxX+boxS;
    float lowy = boxY-boxS/2;
    float highy = boxY+boxS/2;

    float newlowy = (boxY-boxS/2)*2;
    float newhighy = (boxY+boxS/2)*2;



    //Scene 2 button
    if (currentSceneIndex == 1 && touchIsStarted && mouseX > lowx && mouseX < highx && mouseY > lowy && mouseY < highy) {
      currentSceneIndex ++;
      println(1);
    }
    //scene 3 button
    if (currentSceneIndex == 2 && touchIsStarted && mouseX > lowx && mouseX < highx && mouseY > newlowy && mouseY < newhighy) {
      currentSceneIndex ++;
      println(2);
    }
  }
}
