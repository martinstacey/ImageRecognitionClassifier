class Ehsb {
  int x, y;     //Resize for Calculation
  PImage img;   //Image
  float imgh1, imgh2, disimgh, imgs1, imgs2, disimgs, imgb1, imgb2, disimgb; //FOR  IMAGE1 and IMAGE2:  Level of HSB,Total HSB and Average HSB  
  float diffehsb; //Difference between 2 Average HSB

  //CONSTRUCTOR
  Ehsb (PImage tempimg, int tempx, int tempy) {
    img=tempimg;
    x=tempx;
    y=tempy;
  }
  
  //COMPARISSON WITH MAIN IMAGE
  float imgvaluecom(PImage imgC) {
    colorMode(HSB, 100, 100, 100);
    img.resize(x, y);
    loadPixels();

    //FOR ALL PIXELS IN IMAGE; add HSB levels, average HSB per pixel
    img.loadPixels();
    disimgh=0;
    disimgs=0;
    disimgb=0;
    for (int i=0; i<img.pixels.length; i++) {
      //HUE INDIVIDUAL PIXEL TO PIXEL COMPARISSON
      imgh1=round(hue(img.pixels[i]));
      imgh2=round(hue(imgC.pixels[i]));
      disimgh+=sq(imgh1-imgh2);                //Added Hue Differences per Pixel
      //SATURATION INDIVIDUAL PIXEL TO PIXEL COMPARISSON
      imgs1=round(saturation(img.pixels[i]));
      imgs2=round(saturation(imgC.pixels[i]));
      disimgs+=sq(imgs1-imgs2);               //Added Saturation Differences per Pixel
      //BRIGHTNESS INDIVIDUAL PIXEL TO PIXEL COMPARISSON
      imgb1=round(brightness(img.pixels[i]));
      imgb2=round(brightness(imgC.pixels[i]));    
      disimgb+=sq(imgb1-imgb2);              //Added Brightness Differences per Pixel
    }
    diffehsb=(sqrt(disimgh+disimgs+disimgb))/img.pixels.length;        //Euclidean Sum of Hue Saturation and Brightness Differences per Pixel
    updatePixels();   
    return diffehsb;
  }
}