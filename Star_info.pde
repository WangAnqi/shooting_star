import fisica.*;

public class Star extends Object
{
  FBody k;
  color cl;
  boolean state;
  Star(color c,boolean s, int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    cl = c;
    state = s;
  }
  
  void display()
  {
    if (state == true)
    {
      //ellipse(black,size);
    }
    if (state == false)
    {
      //ellipse(white,size);
    }
  }
}

