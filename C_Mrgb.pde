class Mrgb {
  int x, y;     //Resize for Calculation
  PImage img;   //Image
  float imgr1, imgr2, disimgr, imgg1, imgg2, disimgg,  imgb21, imgb22, disimgb2; //FOR  IMAGE1 and IMAGE2:  Level of RGB,Total RGB and Average RGB  
  float diffmrgb; //Difference between 2 Average RGB

  //CONSTRUCTOR
  Mrgb (PImage tempimg, int tempx, int tempy) {
    img=tempimg;
    x=tempx;
    y=tempy;
  }

  //MANHATTAN VALUE RGB DIFFERENCE WITH MAIN IMAGE
  float imgvaluecom(PImage imgC) {
    colorMode(RGB, 100, 100, 100);
    img.resize(x, y);
    loadPixels();

    //FOR ALL PIXELS IN IMAGE; add RGB levels, average RGB per pixel
    img.loadPixels();
    disimgr=0;
    disimgg=0;
    disimgb2=0;
    for (int i=0; i<img.pixels.length; i++) {
      //RED INDIVIDUAL PIXEL TO PIXEL COMPARISSON
      imgr1=round(red(img.pixels[i]));
      imgr2=round(red(imgC.pixels[i]));
      disimgr+=abs(imgr1-imgr2);                //Added Red Differences per Pixel
      //GREEN INDIVIDUAL PIXEL TO PIXEL COMPARISSON
      imgg1=round(green(img.pixels[i]));
      imgg2=round(green(imgC.pixels[i]));
      disimgg+=abs(imgg1-imgg2);               //Added Green Differences per Pixel
      //BLUE INDIVIDUAL PIXEL TO PIXEL COMPARISSON
      imgb21=round(blue(img.pixels[i]));
      imgb22=round(blue(imgC.pixels[i]));    
      disimgb2+=abs(imgb21-imgb22);              //Added Blue Differences per Pixel
    }
    
    diffmrgb=(disimgr+disimgg+disimgb2)/img.pixels.length;        //Sum of Red Green and Blue Differences per Pixel

    updatePixels();   
    return diffmrgb;
  }
}