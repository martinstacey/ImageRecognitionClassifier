class Fullcomp {
  int x, y;     //Resize for Calculation
  PImage img;   //Image
  //Brightness
  float imgbrig1, totbrig1, avbrig1, imgbrig2, totbrig2, avbrig2;  //FOR  IMAGE1 and IMAGE2:  Level of Brightness,Total Brightness and Average Brightness 
  float diff; //Difference between 2 Average Brightness
  //Overall Green
  float imggreen1, totgreen1, avgreen1, imggreen2, totgreen2, avgreen2;  //FOR  IMAGE1 and IMAGE2:  Level of Green,Total Green and Average Green 
  float diffgreen; //Difference between 2 Average Green
  //Mrgb
  float imgr1, imgr2, disimgr, imgg1, imgg2, disimgg, imgb21, imgb22, disimgb2; //FOR  IMAGE1 and IMAGE2:  Level of RGB,Total RGB and Average RGB  
  float diffmrgb; //Difference between 2 Average RGB
  //Ehsb
  float imgh1, imgh2, disimgh, imgs1, imgs2, disimgs, imgb1, imgb2, disimgb; //FOR  IMAGE1 and IMAGE2:  Level of HSB,Total HSB and Average HSB  
  float diffehsb; //Difference between 2 Average HSB

  //CONSTRUCTOR
  Fullcomp (PImage tempimg, int tempx, int tempy) {
    img=tempimg;
    x=tempx;
    y=tempy;
  }

  float bimgvaluecom(PImage imgC) {
    colorMode(HSB, 100, 100, 100);
    img.resize(x, y);
    loadPixels();
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

  float gimgvaluecom(PImage imgC) {
    colorMode(RGB, 100, 100, 100);
    img.resize(x, y);
    loadPixels();
    img.loadPixels();
    totgreen1=0;
    for (int i=0; i<img.pixels.length; i++) {
      imggreen1=round(green(img.pixels[i]));
      totgreen1+=imggreen1;
    }
    avgreen1=totgreen1/img.pixels.length;
    totgreen2=0;
    for (int i=0; i<imgC.pixels.length; i++) {
      imggreen2=round(green(imgC.pixels[i]));
      totgreen2+=imggreen2;
    }
    avgreen2=totgreen2/imgC.pixels.length;
    diffgreen=abs(avgreen1-avgreen2);
    updatePixels();   
    return diffgreen;
  }

  float mimgvaluecom(PImage imgC) {
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
  float eimgvaluecom(PImage imgC) {
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