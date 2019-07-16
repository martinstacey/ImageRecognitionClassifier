class Avbrig {
  int x, y;     //Resize for Calculation
  PImage img;   //Image
  float imgbrig, totbrig, avbrig;  //FOR 1 IMAGE:  Level of Brightness,
  float imgbrig1, totbrig1, avbrig1, imgbrig2, totbrig2, avbrig2;  //FOR  IMAGE1 and IMAGE2:  Level of Brightness,Total Brightness and Average Brightness 
  float diff; //Difference between 2 Average Brightness


  //CONSTRUCTOR
  Avbrig (PImage tempimg, int tempx, int tempy) {
    img=tempimg;
    x=tempx;
    y=tempy;
  }

  float imgvalue() {
    colorMode(HSB, 100, 100, 100);
    img.resize(x, y);
    loadPixels();

    //FOR ALL PIXELS IN IMAGE; add brightness levels, average brightness per pixel
    img.loadPixels();
    totbrig=0;
    for (int i=0; i<img.pixels.length; i++) {
      imgbrig=round(brightness(img.pixels[i]));
      totbrig+=imgbrig;
    }
    avbrig=totbrig/img.pixels.length;
    updatePixels();
    return avbrig;
  }

  float imgvaluecom(PImage imgC) {
    colorMode(HSB, 100, 100, 100);
    img.resize(x, y);
    loadPixels();

    //FOR ALL PIXELS IN IMAGE; add brightness levels, average brightness per pixel
    img.loadPixels();
    totbrig1=0;
    for (int i=0; i<img.pixels.length; i++) {
      imgbrig1=round(brightness(img.pixels[i]));
      totbrig1+=imgbrig1;
    }
    avbrig1=totbrig1/img.pixels.length;
    
    totbrig2=0;
    for (int i=0; i<imgC.pixels.length; i++) {
      imgbrig2=round(brightness(imgC.pixels[i]));
      totbrig2+=imgbrig2;
    }
    avbrig2=totbrig2/imgC.pixels.length;

    diff=abs(avbrig1-avbrig2);

    updatePixels();   
    return diff;
  }
}