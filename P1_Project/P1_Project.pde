Scenes myScenes = new Scenes();
Scenes[] chooseScenes;
int currentSceneIndex =0;
String sceneName = "Scene";

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
  chooseScenes[currentSceneIndex].display();

  //mySlider.display();
}


void keyPressed() {
  currentSceneIndex++;
  if (currentSceneIndex == chooseScenes.length) {
    currentSceneIndex = 0;
  }
}
