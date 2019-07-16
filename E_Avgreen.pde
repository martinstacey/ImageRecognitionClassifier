class Avgreen {
  int x, y;     //Resize for Calculation
  PImage img;   //Image
  PImage imgGr;
  PImage imgCGr;
  
  float imggreen1, totgreen1, avgreen1, imggreen2, totgreen2, avgreen2;  //FOR  IMAGE1 and IMAGE2:  Level of Green,Total Green and Average Green 
  float diffgreen; //Difference between 2 Average Green

  //CONSTRUCTOR
  Avgreen (PImage tempimg, int tempx, int tempy) {
    img=tempimg;
    x=tempx;
    y=tempy;
  }
//CALCULATE DIFFERENCE 
  float imgvaluecom(PImage imgC) {
    colorMode(RGB, 100, 100, 100);
    img.loadPixels();
    imgGr = createImage(img.width, img.height, RGB);
    imgGr.loadPixels();
    for(int i = 0; i<imgGr.pixels.length; i++) imgGr.pixels[i] = color(0, green(img.pixels[i]),0);
    imgGr.updatePixels();    
    
    imgC.loadPixels();
    imgCGr = createImage(imgC.width,imgC.height, RGB);
    imgCGr.loadPixels();
    for(int i = 0; i<imgCGr.pixels.length; i++) imgCGr.pixels[i] = color(0, green(imgC.pixels[i]),0);
    imgCGr.updatePixels();
    
    imgGr.resize(x, y);
    loadPixels();
    //FOR ALL PIXELS IN IMAGE; add brightness levels, average brightness per pixel
    imgGr.loadPixels();
    totgreen1=0;
    for (int i=0; i<imgGr.pixels.length; i++) {
      imggreen1=round(green(imgGr.pixels[i]));
      totgreen1+=imggreen1;
    }
    avgreen1=totgreen1/imgGr.pixels.length;
    totgreen2=0;
    for (int i=0; i<imgCGr.pixels.length; i++) {
      imggreen2=round(green(imgCGr.pixels[i]));
      totgreen2+=imggreen2;
    }
    avgreen2=totgreen2/imgCGr.pixels.length;
    diffgreen=abs(avgreen1-avgreen2);

    updatePixels();   
    return diffgreen;
  }
}