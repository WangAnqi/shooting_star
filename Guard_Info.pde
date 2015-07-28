//Normal class of guard, its behavior is related to the existance of the tobj
public class Guard extends Object
{
  int switch_id;
  boolean switch_state;
  boolean switch_initial;
  float switch_angle;
  float switch_temp_angle;
  float dtheta;
  int acc_frame;
  PVector v;
  TuioObject switch_obj;
  FPoly guardPoly;
  Guard(int a, int b, float x, float y, float dx, float dy, float theta)
  {
    super(a,x,y,dx,dy,theta);
    switch_id = b;
    switch_state = false;
    switch_initial = true;
    
    dtheta = 0;
    v = new PVector(0,0);
    
    guardPoly = new FPoly();
    guardPoly.vertex(0,y/2);
    guardPoly.vertex(x/2,0);
    guardPoly.vertex(0,-y/2);
    guardPoly.vertex(-x/2,0);
    
    guardPoly.setRestitution(1);
    guardPoly.setFriction(0);
    guardPoly.setDensity(100);
    guardPoly.setDamping(0);
    guardPoly.setStaticBody(true);
    guardPoly.setDrawable(false);
    switch_angle = switch_temp_angle = 0;
    acc_frame = 0;
    
}  
    void update()
    {
      super.update();
      if (exist == true)
      {
       guardPoly.setPosition(center.x, center.y);
       guardPoly.setRotation(current_angle);  
      if (initial == true)
       {
          world.add(guardPoly);
          initial = false;
       }
       if(switch_state)
         {
           if (switch_initial)
           {
             switch_angle = switch_temp_angle = tobj.getAngle() - current_angle; 
             switch_initial = false;
           }
           else
           {
               switch_angle = switch_obj.getAngle() - current_angle;
               dtheta = switch_angle - switch_temp_angle;
               v.set(ball.ball.getVelocityY(), -ball.ball.getVelocityX());
               v.setMag(-dtheta*300);
               println(dtheta*300);
               ball.ball.addForce(v.x, v.y);
               acc_frame++;
               if (acc_frame >= 30)
               {
                   switch_temp_angle = switch_angle;
                   acc_frame = 0;
               }
           }
         }
       else
       {
          switch_initial = true;
          v.set(0,0); 
       }
       
       
     if (guardPoly.isTouchingBody(ball.ball))
     {
        
     }

    }
    
    if (exist == false)
    {
      world.remove(guardPoly);
    }
  }
}

