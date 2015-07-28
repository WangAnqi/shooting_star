// In this case we defined an "adjusted" tuio-object, where we made dx, dy and theta as the adjustment between the object center and the tobj center.

public class Object
  {
    int location_id;
    PVector center;
    PVector adjust;
    PVector size;
    float current_angle;
    float temp_angle;        
// in case that center is not equal to the geometric center of the object, adjust should be a static value which is determined before the usage    
    boolean exist;
    boolean initial;
    int dis_time;
// this three values determined the dis_time is designed for the dispear time of the Object,     
    TuioObject tobj;
// In the next step, we define the initial behavior of the Object 
    Object(int a, float x, float y, float dx, float dy, float theta)
    {
      location_id = a;
      size = new PVector(x,y);
      center = new PVector(0,0);
      adjust = new PVector(dx,dy);      
      adjust.rotate(theta);
      exist = false;
      initial = true;
      dis_time = 0;
    }  

    void update()
    {
      // if dis_time >= 10, we regards the object has gone
      if(exist)
      {
        if (tobj.getTuioState() == 4)
        {
          dis_time ++;
          if(dis_time >= 10)
          {
            exist = false;
            dis_time = 0;
            initial = true;
          }
        }
        else
        {
          dis_time = 0;
        }
        // Then we re-caculate the center.x and center.y based on the tobj.x, tobj.y and dx,dy
        float x = tobj.getScreenX(width);
        float y = tobj.getScreenY(height);
        if(initial)
        {
          current_angle = tobj.getAngle();
          temp_angle = tobj.getAngle();
          adjust.rotate(current_angle);
        }
        else
        {
          current_angle = tobj.getAngle();
          adjust.rotate(current_angle - temp_angle);
          temp_angle = current_angle;
        }            
        center.x = adjust.x + x;
        center.y = adjust.y + y;
      } 
    }
  }

