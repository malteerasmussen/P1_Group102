class Scene4 extends Scenes {

  Choice scene4Choice = new Choice();
  

int dist = 20;
int e = 50;
int l = 40;

float boxrx = width/2;
float boxry = height/4;
float boxlx = 0+dist;
float boxly = height/3;
float boxs = boxrx-dist*2;

float boxl2y = boxly+boxs+dist;

color rc = #FC1F1F;
color tc = 0;
color lc = #3DC9F2;
color l2c = #3DF25C;
int trans = 225;

float txtl = boxlx+dist;
float header = height/2-boxrx+l;
float aware = boxry+l;
float info = boxly+l;
float accept = boxl2y+l;


int txtsh = 14;
int txtst = 12;
String awareheader = "You should be aware of following:";
String awaretext = "1. Remember to lift with the legs\n    instead of the back\n2. If you are not experienced\n    minimize the weight on the bar";

String infoheader = "You do the exercise correctly by:";
String infotext = "1. Stand with a mid-foot stance \n    under the barbell\n2. Bend over and grab the bar with a \n    shoulder-width grip\n3. Bendthe knees until the shins \n    touch the bar\n4. Lift the chest up and straighten \n    the lower back\n5. Take a big breath, hold it, and stand \n    up with the weight";

String accepttext = "Do you accept your choice?";

PImage dl = loadImage("image-placeholder-title.jpg");
float dlx = boxrx+dist;
float dly = boxly+boxs;
float dls = boxs+dist;

int im = 50;
PImage yes = loadImage("yes.png");
float yesx = boxlx+im;
float imgy = boxl2y+l*1.5;
float imgs = 50;
PImage no = loadImage("no.png");
float nox = boxlx+im*3;


  void display() {

    scene4Choice.display();
    
    fill(tc);
    textAlign(CENTER);
    textSize(50);
    text("DEADLIFT", boxrx,header);
    
    fill(rc,trans);
    rectMode(CORNER);
    rect(boxrx+dist,boxry,boxs,boxs,e);
    fill(tc);
    textAlign(CORNER);
    textSize(txtsh);
    text(awareheader,boxrx+dist*2,aware);
    textSize(txtst);
    text(awaretext,boxrx+dist*2,aware+l/2);
    
    fill(lc,trans);
    rect(boxlx,boxly,boxs,boxs,e);
    fill(tc);
    textSize(txtsh);
    text(infoheader,txtl,info);
    textSize(txtst);
    text(infotext,txtl,info+l/2);
    
    fill(l2c,trans);
    rect(boxlx,boxl2y,boxs,boxs/2,e);
    fill(tc);
    textSize(txtsh);
    text(accepttext,txtl,accept);

    
    imageMode(CORNER);
    image(dl,dlx,dly,dls,boxs);
    
    image(yes,yesx,imgy,imgs,imgs);
    image(no,nox,imgy,imgs,imgs);
    
    button();
  }
  
  void button(){
    float lowyx = yesx;
    float highyx = yesx+imgs;
    float lownx = nox;
    float highnx = nox+imgs;
    float lowy = imgy;
    float highy = imgy+boxs;
    if ( mousePressed && mouseX > lowyx && mouseX < highyx && mouseY > lowy && mouseY < highy) {
      currentSceneIndex ++;
      println("+");
    }
    if ( mousePressed && mouseX > lownx && mouseX < highnx && mouseY > lowy && mouseY < highy) {
      currentSceneIndex --;
      println("-");
    }
  }
}
