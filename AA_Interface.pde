PFont bold,regular;

void setupfont(){
  
  
}

void displrect () {
  //COLOR CONFIGURATION
  colorMode(RGB, 100, 100, 100);

  //TITTLE
  fill(100);
  textSize(50);
  text("IMAGE CLASSIFIER", 50, 100);

  //RECTANGLES FOR IMAGES
  noFill();
  stroke(100);  
  for (int i=0; i<3; i++) rect(300+(300*i), 249, 300, 226); //first Images 
  for (int i=0; i<3; i++)  rect(300*i+300, 475, 300, 24); //first texts 
  for (int i=3; i<19; i++) rect((i-3)*80, 500, 80, 60);  //second Images
  for (int i=3; i<19; i++) rect((i-3)*80, 560, 80, 24); //second texts

  //Main Text Rectangle
  fill(0);
  rect(0, 475, 300, 24);
  fill(100);
  textAlign(LEFT);
  textSize(15);
  text("Target Image:"+mainfile, 0*300, 490);
}

void displaybuttons () {
  colorMode(RGB, 100, 100, 100);
  //BUTTON RECTANGLES
  for (int i=0; i<3; i++) {
    for (int j=0; j<2; j++) {
      if (methodused==((i*10)+j)) fill(25, 50, 0);
      else fill(0);
      stroke(100);
      rect(i*400, 150+(j*50), 400, 50);
    }
  }

  //MAIN BUTTON
  textAlign(CENTER);
  fill(10, 10, 10);
  rect(940, 70, 120, 30);
  fill(100);
  text("EXECUTE", 1000, 93);
  

  //BUTTON TEXTS  
  fill(100);
  textAlign(CENTER);
  textSize(20);
  text("ALPHABETIC ORDER", 200, 185);
  text("OVERALL BRIGHTNESS", 200, 235);
  text("MANHATTAN RGB", 600, 185);
  text("EUCLIDEAN HSB", 600, 235);
  text("OVERALL GREEN", 1000, 185);
  text("FULL COMPARISSON", 1000, 235);

  //BUTTONS OPTIONS 
  fill(0);
  rect(0, 650, 300, 50);
  rect(0, 700, 300, 50);
  fill(100);
  textAlign(CENTER);
  text("SIZE FOR CALCULATION:", 150, 680);
  text("IMAGES TO USE:", 150, 730);

  for (int i=1; i<4; i++) {
    if (imgres==i) fill(25, 50, 0);
    else fill(0);
    stroke(100);
    rect(i*300, 650, 300, 50);
  }

  for (int i=1; i<4; i++) {
    if (imgused==i) fill(25, 50, 0);
    else fill(0);
    stroke(100);
    rect(i*300, 700, 300, 50);
  }

  fill(100);
  text("Low Res 100 X 75", 450, 680);
  text("Medium Res 400 X 300", 750, 680);
  text("High Res 800 X 600", 1050, 680);
  text("Project Images", 450, 730);
  text("Test HSB", 750, 730);
  text("Test RGB", 1050, 730);
}

//MAIN IMAGE DISPLAY
void displmainimage () {
  noFill();
  stroke(100);
  rect(0, 249, 300, 226); 
  iC = loadImage(mainfile);
  iC.resize(imageXsize, imageYsize);



  if (methodused==20) {
    iC.loadPixels();
    griC = createImage(iC.width, iC.height, RGB);
    griC.loadPixels();
    for (int i = 0; i<griC.pixels.length; i++) griC.pixels[i] = color(0, green(iC.pixels[i]), 0);
    griC.updatePixels();
    image(griC, 0, 250, 300, 225);
  } else image(iC, 0, 250, 300, 225);
}