class Slider {

  Images liftImages = new Images();
  Text liftText = new Text();

  PImage img;
  PImage arrow;
  float sliderX = width/9*7;
  float sliderY = height/10;
  float sliderWidth = width/8;
  float sliderHeight = height/8*5;

  boolean liftStart= false;

  boolean completed = false;

  void displaySlider() {
    imageMode(CENTER);

    if (mousePressed && mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) && mouseY > (sliderY+sliderHeight) - (sliderHeight/liftImages.liftArray.length)) {
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
      textSize(20);
      fill(0);
      textAlign(CORNER);
      text(liftText.SliderText, width/6, height/8);
      img = loadImage(liftImages.liftReady);
      img.resize(width, 0);
      image(img, width/2, height/2);
      mistake = false;
    }

    if (liftStart && mouseY < (sliderY+sliderHeight) - (liftImages.liftArray.length-1)*(sliderHeight/liftImages.liftArray.length) && mouseY > (sliderY)) {
      completed = true;
    }

    float sy = map(mouseY, sliderY+sliderHeight, sliderY, 0, liftImages.liftArray.length-0.1);

    if (liftStart) {
      if (mouseX > sliderX && mouseX < (sliderX + sliderWidth)) {
        img = loadImage(liftImages.liftArray[int(sy)]);
      } else if (mouseX < sliderX) {
        img = loadImage(liftImages.liftLeftArray[int(sy)]);
        mistake = true;
      } else if (mouseX > sliderX+sliderWidth) {
        img = loadImage(liftImages.liftRightArray[int(sy)]);
        mistake = true;
      }
      img.resize(width, 0);
      image(img, width/2, height/2);
    }

    rectMode(CORNER);
    strokeWeight(10);
    stroke(230, 0, 0);
    fill(0, 230, 0);
    rect(sliderX, sliderY, sliderWidth, sliderHeight, 20);

    imageMode(CORNER);
    arrow = loadImage("Images/upArrow.png");
    arrow.resize(int(sliderWidth), int((sliderHeight/liftImages.liftArray.length)/2));
    image(arrow, sliderX, sliderY+sliderHeight-(sliderHeight/liftImages.liftArray.length)/3*2);
  }
}
