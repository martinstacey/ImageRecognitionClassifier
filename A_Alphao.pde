class Alphao {
  int x, y;     //Resize for Calculation
  PImage imgP;   //Main Image
  PImage img[]=new PImage [51];   //Image Array

  FloatDict aolist = new FloatDict(); // List of Image Name and Difference of Average Brightness to Master Image (stored as FloatDict)
  String [] aostringimage = new String [51]; //List of Image Name         (Sorted by Alphabetical Order)      (stored as Strings)
  PImage [] aoimsorted = new PImage [51];    //List of Image Name         (Sorted by Alphabetical Order)      (stored as Images)

  //CONSTRUCTOR
  Alphao (PImage [] tempimg, PImage tempimgP, int tempx, int tempy) {
    img=tempimg;
    imgP=tempimgP;
    x=tempx;
    y=tempy;
  }

  void sorted() {
    aolist.clear();
    for (int i=0; i<img.length; i++) aolist.set(filename+i+filetype, i ); //List Name and Number
    aolist.sortValues(); 
    println(aolist); 
    aostringimage = aolist.keyArray();
    for (int i=0; i<img.length; i++) aoimsorted[i] = loadImage(aostringimage[i]);
  }

  void displayed() {
    for (int i=0; i<im.length; i++) image(aoimsorted[i], i*23.50, 600, 23.50, 23.50);
    for (int i=0; i<3; i++) {
      fill(0);
      rect(300*i+300, 475, 300, 24);
      aoimsorted[i].resize(imageXsize, imageYsize);
      image(aoimsorted[i], 300+(i*300), 250, 300, 225); 
      fill(100);
      textAlign(LEFT);
      textSize(15);
      text("#"+(i+1)+" most similar : "+ aostringimage[i], 300+i*300, 490);
      stroke(100);
      noFill();  
      rect(300+(300*i), 249, 300, 226);
    }
    for (int i=3; i<19; i++) {
      fill(0);
      rect((i-3)*80, 560, 80, 24);
      aoimsorted[i].resize(imageXsize/2, imageYsize/2);
      image(aoimsorted[i], (i-3)*80, 500, 80, 60);
      fill(100);
      textSize(9);
      text(" "+(i+1)+":"+ aostringimage[i], (i-3)*80, 575);
      textSize(15);
      stroke(100);
      noFill(); 
      rect((i-3)*80, 500, 80, 60);
    }
  }
}