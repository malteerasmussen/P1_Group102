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
      back = loadImage("Images/back.png");
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

  void slider() {
    imageMode(CENTER);

    if (mousePressed && mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) && mouseY > (sliderY+sliderHeight) - (sliderHeight/SceneImage.liftArray.length)) {
      liftStart = true;
      if (completed) {
        currentSceneIndex=5;
      }
    } else if (mouseY < sliderY || mouseY > sliderY + sliderHeight) {
      liftStart = false;
      completed = false;
    } else if (!mousePressed) {
      liftStart = false;
      completed = false;
    }




    if (!liftStart) {
      imgLift = loadImage(SceneImage.liftReady);
      imgLift.resize(width, 0);
      image(imgLift, width/2, height/2);
      textSize(20);
      fill(0);
      textAlign(CORNER);
      text(liftText.SliderText, width/6, height/8);
      mistake = false;
    }

    if (liftStart && mouseY < (sliderY+sliderHeight) - (SceneImage.liftArray.length-1)*(sliderHeight/SceneImage.liftArray.length) && mouseY > (sliderY)) {
      completed = true;
    }

    float sy = map(mouseY, sliderY+sliderHeight, sliderY, 0, SceneImage.liftArray.length-0.1);

    if (liftStart) {
      if (mouseX > sliderX && mouseX < (sliderX + sliderWidth)) {
        imgLift = loadImage(SceneImage.liftArray[int(sy)]);
      } else if (mouseX < sliderX) {
        imgLift = loadImage(SceneImage.liftLeftArray[int(sy)]);
        mistake = true;
      } else if (mouseX > sliderX+sliderWidth) {
        imgLift = loadImage(SceneImage.liftRightArray[int(sy)]);
        mistake = true;
      }
      imgLift.resize(width, 0);
      image(imgLift, width/2, height/2);
    }

    rectMode(CORNER);
    strokeWeight(10);
    stroke(230, 0, 0);
    fill(0, 230, 0);
    rect(sliderX, sliderY, sliderWidth, sliderHeight, 20);

    imageMode(CORNER);
    arrow = loadImage("Images/upArrow.png");
    arrow.resize(int(sliderWidth), int((sliderHeight/SceneImage.liftArray.length)/2));
    image(arrow, sliderX, sliderY+sliderHeight-(sliderHeight/SceneImage.liftArray.length)/3*2);
  }
}
