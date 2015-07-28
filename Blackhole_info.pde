// The blackhole class will be somehow tricky
// 1. it will be set as a sensor, means no collition between blackhole and other FBody
// 2. when ball.ball collide with the blackhole, it will transmit the ball into another Blackhole
// 3. we need to arrange all the blackholes into blackholelist, and then re-arrange the location randomly

public class Blackhole extends Object
{
  FCircle BlackholeCircle;
  PVector out_point;
  float size;
  Blackhole(int a, float x, float y, float dx, float dy, float theta)
  {
    super(a,x,y,dx,dy,theta);
    size = min(x,y);
    out_point = new PVector(0,0);// this point is designed for the ball to get out, since if we set the center point, the ball will still be regarded as "collide with the blackhole",
    BlackholeCircle = new FCircle(size);
    BlackholeCircle.setStaticBody(true);
    BlackholeCircle.setRestitution(1);
    BlackholeCircle.setFriction(0);
    BlackholeCircle.setDamping(0);
    BlackholeCircle.setSensor(true);
    BlackholeCircle.setDrawable(false);
  }
  
  void update()
  {
    super.update();
    if (exist == true)
    {
     BlackholeCircle.setPosition(center.x, center.y);
     BlackholeCircle.setRotation(current_angle);
     out_point.set(ball.ball.getVelocityX(), ball.ball.getVelocityY());
     out_point.setMag(size+5);
     out_point.add(center);// to make the out_point outside the bondary, in the direction of the velocity of the ball
     if (out_point.x >= displayWidth-5)
     out_point.x = displayWidth - 5;
     if (out_point.x <= 5)
     out_point.x = 5;
     if (out_point.y >= displayHeight-5)
     out_point.y = displayHeight - 5;
     if (out_point.y <= 5)
     out_point.y = 5;  // if out_point exceed the boundary of the world, set it back
      if (initial == true)
      {
        world.add(BlackholeCircle);
        blackholelist.add(this);// This is different then other objects
        initial = false;
      }
     if (BlackholeCircle.isTouchingBody(ball.ball))
     {
       int i = int(random(0,blackholelist.size()));
       if((blackholelist.size()>=1)&&(i == blackholelist.size()))
       {
         i = blackholelist.size()-1;
       }
       while (this == blackholelist.get(i)&&blackholelist.size()>1)
       {
         i = int(random(0,blackholelist.size()));
         if((blackholelist.size()>=1)&&(i == blackholelist.size()))
         {
           i = blackholelist.size()-1;
         }
       }// set the outside blackhole different with the entering blackhole
        
        ball.ball.setPosition(blackholelist.get(i).out_point.x, blackholelist.get(i).out_point.y);
     }
     draw_blackhole(center.x, center.y);
     fill(255);
     ellipse(center.x, center.y, size-50, size-50); 
    }
    
    if (exist == false)
    {
      world.remove(BlackholeCircle);
      blackholelist.remove(this);
    }
  }
  
  
}

cStar [] star = new cStar[2000]; 
void init_blackhole() {
  for (int i=0; i<star.length; i++) { 
      star[i] = new cStar(); 
    } 
  }
  
  void draw_blackhole(float x, float y) { 
    pushMatrix();
    translate(x,y,0);
    rotateX(PI/2);
    for (int i=0; i<star.length; i++) { 
      star[i]._draw(); 
    }
    popMatrix();
  }   
public class cStar { 
  PVector pt; 
  float rad; 
  float dir; 
  float lum; 
  
  cStar() { 
    pt = new PVector(0, 0, 0); 
    _init(); 
  } 

  void _init() { 
    pt.set(0, 0, 0); 
    rad = 500/random(1, 100); // here d/random(1,100), d is related to the outside radius
    dir = random(TWO_PI); 
    lum = random(128, 255); 
  } 

  void _draw() { 
    pt.x = rad * cos(dir); 
    pt.y = -1000.0 / rad; 
    pt.z = rad * sin(dir); 

    stroke(lum*(0.3*sin(-dir)+0.7));
    strokeWeight(1.5);

    if (pt.y > -15) point(pt.x, pt.y, pt.z); // here pt.y > d, d is related to the inner radius
    dir += 20 / (rad * rad); 
    rad = 0.996*rad; 

    if (pt.y < -15) _init(); // here pt.y < d, d is related to the inner radius
  } 
} 




