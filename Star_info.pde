import fisica.*;
color starLightColor = #FFF812;
color starDarkColor = #A09D3A;
public class Star extends Object
{
  FPoly starPoly;
  color cl;
  boolean state;
  Star(boolean s, int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    state = s;
    if(state){
       cl = starLightColor;
    }
    else{
       cl = starDarkColor;
    }
    
    starPoly = new FPoly();
    starPoly.vertex(0,34);
    starPoly.vertex(-10,17.2);
    starPoly.vertex(-30,17.2);
    starPoly.vertex(-20,0);
    starPoly.vertex(-30,-17.2);
    starPoly.vertex(-10,-17.2);
    starPoly.vertex(0,-34);
    starPoly.vertex(10,-17.2);
    starPoly.vertex(30,-17.2);
    starPoly.vertex(20,0);
    starPoly.vertex(30,17.2);
    starPoly.vertex(10,17.2);
    
    starPoly.setPosition(center.x, center.y);
    starPoly.setStatic(true);
    starPoly.setFillColor(cl);
    starPoly.setNoStroke(); 
  }
  
  void display(FWorld world)
  {
    world.add(starPoly);
  }
  
  void light()
  {
    state = true;
    cl = starLightColor;
    starPoly.setFillColor(cl);
  }
  
  void dark()
  {
    state = false;
    cl = starDarkColor;
    starPoly.setFillColor(cl);
  }
}

