class Scenes {

  Images SceneImage = new Images();
  Text liftText = new Text();

  void display() {
    PImage bgImage;
    imageMode(CENTER);
    bgImage = loadImage(SceneImage.background);
    bgImage.resize(0, height);
    image(bgImage, width/2, height/2);

    backButton();
  }

  void backButton() {
    int backSize = 70;
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

  PImage imgLift;
  PImage arrow;
  float sliderX = width/9*7;
  float sliderY = height/10;
  float sliderWidth = width/8;
  float sliderHeight = height/8*5;

  boolean liftStart= false;

  boolean completed = false;

  //Slider-Method
  void slider() {
    imageMode(CENTER);

    if (touchIsStarted && mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) && mouseY > (sliderY+sliderHeight) - (sliderHeight/SceneImage.liftArray.length)) {
      liftStart = true;
      if (completed) {
        currentSceneIndex=5;
      }
    } else if (mouseY < sliderY || mouseY > sliderY + sliderHeight) {
      liftStart = false;
      completed = false;
    } else if (!touchIsStarted) {
      liftStart = false;
      completed = false;
    }

    if (!liftStart) {
      imgLift = loadImage(SceneImage.liftReady);
      imgLift.resize(0, height);
      image(imgLift, width/2, height/2);
      textSize(height/40);
      fill(0);
      textAlign(CORNER);
      text(liftText.SliderText, width/6, height/8,width/6*3,height/8*5);
      mistake = false;
      noTint();
    }

    if (liftStart && mouseY < (sliderY+sliderHeight) - (SceneImage.liftArray.length-1)*(sliderHeight/SceneImage.liftArray.length) && mouseY > (sliderY)) {
      completed = true;
    }

    float sy = map(mouseY, sliderY+sliderHeight, sliderY, 0, SceneImage.liftArray.length-0.1);

    if (liftStart) {
      if (mouseX > sliderX && mouseX < (sliderX + sliderWidth)) {
        imgLift = loadImage(SceneImage.liftArray[int(sy)]);
        noTint();
      } else if (mouseX < sliderX) {
        imgLift = loadImage(SceneImage.liftLeftArray[int(sy)]);
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

    rectMode(CORNER);
    strokeWeight(10);
    stroke(230, 0, 0);
    fill(0, 230, 0);
    rect(sliderX, sliderY, sliderWidth, sliderHeight, 20);

    imageMode(CORNER);
    arrow = loadImage("upArrow.png");
    arrow.resize(int(sliderWidth), int((sliderHeight/SceneImage.liftArray.length)/2));
    image(arrow, sliderX, sliderY+sliderHeight-(sliderHeight/SceneImage.liftArray.length)/3*2);
  }
  void Review() {

    Text reviewText = new Text();

    float boxX = width/2;
    float boxY = height/2;
    float boxWidth = width-100;
    float boxHeight = height/2;
    int boxOpacity = 150;
    PImage retry;
    int retrySize = height/10;
    float retryX = boxX-boxWidth/5;
    float retryY = boxY+boxHeight/2-retrySize;
    PImage quit;
    int quitSize = height/10;
    float quitX = boxX+boxWidth/5;
    float quitY = boxY+boxHeight/2-quitSize;


    textAlign(CENTER);
    textSize(height/20);


    if (!mistake) {
      fill(0, 230, 0);
      text("GOOD JOB!", width/2, height/7);
    }
    if (mistake) {
      fill(230, 0, 0);
      text("Room for improvement", width/2, height/7);
    }

    rectMode(CENTER);
    fill(255, boxOpacity);
    noStroke();
    textSize(height/32);
    rect(boxX, boxY, boxWidth, boxHeight);
    fill(0);

    if (!mistake) {
      text(reviewText.goodReview, boxX, boxY, boxWidth, boxHeight-50);
    }
    if (mistake) {
      text(reviewText.badReview, boxX, boxY, boxWidth, boxHeight-50);
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
    color colorchoice = #3DC9F2;
    color transcolor = 150;
    int txtc = 0;

    float boxX = width/4;
    float boxY = height/5;
    float boxS = width/10;
    float txtS = 12;



    //  background(imgchoice);
    // image(imgchoice,0,0,400,600);
    float X;
    float Y;
    int c = 7;
    int transn = 175;
    int trans3 = 50;
    for ( int i = 1; i < 8; i ++) { //loop creating rectangles and text
      if (i < diff) { 
        X = 0;
        Y = 0;
      } else { //moving the rest of the rectangles to the other side of the screen
        X = width - boxX*2;
        Y = boxY*4;
      }
      if(currentSceneIndex == 1 && i == 1 || currentSceneIndex == 2 && i == 2) {
      fill(colorchoice, transn);
      }
      else {
        fill(transcolor, transn);
      }
      stroke(colorchoice, transn);
      rectMode(CENTER);
      rect(boxX+X, boxY*i-Y, boxS*2, boxS, c);

      if (currentSceneIndex == 3) { //Makes the rectancles transparent in scene 4
        fill(txtc, trans3);
      } else {
        fill(txtc);
      }
      textSize(txtS);
      textAlign(CENTER);
      if (currentSceneIndex == 1) { //if statements, which determant which array to use
        text(choicearray1[i], boxX+X, boxY*i-Y);
      }
      if (currentSceneIndex == 2 || currentSceneIndex == 3) {
        text(choicearray2[i], boxX+X, boxY*i-Y-c/2);
      }
    }

    float lowx = boxX-boxS;
    float highx = boxX+boxS;
    //println(lowx,highx);
    float lowy = boxY-boxS/2;
    float highy = boxY+boxS/2;

    float newlowy = (boxY-boxS/2)*2;
    float newhighy = (boxY+boxS/2)*2;

    //println(lowy,highy);


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
