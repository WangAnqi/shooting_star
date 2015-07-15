import fisica.*;

TuioProcessing tuioClient;
Monster tmph;
BlackHole tmpb;
FWorld world;
Star tmps;
void setup()
{
//size(displayWidth, displayHeight,P2D);
size(800, 600);
Fisica.init(this);
world = new FWorld();

tuioClient  = new TuioProcessing(this);
tmph = new Monster(0,80,80,10,10,0);
tmph.display(world);

tmpb = new BlackHole(0,80,80,10,10,0);
tmpb.display(world);

tmps = new Star(false,0,80,80,10,10,0);
tmps.display(world);
}

void draw()
{
background(61,51,149);
world.step();
world.draw();
}

void keyPressed(){
  if(tmps.state == true){
     tmps.dark();
  }
  else{
     tmps.light();
  }
}
