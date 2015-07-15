import fisica.*;
color blackHoleColor = #000000;
public class BlackHole extends Object
{
  FPoly blackHolePoly;
  BlackHole(int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    blackHolePoly = new FPoly();
    blackHolePoly.vertex(10, 17);
    blackHolePoly.vertex(-10, 17);
    blackHolePoly.vertex(-20, 0);
    blackHolePoly.vertex(-10, -17);
    blackHolePoly.vertex(10, -17);
    blackHolePoly.vertex(20, 0);
    
    blackHolePoly.setPosition(center.x, center.y);
    blackHolePoly.setStatic(true);
    blackHolePoly.setFillColor(blackHoleColor);
    blackHolePoly.setNoStroke();  
  }
  
  void display(FWorld world){
      world.add(blackHolePoly);
  }
  
}
