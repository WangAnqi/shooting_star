import fisica.*;
color blackHoleColor = #938E8E;
public class BlackHole extends Object
{
  FCircle blackHoleCircle;
  
  BlackHole(int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    blackHoleCircle = new FCircle(min(x,y));
    
    blackHoleCircle.setStaticBody(true);
    blackHoleCircle.setRestitution(1);
    blackHoleCircle.setFriction(0);
    blackHoleCircle.setDamping(0);
    blackHoleCircle.setDrawable(false);  
    world.add(blackHoleCircle);
  }
  
  void update()
  {
    super.update();
    
    if (exist == true)
    {
     blackHoleCircle.setPosition(center.x, center.y);  
     if (initial == true)
     {
        world.add(blackHoleCircle);
        initial = false;
     }
     if (blackHoleCircle.isTouchingBody(ball.ball))
     {
        world.remove(ball.ball);
     }
      drawBlackHole();  
    }
    
    if (exist == false)
    {
      world.remove(blackHoleCircle);
    }
  }
  
  //how to display the blackhole
  void drawBlackHole(){
    noStroke();
    fill(blackHoleColor);
    ellipse(center.x, center.y, min(size.x,size.y),min(size.x,size.y));
  }
  
}
