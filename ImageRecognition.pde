//VARIABLES
int nimgs = 51; //number of images used in arrays

//Initial Conditions
int imgres=3; //Initial Resolution: 1=100x75 2=400x300 3=800x600
int imgused=1; //Initial Images Used: 1=Project Images 2=TestHSB 3=Test RGB
int methodused=0;

//Image file 
String mainfile;  //main file name
String filename;  //filename (excluding number [i])
String filetype;    //filextension (from [i])

//Image Resolution
int imageXsize;
int imageYsize;

//IMAGES
PImage iC; //Master Image
PImage [] im = new PImage [nimgs]; //Loaded Images

//FUNCTION CONSTRUCTIONS
Alphao ao; //Alphabetic Order

//AVERAGE BRIGHTNESS
Avbrig [] br = new Avbrig [nimgs];
float [] arrimgvalue = new float [nimgs];
float [] arrvaluecom = new float [nimgs];
float [] arrvaluecomsort = new float [nimgs];
FloatDict briglist = new FloatDict();
String [] stringimage = new String [nimgs];
float [] values = new float [nimgs];
PImage [] imsorted = new PImage [nimgs];
PImage [] imsortedch = new PImage [nimgs];

//OVERALL GREEN
Avgreen [] gr = new Avgreen [nimgs]; //Construct Average Green Function per Image
FloatDict grlist = new FloatDict(); // List of Image Name and Difference of Average Green to Master Image                               (stored as FloatDict)
String [] grstringimage = new String [nimgs]; //List of Image Name         (Sorted by Difference of Average Green to Master Image)      (stored as Strings)
PImage [] grimsorted = new PImage [nimgs];    //List of Image Name         (Sorted by Difference of Average Green to Master Image)      (stored as Images)
PImage [] grimsortedch = new PImage [nimgs];    //List of Image Name         (Sorted by Difference of Average Green to Master Image)      (stored as Images)
float [] grvalues = new float [nimgs]; //List of Image Average Green  (Sorted by Difference of Average Green to Master Image)      (stored as Float) 
PImage griC;  

//MANHATTAN RGB
Mrgb [] mrgb = new Mrgb [nimgs]; //Construct Manhattan RGB Function per Image
FloatDict mrgblist = new FloatDict(); // List of Image Name and Difference of Average Brightness to Master Image                               (stored as FloatDict)
String [] mrgbstringimage = new String [nimgs]; //List of Image Name         (Sorted by Difference of Average Brightness to Master Image)      (stored as Strings)
PImage [] mrgbimsorted = new PImage [nimgs];    //List of Image Name         (Sorted by Difference of Average Brightness to Master Image)      (stored as Images)
float [] mrgbvalues = new float [nimgs]; //List of Image Average Brightness  (Sorted by Difference of Average Brightness to Master Image)      (stored as Float) 

//EUCLIDEAN HSB
Ehsb [] ehsb = new Ehsb [nimgs]; //Construct Manhattan RGB Function per Image
FloatDict ehsblist = new FloatDict(); // List of Image Name and Difference of Average Brightness to Master Image                               (stored as FloatDict)
String [] ehsbstringimage = new String [nimgs]; //List of Image Name         (Sorted by Difference of Average Brightness to Master Image)      (stored as Strings)
PImage [] ehsbimsorted = new PImage [nimgs];    //List of Image Name         (Sorted by Difference of Average Brightness to Master Image)      (stored as Images)
float [] ehsbvalues = new float [nimgs]; //List of Image Average Brightness  (Sorted by Difference of Average Brightness to Master Image)      (stored as Float) 

//FULL COMPARISON
Fullcomp [] full = new Fullcomp [nimgs]; //Construct Manhattan RGB Function per Image
FloatDict fulist = new FloatDict(); // List of Image Name and Difference of Average Brightness to Master Image                               (stored as FloatDict)
String [] fustringimage = new String [nimgs]; //List of Image Name         (Sorted by Difference of Average Brightness to Master Image)      (stored as Strings)
PImage [] fuimsorted = new PImage [nimgs];    //List of Image Name         (Sorted by Difference of Average Brightness to Master Image)      (stored as Images)
float [] fuvalues = new float [nimgs]; //List of Image Average Brightness  (Sorted by Difference of Average Brightness to Master Image)      (stored as Float) 

void setup() {
  //SETUP CONFIGURATION
  size(1200, 900);
  background(0);
  textSize(15);
  colorMode(RGB, 100, 100, 100);

  //INITIAL CONDITIONS FOR CALCULATION
  imgch();
  imgsiz();
  for (int i=0; i<im.length; i++) im[i] = loadImage(filename+i+filetype);
  displrect ();

  //INITIAL IMAGES ALPHABETICAL ORDER
  ao= new Alphao(im, iC, imageXsize, imageYsize);
  ao.sorted();
  ao.displayed();
  text("Test Image", 300, 470);
}
void draw() {
  //CONDITIONS FOR CALCULATION
  
  //ellipse(mouseX,mouseY,5,5);
  imgch(); //Image Used 
  imgsiz(); //Image Size

  //DISPLAY
  displmainimage ();
  displaybuttons ();

  saveFrame("movie/####.png");
}

void mousePressed() {
  //CONDITIONS
  if ((mouseX>300)&&(mouseX<600)&&(mouseY>650)&&(mouseY<700)) imgres = 1; //low resolution 
  if ((mouseX>600)&&(mouseX<900)&&(mouseY>650)&&(mouseY<700)) imgres = 2; //medium resolution 
  if ((mouseX>900)&&(mouseX<1200)&&(mouseY>650)&&(mouseY<700)) imgres = 3; //high resolution 
  if ((mouseX>300)&&(mouseX<600)&&(mouseY>700)&&(mouseY<750)) imgused = 1; //project images  
  if ((mouseX>600)&&(mouseX<900)&&(mouseY>700)&&(mouseY<750)) imgused = 2; //hsb test images   
  if ((mouseX>900)&&(mouseX<1200)&&(mouseY>700)&&(mouseY<750)) imgused = 3; //rgb test images  

  //METHOD EXECUTION
  if ((mouseX>0)&&(mouseX<400)&&(mouseY>150)&&(mouseY<200))  methodused=0;  //METHOD 1 AlPHABETICAL ORDER
  if ((mouseX>0)&&(mouseX<400)&&(mouseY>200)&&(mouseY<250)) methodused=1; //METHOD 2 Average Brightness
  if ((mouseX>400)&&(mouseX<800)&&(mouseY>150)&&(mouseY<200)) methodused=10;  //METHOD 3 Manhattan RGB 
  if ((mouseX>400)&&(mouseX<800)&&(mouseY>200)&&(mouseY<250)) methodused=11; //METHOD 4 Eucledean HSB 
  if ((mouseX>800)&&(mouseX<1200)&&(mouseY>150)&&(mouseY<200)) methodused=20;  //METHOD 5 Overall Green
  if ((mouseX>800)&&(mouseX<1200)&&(mouseY>200)&&(mouseY<250)) methodused = 21;//METHOD 6 Full Comparison 

  //EXECUTE BUTTON
  if ((mouseX>940)&&(mouseX<1060)&&(mouseY>70)&&(mouseY<100))  mainbutton();  //EXECUTE COMPARISSON
}