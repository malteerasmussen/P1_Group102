class Scene1 extends Scenes {



  void display() {
    PImage img;
    imageMode(CENTER);
    img = loadImage("Hand.png");
    img.resize(0, height/2);
    image(img, width/2, height/5*3);
    textSize(height/16);
    textAlign(CENTER);
    fill(0);
    text("Touch to start", width/2, height/5);

    if (touchIsStarted && (timer-timerReset)>=1) {
      ++currentSceneIndex;
    }
  }
}
