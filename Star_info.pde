import fisica.*;

color starLightColor = #FFFFFF;
color starDarkColor = #000000;
public class Star extends Object
{
  FPoly starPoly;
  color cl;
  boolean state;
  float star_type;
  float star_r;
  float star_R;
  float rRscale;
  
  //s is state, false means that star is dark while true means that star is light.
  //other arguments are same as father class - object
  Star(boolean s, int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    
    starPoly = new FPoly();
    
    state = s;
    star_type = 6.0;
    rRscale = 2.0/3.0;
    star_R = min(x,y)/2.0;
    star_r = star_R * rRscale;
    float inc = (TWO_PI / star_type) / 2.0;
    float angle = 0;
    
    for(int i = 0; i < star_type*2; i++)
    {
       starPoly.vertex(star_r*cos(angle),star_r*sin(angle));
       angle = angle + inc;
       starPoly.vertex(star_R*cos(angle),star_R*sin(angle));
       angle = angle + inc;
    }
    
    if(state){
       cl = starLightColor;
    }
    else{
       cl = starDarkColor;
    }
    
    starPoly.setPosition(center.x, center.y);
    starPoly.setStatic(true);
    starPoly.setFillColor(cl);
    //starPoly.setNoStroke(); 
  }
  
  //how to display the star
  void display(FWorld world)
  {
    world.add(starPoly);
  }
  
  //let the star light
  void light()
  {
    state = true;
    cl = starLightColor;
    starPoly.setFillColor(cl);
  }
  
  //let the star in dark
  void dark()
  {
    state = false;
    cl = starDarkColor;
    starPoly.setFillColor(cl);
  }
}

