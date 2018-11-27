class Scene6 extends Scenes {

  Text reviewText = new Text();
  Slider mySlider = new Slider();
  float boxX = width/2;
  float boxY = height/2;
  float boxWidth = width-100;
  float boxHeight = height/2;
  int boxOpacity = 150;
  PImage retry;
  int retrySize = 70;
  float retryX = boxX-boxWidth/5;
  float retryY = boxY+boxHeight/2-retrySize;
  PImage quit;
  int quitSize = 70;
  float quitX = boxX+boxWidth/5;
  float quitY = boxY+boxHeight/2-quitSize;


  void display() {

    textAlign(CENTER);
    textSize(40);


    if (!mistake) {
      fill(0, 230, 0);
      text("GOOD JOB!", width/2, height/8);
    }
    if (mistake) {
      fill(230, 0, 0);
      text("Room for improvement", width/2, height/8);
    }

    rectMode(CENTER);
    fill(255, boxOpacity);
    noStroke();
    textSize(25);
    rect(boxX, boxY, boxWidth, boxHeight);
    fill(0);

    if (!mistake) {
      text(reviewText.goodReview, boxX, boxY, boxWidth, boxHeight-50);
    }
    if (mistake) {
      text(reviewText.badReview, boxX, boxY, boxWidth, boxHeight-50);
    }

    // Retry Button
    retry = loadImage("Images/retry.png");
    imageMode(CENTER);
    retry.resize(retrySize, retrySize);
    image(retry, retryX, retryY);

    if (mousePressed && dist(mouseX, mouseY, retryX, retryY) < retrySize/2) {
      currentSceneIndex = 4;
    }

    // Quit button
    quit = loadImage("Images/quit.png");
    imageMode(CENTER);
    quit.resize(quitSize, quitSize);
    image(quit, quitX, quitY);

    if (mousePressed && dist(mouseX, mouseY, quitX, quitY) < quitSize/2) {
      currentSceneIndex = 0;
    }
  }
}
