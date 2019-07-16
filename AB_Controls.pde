void imgch() {
  //IMAGES CHOSSEN
  if (imgused==1) {
    mainfile= "LDN.jpg";  //main file name
    filename= "Image_";  //filename (excluding number [i])
    filetype= ".jpg";    //filextension (from [i])
  }
  if (imgused==2) {
    mainfile= "a_Maestro.jpg";  //main file name
    filename= "a";  //filename (excluding number [i])
    filetype= ".jpg";    //filextension (from [i])
  }
  if (imgused==3) {
    mainfile= "b25.jpg";  //main file name
    filename= "b";  //filename (excluding number [i])
    filetype= ".jpg";    //filextension (from [i])
  }
}

void imgsiz() {
  if (imgres==1) {
    imageXsize=100;
    imageYsize=75;
  }

  if (imgres==2) {
    imageXsize=400; 
    imageYsize=300;
  }

  if (imgres==3) {
    imageXsize=800;
    imageYsize=600;
  }
}