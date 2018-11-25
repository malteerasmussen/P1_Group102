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

color rc = #3DF25C;
color tc = 0;
color lc = #3DC9F2;
int trans = 225;

float header = height/2-boxrx+l;
float aware = boxry+l;
float info = boxly+l;

int txtsh = 14;
int txtst = 12;
String awareheader = "You should be aware of following:";
String awaretext = "1. Remember to lift with the legs\n    instead of the back\n2. If you are not experienced\n    minimize the weight on the bar";

String infoheader = "You do the exercise correctly by:";
String infotext = "1. Stand with a mid-foot stance \n    under the barbell\n2. Bend over and grab the bar with a \n    shoulder-width grip\n3. Bendthe knees until the shins \n    touch the bar\n4. Lift the chest up and straighten \n    the lower back\n5. Take a big breath, hold it, and stand \n    up with the weight";

PImage img = loadImage("image-placeholder-title.jpg");
float imgx = boxrx+dist;
float imgy = boxly+boxs;
float imgs = boxs+dist;

  void display() {
    background(255);
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
    text(infoheader,boxlx+dist,info);
    textSize(txtst);
    text(infotext,boxlx+dist,info+l/2);
    
    imageMode(CORNER);
    image(img,imgx,imgy,imgs,boxs);
  }
}
