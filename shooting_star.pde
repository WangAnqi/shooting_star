import fisica.*;

TuioProcessing tuioClient;
Hunter tmph;

void setup()
{
size(displayWidth, displayHeight,P2D);
tuioClient  = new TuioProcessing(this);
tmph = new Hunter(0,80,80,10,10,0);
}

void draw()
{
background(0,0,0);
tmph.display();
}
