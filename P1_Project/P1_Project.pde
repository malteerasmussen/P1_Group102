// this program only runs in Android mode.

// Creating an object for the super class Scenes.
Scenes myScenes = new Scenes();
// Creating an array of scenes and declaring global variables
Scenes[] chooseScenes;
int currentSceneIndex = 0;

boolean mistake = false;
float timerReset=0;
float timer;

void setup() {
  fullScreen();
  // Putting the different scenes into the chooseScenes array.
  chooseScenes = new Scenes [] {
    new Scene1(), 
    new Scene2(), 
    new Scene3(), 
    new Scene4(), 
    new Scene5(), 
    new Scene6(), 
  };
}

void draw() {
  background(255);
  // displaying display methods of superclass and subclasses.
  myScenes.display();
  chooseScenes[currentSceneIndex].display();

  // setting variable timer to count every second. 
  timer=millis()/1000;
  timer();
}

// the timer function. Resets 60 seconds since screen is touched.
void timer() {
  if ((timer-timerReset)%60 == 0) {
    currentSceneIndex = 0;
  }
}

void touchStarted() {
  //timer resets when screen is touched
  timerReset = timer - 1;

  // functionality for the back button
  if (currentSceneIndex == 4 && dist(mouseX, mouseY, height/10, height-height/20) < height/20) {
    currentSceneIndex=2;
  }
  if (currentSceneIndex != 0 && currentSceneIndex != 3 && currentSceneIndex != 5 && dist(mouseX, mouseY, height/10, height-height/20) < height/20) {
    --currentSceneIndex;
    timerReset = timer -0.5;
  }
}
