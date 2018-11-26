Scenes myScenes = new Scenes();
Scenes[] chooseScenes;
int currentSceneIndex =0;
String sceneName = "Scene";
boolean mistake = false;
float timerReset=0;
float timer;

void setup() {
  size(600, 800);
  chooseScenes = new Scenes [] {
    new Scene1(), 
    new Scene2(), 
    new Scene3(), 
    new Scene4(), 
    new Scene5(), 
    new Scene6(), 
    new Scene7()
  };
}

void draw() {
  background(255);
  myScenes.display();
  chooseScenes[currentSceneIndex].display();

  if (millis()/100%300 == 0) {
    currentSceneIndex = 0;
  }
  println(millis()/100);
}


void keyPressed() {
  currentSceneIndex++;
  if (currentSceneIndex == chooseScenes.length) {
    currentSceneIndex = 0;
  }
}
