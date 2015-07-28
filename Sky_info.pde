// In this class we defined the behavior of the background, which we made the stars able to twinkle along each frame
// The pictures are saved in data/star+i.png
public class Sky
{
  PImage sprite[];// for loading the image.  
  int npartTotal = 150;
  int size_min = 15;
  int size_max = 20;
  float trans_min = 64;
  float trans_max = 160;
  //size and trans are designed for their limitation.
  PVector positions[];
  int kinds[];
  float sizes[];
  float opacitys[];
  PVector[] colors;
  int time[];
  
  Sky() {
    sprite = new PImage[3];
    for (int i = 0; i < sprite.length; i ++)
    {
      sprite[i] = loadImage("star"+i+".png");
    }
    
    initPositions(); 
    initKinds();
    initSizes();
    initOpacitys();
    initColors();
    //initial all the staffs, where positions, kinds, sizes, opacitys are all random, and colors are based on HSB from h =180-220, s = 30, 
    //h was arranged among their distance between the center point and their location
    hint(DISABLE_DEPTH_MASK);// I don't know what's that mean.
    time = new int[npartTotal];
    for (int i = 0; i < npartTotal ; i++){
    time[i] = 1;
    }
    
  } 
  
  void update() {
    change_opacity();// re-caculate the opacity
    for (int n = 0; n < npartTotal; n++) {    
      drawParticle(opacitys[n],sizes[n]+map(opacitys[n],trans_min,trans_max,-size_min,size_min),kinds[n],positions[n]);// here we make map(opa) in order to make the particle can be resized with their light.
    }      
  }
  
  
  void change_opacity(){
   for (int i = 0; i <npartTotal; i++){
    if (opacitys[i] >= trans_max)
      {
        time[i] = -1;
      }
    if (opacitys[i] <= trans_min)
      {
        time[i] = 1;
      }
    opacitys[i]=opacitys[i]+time[i];
   }
  }  
  
  void drawParticle(float j, float f, int i, PVector center) {
    beginShape(QUAD);
    colorMode(HSB,360,100,100);
    tint(colors[i].x,colors[i].y,100,j);
    imageMode(CENTER);
    image(sprite[i], center.x, center.y,f,f);
    colorMode(RGB,255,255,255);//remember to re-arrange the colorMode() after usage.
    imageMode(CORNER);
    endShape(); 
  }
  
  void initColors()
  {
    colors = new PVector[npartTotal];
    for (int n = 0; n < colors.length; n++)
    {
      colors[n] = new PVector(0,0);
      float d = sqrt(sq(positions[n].x-width/2)+sq(positions[n].y-height/2));
      colors[n].x = map (d,0,sqrt(sq(width/2)+sq(height)),180,220);
      colors[n].y = 30;
    }
  }
  
  void initOpacitys() {
    opacitys = new float[npartTotal];
    for (int n = 0; n < opacitys.length; n++) {
      opacitys[n] = random(255);
    }  
  }
  void initSizes() {
    sizes = new float[npartTotal];
    for (int n = 0; n < sizes.length; n++) {
      sizes[n] = random(size_min,size_max);
    }  
  }
  
  void initKinds() {
    kinds = new int[npartTotal];
    for (int n = 0; n < kinds.length; n++) {
      kinds[n] = round(random(2));
    }  
  }
  
  void initPositions() {
    positions = new PVector[npartTotal];
    for (int n = 0; n < positions.length; n++) {
      positions[n] = new PVector(random(0, width), random(0, height), random(-min(width/2,height/2), +min(width/2,height/2)));
    }  
  }
}
