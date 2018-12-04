

Scenes myScenes = new Scenes();
Scenes[] chooseScenes;
int currentSceneIndex =0;
String sceneName = "Scene";
boolean mistake = false;
float timerReset=0;
float timer;

void setup() {
 // size(600, 800);
 fullScreen();
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
  myScenes.display();
  chooseScenes[currentSceneIndex].display();

  timer=millis()/1000;
  timer();
  println(timer-timerReset);
}


void keyPressed() {
  currentSceneIndex++;
  if (currentSceneIndex == chooseScenes.length) {
    currentSceneIndex = 0;
  }
}

void timer() {
  if ((timer-timerReset)%60 == 0) {
    currentSceneIndex = 0;
  }
}

void touchEnded() {
  timerReset = timer - 1;

  if (currentSceneIndex == 4 && dist(mouseX, mouseY, 35, height-35) < 35) {
    currentSceneIndex=2;
  }
  if (currentSceneIndex != 0 && currentSceneIndex != 3 && currentSceneIndex != 5 && dist(mouseX, mouseY, 35, height-35) < 35) {
    --currentSceneIndex;
    timerReset = timer -0.5;
  }
}
