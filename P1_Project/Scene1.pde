class Scene1 extends Scenes {

  // The layout of scene 1

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

    // Next scene when screen is touched. Time buffer to keep the scene from reacting to back and quit buttons on other scenes.
    if (touchIsStarted && (timer-timerReset)>=1) {
      ++currentSceneIndex;
    }
  }
}
