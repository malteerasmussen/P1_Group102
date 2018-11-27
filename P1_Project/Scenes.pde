class Scenes {



  void display() {
    PImage bgImage;
    imageMode(CENTER);
    bgImage = loadImage("Images/gym.jpg");
    bgImage.resize(0, height);
    image(bgImage, width/2, height/2);


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
}
