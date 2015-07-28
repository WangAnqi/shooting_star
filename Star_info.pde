color starLightColor = color(255);
color starDarkColor = color(0);

public class Star extends Object
{
  FCircle starCircle;// defined the FCircle represent the FBody of stars
  color cl;
  boolean state;
  boolean plus;// plus and time are designed for the breath-effects of the light
  float time;
  
  Star(int a, float x, float y, float dx, float dy, float theta, boolean s){
    super(a,x,y,dx,dy,theta);
    starCircle = new FCircle(min(x,y)+20);
    state = s;
    
    plus = true;
    time = 0;
    
    starCircle.setStaticBody(true);
    starCircle.setRestitution(1);
    starCircle.setFriction(0);
    starCircle.setDamping(0);
    starCircle.setDrawable(false);       
  }
  //update the states when called 
  void update()
  {
    super.update();
    if (exist == true)
    {
     starCircle.setPosition(center.x, center.y);  
     if (initial == true)
      {
        world.add(starCircle);
        initial = false;
        time = 0;
      }
      if (starCircle.isTouchingBody(ball.ball))
      {
        state = !state;//when touching the ball, change its state
      }
      if (state)
      {
        cl = starLightColor;
      }
      else
      {
        cl = starDarkColor;
      }
      
      if(plus)
      {
        time ++;
        if (time >=256)
        {plus = false;}
      }
      else
      {
        time--;
        if (time <= 64)
        {plus = true;}
      }
      drawstar();  
    }
    
    if (exist == false)
    {
      world.remove(starCircle);
    }
    
  }
  
  // drawstar() here is quite simple: 1. set the inner-ring's color as 192, the outside as 64; 2. set the ring number from 0 - time/32; 3. draw all the ellipses
  void drawstar()
  {
    float inner = time /32;
    noStroke();    
    for(int i = 0; i < inner; i++ )
    {
      float j = map(i,0,inner,64,233);
      stroke(j);
      fill(j);
      ellipse(center.x, center.y, min(size.x,size.y)+(inner-i)*4,min(size.x,size.y)+(inner-i)*4);
    }
    fill(cl);
    noStroke();
    ellipse(center.x, center.y, min(size.x,size.y),min(size.x,size.y));
  }

}

