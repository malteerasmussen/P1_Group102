class Scene6 extends Scenes {

  Text reviewText = new Text();
  Slider mySlider = new Slider();
  float boxX = width/2;
  float boxY = height/2;
  float boxWidth = width-100;
  float boxHeight = height/2;
  int boxOpacity = 150;
  PImage img;
  int retrySize = 70;
  float retryX = boxX;
  float retryY = boxY+boxHeight/2-retrySize;


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
    
    if (!mistake){
    text(reviewText.goodReview, boxX, boxY, boxWidth, boxHeight-50);
    }
    if (mistake){
      text(reviewText.badReview, boxX, boxY, boxWidth, boxHeight-50);
    }
    
    img = loadImage("Images/retry.png");
    imageMode(CENTER);
    img.resize(retrySize,retrySize);
    image(img,retryX,retryY);
    
    if(mousePressed && dist(mouseX,mouseY,retryX,retryY) < retrySize/2){
      currentSceneIndex = 4;
      println("Clicked");
    }
  }
}
