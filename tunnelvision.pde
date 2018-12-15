PGraphics myGraphics;
float fullRot = random(0.2, 0.6);
PShape figure, figure2, figure3;
void setup() {
  //size(800, 800);
  fullScreen(P2D);
  background(0, 0, 0, 0);
  myGraphics = createGraphics(width, height);

  figure = loadShape("Element 7.svg");
  figure2 =loadShape("Element 7.svg");
  figure3 = loadShape("Element 9.svg");
  //figure.setFill(color(random(125, 255), 0, random(125, 255)));
}

void draw() {
//  background(0, 0, 0, 0);

  myGraphics.beginDraw();
  myGraphics.background(0, 0, 0, 99);
  myGraphics.endDraw();
  image(myGraphics, 0, 0);

  fill(255);
  //stroke(0);
  //strokeWeight(45);


  // SHAPE 1
  pushMatrix();
  translate(width/2, height/2);
  rotate(noise(frameCount*0.01));
  for (float i = 0; i < fullRot*1200; i++) {
    if (i<350 && i % 2 ==0) {
      //fill(lerpColor(255, 0, noise(frameCount*0.01)));
      translate(445, 0);
      rotate(1/fullRot * TWO_PI);
      scale(0.95);
      shapeMode(CENTER);
      pushMatrix();
      rotate(i/fullRot/1200 * TWO_PI /5);

      translate( sin((frameCount + i)/15)*350 + width, 100);
      shape(figure, 0, 0, 700, 700);
      popMatrix();

      figure.setFill(color(lerpColor(255, 25, noise(frameCount*0.04, i)), 0, lerpColor(255, 25, noise(frameCount*0.03, i))));
    }
  }
  popMatrix();

  // SHAPE 2
  pushMatrix();
  translate(width/2, height/2);
  //rotate(noise(frameCount*4 + 50));
  for (int i = 0; i < fullRot*1005; i++) {
    if (i<350 && i % 1 ==0 ) {
      //fill(lerpColor(255, 0, noise(frameCount*0.01)));
      rotate(1.01/fullRot * TWO_PI);
      scale(0.95);
      shapeMode(CENTER);
      //shape(figure2, - sin((frameCount + i)/30)*350 - width, -100, 1000, 600);
      //shape(figure2, sin((frameCount + i)/30)*350 + width, -100, 1000, 600);
      //figure2.setStrokeWeight(20);
      //figure2.setStroke(color(255));
      figure2.setFill(color(lerpColor(175, 75, noise(frameCount*0.035, i)), lerpColor(255, 125, noise(frameCount*0.01, i)), 10));
      //figure2.setFill(color(255));
      //figure2.setVisible(isIt(i));
      //figure2.setFill(color(lerpColor(255 * isIt(), 0, noise(frameCount*0.035, i)), lerpColor(255, 125, noise(frameCount*0.01, i)), 0));
    }
  }
  popMatrix();





  /*// SHAPE 3
   pushMatrix();
   translate(width/2, height/2);
   rotate(noise(frameCount*0.01));
   for (float i = 0; i < fullRot*1200; i++) {
   if(i<350 && i % 2 ==0){
   //fill(lerpColor(255, 0, noise(frameCount*0.01)));
   rotate(1/fullRot * TWO_PI);
   scale(0.95);
   shapeMode(CENTER);
   pushMatrix();
   rotate(i/fullRot/1200 * TWO_PI /5);
   
   translate( sin((frameCount + i)/15)*350 + width,100);
   shape(figure, 0, 0, 1300, 1300);
   popMatrix();
   
   figure.setFill(color(lerpColor(255, 25, noise(frameCount*0.04, i)), 0, lerpColor(255, 25, noise(frameCount*0.03, i))));
   
   }
   }*/
  fullRot *= 0.9999;
  println(int(frameRate), fullRot);
}

boolean isIt(int i) {
  int strobe = 1000;
  int thrshHld = 1;
  float blkwhtbal = 0.73;
  float val = sin(millis()/strobe - i/thrshHld);
  if (val > blkwhtbal) {
    return true;
  } else { 
    return false;
  }
}
