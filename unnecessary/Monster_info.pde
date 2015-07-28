import fisica.*;
color monsterColor = #2d881f;
public class Monster extends Object
{
  FCircle monsterCircle;
  
  //arguments are same as father class - object
  Monster(int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    monsterCircle = new FCircle(min(x,y));
    
    monsterCircle.setStaticBody(true);
    monsterCircle.setRestitution(1);
    monsterCircle.setFriction(0);
    monsterCircle.setDamping(0);
    monsterCircle.setDrawable(false);   
  }
  
  void update()
  {
    super.update();
    
    if (exist == true)
    {
     monsterCircle.setPosition(center.x, center.y);  
     if (initial == true)
     {
        world.add(monsterCircle);
        initial = false;
     }
     if (monsterCircle.isTouchingBody(ball.ball))
     {
        world.remove(ball.ball);
     }
      drawMonster();  
    }
    
    if (exist == false)
    {
      world.remove(monsterCircle);
    }
  }
  
  //how to display the monster
  void drawMonster()
  {
    noStroke();
    fill(monsterColor);
    ellipse(center.x, center.y, min(size.x,size.y),min(size.x,size.y));
  }
  
}
