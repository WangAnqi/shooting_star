import fisica.*;
import TUIO.*;

// The physical engine is fisica, which is based on JBOX2D. All things are happened in FWorld world
// TUIO is a protocol of the linkage between the interactive surface.
TuioProcessing tuioClient;

int stone_num = 10;
int blackholes_num = 10;
int star_num = 10;

Ball ball;
Guard guard;
FWorld world;
Sky sky;
Stone[] stones;
Blackhole[] blackholes;
Star[] stars;
Timer timer;
// We defined all the staffs needed above, where Ball, stones[] and sky are virtual; guard, blackholes[], stars[] are object based. The arrays are designed for the convience for arrange their tuio_ID
// All the tuio_objects are arranged into objlist, which is easy for add and remove.
ArrayList<Object> objlist;
ArrayList<Blackhole> blackholelist;// this list only used for 

void setup()
{
size(displayWidth, displayHeight,P3D);
frameRate(120);

tuioClient  = new TuioProcessing(this);

Fisica.init(this);
world = new FWorld();
world.setEdges();
world.setEdgesRestitution(1);
world.setEdgesFriction(0);
world.setGravity(0,0);
objlist = new ArrayList<Object>();
blackholelist = new ArrayList<Blackhole>();
// Define world and objlist before all other sub_class

sky = new Sky();
stones = new Stone[stone_num];
for (int i = 0; i < stone_num; i++)
{
  stones[i] = new Stone();//stones are vitural objects, so we needn't their ID, just establish them and throw them into the world, which has been done when they are defined.
}

stars = new Star[star_num];
for (int i = 0 ; i < star_num; i++)
{
  float r = random(0,100);
  boolean f = false;
  if(r > 50)
  f = true;
  stars[i] = new Star(i,100,100,0,0,0,f);// defined i to be their tuio_ID, which can be replaced if the markers are not suitable for usage
  objlist.add(stars[i]);
}

guard = new Guard(10,56,520,130,0,0,0);
objlist.add(guard);

ball = new Ball(10);

blackholes = new Blackhole[blackholes_num];
for (int i = 0; i < blackholes_num; i ++)
{
  blackholes[i] = new Blackhole(i+11, 152, 152, 0, 0, 0);
  objlist.add(blackholes[i]);
}
init_blackhole();
// when we need to draw blackhole, we arranged it here first, and then re-arrange it into each part
// Blackholes should be defined after a ball has been defined.

//set the Timer
timer = new Timer(70,120,120);
}

void draw()
{
  
  background(0);
  sky.update();
  world.step();
  world.draw();
  ball.update();
  for(int i = 0; i < objlist.size(); i++)
  {
    objlist.get(i).update();// update all tuio_objects
  }
  ball.update();
 
  timer.drawTimer();
  if(timer.Rest_Time <= 0){
      println("Game Over!");
  }
}

void keyPressed()
{
   timer.startTimer();
}
