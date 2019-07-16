void mainbutton() {
  if (methodused==0) {
    ao= new Alphao(im, iC, imageXsize, imageYsize);
    println("ALPHABETICAL ORDER");
    ao.sorted();
    ao.displayed();
    text("Test Image", 300, 470);
  }

  if (methodused==1) {
    //INSTANCIATION
    iC = loadImage(mainfile);
    for (int i=0; i<im.length; i++) im[i] = loadImage(filename+i+filetype);
    for (int i=0; i<im.length; i++) br[i] = new Avbrig(im[i], imageXsize, imageYsize);

    //CALCULATION
    briglist.clear();
    for (int i=0; i<im.length; i++) briglist.set(filename+i+filetype, br[i].imgvaluecom(iC) );

    //SORTING
    briglist.sortValues();
    println("Overall Brightness");
    println(briglist);
    values = briglist.valueArray();
    stringimage = briglist.keyArray();

    //DISPLAY IMAGE
    for (int i=0; i<im.length; i++) imsorted[i] = loadImage(stringimage[i]);
    for (int i=0; i<im.length; i++) imsortedch[i] = loadImage(stringimage[i]);
    for (int i=0; i<im.length; i++) image(imsorted[i], i*23.50, 600, 23.50, 23.50);
    for (int i=0; i<3; i++) {
      fill(0);
      rect(300*i+300, 475, 300, 24);
      imsorted[i].resize(imageXsize, imageYsize);
      image(imsorted[i], 300+(i*300), 250, 300, 225); 
      fill(100);
      textAlign(LEFT);
      textSize(15);
      text("#"+(i+1)+" most similar : "+ stringimage[i], 300+i*300, 490);
      stroke(100);
      noFill();  
      rect(300+(300*i), 249, 300, 226);
    }
    for (int i=3; i<19; i++) {
      fill(0);
      rect((i-3)*80, 560, 80, 24);
      imsorted[i].resize(imageXsize/2, imageYsize/2);
      image(imsorted[i], (i-3)*80, 500, 80, 60);
      fill(100);
      textSize(9);
      text(" "+(i+1)+":"+ stringimage[i], (i-3)*80, 575);
      textSize(15);
      stroke(100);
      noFill(); 
      rect((i-3)*80, 500, 80, 60);
    }
    text("Test Image", 300, 470);
  }

  if (methodused==10) {
    //INSTANCIATION
    for (int i=0; i<im.length; i++) im[i] = loadImage(filename+i+filetype);
    for (int i=0; i<im.length; i++) mrgb[i] = new Mrgb(im[i], imageXsize, imageYsize);

    //CALCULATE
    mrgblist.clear();
    for (int i=0; i<im.length; i++) mrgblist.set(filename+i+filetype, mrgb[i].imgvaluecom(iC) );

    //SORTING
    mrgblist.sortValues();
    println("Manhattan RGB");
    println(mrgblist);
    mrgbvalues = mrgblist.valueArray();
    mrgbstringimage = mrgblist.keyArray();

    //DISPLAY
    for (int i=0; i<im.length; i++) mrgbimsorted[i] = loadImage(mrgbstringimage[i]);
    for (int i=0; i<im.length; i++) image(mrgbimsorted[i], i*23.50, 600, 23.50, 23.50);
    for (int i=0; i<3; i++) {
      fill(0);
      rect(300*i+300, 475, 300, 24);
      mrgbimsorted[i].resize(imageXsize, imageYsize);
      image(mrgbimsorted[i], 300+(i*300), 250, 300, 225); 
      fill(100);
      textAlign(LEFT);
      textSize(15);
      text("#"+(i+1)+" most similar : "+ mrgbstringimage[i], 300+i*300, 490);
      stroke(100);
      noFill();  
      rect(300+(300*i), 249, 300, 226);
    }
    for (int i=3; i<19; i++) {
      fill(0);
      rect((i-3)*80, 560, 80, 24);
      mrgbimsorted[i].resize(imageXsize, imageYsize);
      image(mrgbimsorted[i], (i-3)*80, 500, 80, 60);
      fill(100);
      textSize(9);
      text(" "+(i+1)+":"+ mrgbstringimage[i], (i-3)*80, 575);
      textSize(15);
      stroke(100);
      noFill();  
      rect(300+(300*i), 249, 300, 226);
    }
    text("Test Image", 300, 470);
  }

  if (methodused==11) {
    //INSTANCIATION
    iC = loadImage(mainfile);
    for (int i=0; i<im.length; i++) im[i] = loadImage(filename+i+filetype);
    for (int i=0; i<im.length; i++) ehsb[i] = new Ehsb(im[i], imageXsize, imageYsize);

    //CALCULATION
    ehsblist.clear();
    for (int i=0; i<im.length; i++) ehsblist.set(filename+i+filetype, ehsb[i].imgvaluecom(iC) );

    //SORTING
    ehsblist.sortValues();
    println("Euclidean HSB");
    println(ehsblist);
    ehsbvalues = ehsblist.valueArray();
    ehsbstringimage = ehsblist.keyArray();

    //DISPLAY
    for (int i=0; i<im.length; i++) ehsbimsorted[i] = loadImage(ehsbstringimage[i]);
    for (int i=0; i<im.length; i++) image(ehsbimsorted[i], i*23.50, 600, 23.50, 23.50);
    for (int i=0; i<3; i++) {
      fill(0);
      rect(300*i+300, 475, 300, 24);
      ehsbimsorted[i].resize(imageXsize, imageYsize);
      image(ehsbimsorted[i], 300+(i*300), 250, 300, 225); 
      fill(100);
      textAlign(LEFT);
      textSize(15);
      text("#"+(i+1)+" most similar : "+ ehsbstringimage[i], 300+i*300, 490);
      stroke(100);
      noFill();  
      rect(300+(300*i), 249, 300, 226);
    }
    for (int i=3; i<19; i++) {
      fill(0);
      rect((i-3)*80, 560, 80, 24);
      ehsbimsorted[i].resize(imageXsize, imageYsize);
      image(ehsbimsorted[i], (i-3)*80, 500, 80, 60);
      fill(100);
      textSize(9);
      text(" "+(i+1)+":"+ ehsbstringimage[i], (i-3)*80, 575);
      textSize(15);
      stroke(100);
      noFill(); 
      rect((i-3)*80, 500, 80, 60);
    }
    text("Test Image", 300, 470);
  }

//OVERALL GREEN
  if (methodused==20) { 
    //INSTANCIATION
    iC = loadImage(mainfile);
    for (int i=0; i<im.length; i++) im[i] = loadImage(filename+i+filetype);
    for (int i=0; i<im.length; i++) gr[i] = new Avgreen(im[i], imageXsize, imageYsize);

    //CALCULATION
    grlist.clear();
    for (int i=0; i<im.length; i++) grlist.set(filename+i+filetype, gr[i].imgvaluecom(iC) );

    //SORTING
    grlist.sortValues();
    println("Overall Green");
    println(grlist);
    grvalues = grlist.valueArray();
    grstringimage = grlist.keyArray();

    //DISPLAY
    for (int i=0; i<im.length; i++) grimsorted[i] = loadImage(grstringimage[i]);   
    for (int i=0; i<im.length; i++){
      grimsorted[i].loadPixels();
      grimsortedch[i] = createImage(grimsorted[i].width, grimsorted[i].height, RGB);
      grimsortedch[i].loadPixels();
    for (int j = 0; j<grimsortedch[i].pixels.length; j++) grimsortedch[i].pixels[j] = color(0,green(grimsorted[i].pixels[j]),0);
    grimsortedch[i].updatePixels();
    }
   
    for (int i=0; i<im.length; i++) image(grimsortedch[i], i*23.50, 600, 23.50, 23.50);
    for (int i=0; i<3; i++) {
      fill(0);
      rect(300*i+300, 475, 300, 24);
      grimsortedch[i].resize(imageXsize, imageYsize);
      image(grimsortedch[i], 300+(i*300), 250, 300, 225);
      fill(100);
      textAlign(LEFT);
      textSize(15);
      text("#"+(i+1)+" most similar : "+ grstringimage[i], 300+i*300, 490);
      stroke(100);
      noFill(); 
      rect((i-3)*80, 500, 80, 60);
    }
    for (int i=3; i<19; i++) {
      fill(0);
      rect((i-3)*80, 560, 80, 24);
      grimsortedch[i].resize(imageXsize, imageYsize);
      image(grimsortedch[i], (i-3)*80, 500, 80, 60);
      fill(100);
      textSize(9);
      text(" "+(i+1)+":"+ grstringimage[i], (i-3)*80, 575);
      textSize(15);
      stroke(100);
      noFill(); 
      rect((i-3)*80, 500, 80, 60);
    }
    text("Test Image", 300, 470);
  }
  if (methodused==21) {
    //INSTANCIATION
    iC = loadImage(mainfile);
    for (int i=0; i<im.length; i++) im[i] = loadImage(filename+i+filetype);
    for (int i=0; i<im.length; i++) full[i] = new Fullcomp(im[i], imageXsize, imageYsize);

    //CALCULATION
    fulist.clear();
    for (int i=0; i<im.length; i++) fulist.set(filename+i+filetype,       (full[i].bimgvaluecom(iC)*0.10)+(full[i].gimgvaluecom(iC)*0.10)+(full[i].mimgvaluecom(iC)*0.10)+(full[i].eimgvaluecom(iC)*0.70))        ;

    //SORTING
    fulist.sortValues();
    println("Full Comparisson");
    println(fulist);
    fuvalues = fulist.valueArray();
    fustringimage = fulist.keyArray();

    //DISPLAY
    for (int i=0; i<im.length; i++) fuimsorted[i] = loadImage(fustringimage[i]);
    for (int i=0; i<im.length; i++) image(fuimsorted[i], i*23.50, 600, 23.50, 23.50);
    for (int i=0; i<3; i++) {
      fill(0);
      rect(300*i+300, 475, 300, 24);
      fuimsorted[i].resize(imageXsize, imageYsize);
      image(fuimsorted[i], 300+(i*300), 250, 300, 225);
      fill(100);
      textAlign(LEFT);
      textSize(15);
      text("#"+(i+1)+" most similar : "+ fustringimage[i], 300+i*300, 490);
      stroke(100);
      noFill(); 
      rect((i-3)*80, 500, 80, 60);
    }
    for (int i=3; i<19; i++) {
      fill(0);
      rect((i-3)*80, 560, 80, 24);
      fuimsorted[i].resize(imageXsize, imageYsize);
      image(fuimsorted[i], (i-3)*80, 500, 80, 60);
      fill(100);
      textSize(9);
      text(" "+(i+1)+":"+ fustringimage[i], (i-3)*80, 575);
      textSize(15);
      stroke(100);
      noFill(); 
      rect((i-3)*80, 500, 80, 60);
    }
    text("Test Image", 300, 470);
  }
}