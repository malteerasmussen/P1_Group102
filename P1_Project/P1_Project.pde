Scenes[] chooseScenes;
int currentSceneIndex =0;

void setup() {
  size(600, 800);
    chooseScenes = new Scenes []{
      new firstScene(),
      new secondScene(),
      new thirdScene()
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
