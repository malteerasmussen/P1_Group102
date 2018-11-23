class Slider {

  Images liftImages = new Images();

  PImage img;
  float sliderX = width/8;
  float sliderY = height/8;
  float sliderWidth = width/8;
  float sliderHeight = height/8*6;

  boolean liftStart= false;
  boolean mistake = false;
  boolean completed = false;

  void displaySlider() {
    rectMode(CORNER);
    strokeWeight(10);
    stroke(255, 0, 0);
    fill(0, 255, 0);
    rect(sliderX, sliderY, sliderWidth, sliderHeight);

    imageMode(CENTER);

    // Nedenstående kode med de 7 forskellige if-statements afgører hvornår hvert billede vises.
    // Det er det samme for-loopet nedenunder gør - det fylder bare lidt mindre.

    /*
     if (mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) && mouseY > (sliderY+sliderHeight) - (sliderHeight/7)) {
     img = loadImage(liftImages.liftArray[0]);
     image(img, width/2, width/2);
     }
     if (mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) - (sliderHeight/7) && mouseY > (sliderY+sliderHeight) - 2*(sliderHeight/7)) {
     img = loadImage(liftImages.liftArray[1]);
     image(img, width/2, width/2);
     }
     if (mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) - 2*(sliderHeight/7) && mouseY > (sliderY+sliderHeight) - 3*(sliderHeight/7)) {
     img = loadImage(liftImages.liftArray[2]);
     image(img, width/2, width/2);
     }
     if (mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) - 3*(sliderHeight/7) && mouseY > (sliderY+sliderHeight) - 4*(sliderHeight/7)) {
     img = loadImage(liftImages.liftArray[3]);
     image(img, width/2, width/2);
     }
     if (mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) - 4*(sliderHeight/7) && mouseY > (sliderY+sliderHeight) - 5*(sliderHeight/7)) {
     img = loadImage(liftImages.liftArray[4]);
     image(img, width/2, width/2);
     }
     if (mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) - 5*(sliderHeight/7) && mouseY > (sliderY+sliderHeight) - 6*(sliderHeight/7)) {
     img = loadImage(liftImages.liftArray[5]);
     image(img, width/2, width/2);
     }
     if (mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) - 6*(sliderHeight/7) && mouseY > (sliderY+sliderHeight) - 7*(sliderHeight/7)) {
     img = loadImage(liftImages.liftArray[6]);
     image(img, width/2, width/2);
     }
     
     } */

    /*
        for (int i=0; i<liftImages.liftArray.length; i++) {
     if (liftStart && mouseX > sliderX && mouseX < (sliderX + sliderWidth) && mouseY < (sliderY+sliderHeight) - i*(sliderHeight/7) && mouseY > (sliderY+sliderHeight) - (i+1)*(sliderHeight/7)) {
     img = loadImage(liftImages.liftArray[i]);
     img.resize(width/4, 0);
     image(img, width/2, height/2);
     
     }
     }
     */

    if (mousePressed && mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) && mouseY > (sliderY+sliderHeight) - (sliderHeight/liftImages.liftArray.length)) {
      liftStart = true;
      if(completed && mistake){
        currentSceneIndex=6;
      }
      if(completed && !mistake){
        currentSceneIndex=5;
      }
    } else if (mouseY < sliderY || mouseY > sliderY + sliderHeight) {
      liftStart = false;
      completed = false;
    } else if (!mousePressed){
      liftStart = false;
      completed = false;
      mistake = false;
    }
    
println(mistake);


    if (!liftStart) {
      textSize(20);
      fill(0);
      textAlign(CORNER);
      text("Slide fra bunden for at starte", 200, 200);
      img = loadImage("Images/man1.png");
      img.resize(width/4, 0);
      image(img, width/2, height/2);
    }

    if (liftStart && mouseX > sliderX && mouseX < (sliderX+sliderWidth) && mouseY < (sliderY+sliderHeight) - (liftImages.liftArray.length-1)*(sliderHeight/liftImages.liftArray.length) && mouseY > (sliderY)) {
      completed = true;
    }

    float sy = map(mouseY, sliderY+sliderHeight, sliderY, 0, liftImages.liftArray.length-0.1);

    if (liftStart && mousePressed) {
      if (mouseX > sliderX && mouseX < (sliderX + sliderWidth)) {
        img = loadImage(liftImages.liftArray[int(sy)]);
        img.resize(width/4, 0);
        image(img, width/2, height/2);
      } else if (mouseX < sliderX) {
        img = loadImage(liftImages.liftLeftArray[int(sy)]);
        img.resize(width/4, 0);
        image(img, width/2, height/2);
        mistake = true;
      } else if (mouseX > sliderX+sliderWidth) {
        img = loadImage(liftImages.liftRightArray[int(sy)]);
        img.resize(width/4, 0);
        image(img, width/2, height/2);
        mistake = true;
      }
    }
  }
}
