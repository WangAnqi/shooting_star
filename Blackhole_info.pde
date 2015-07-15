import fisica.*;
color blackHoleColor = #000000;
public class BlackHole extends Object
{
  FCircle blackHole;
  float blackHole_R;
  //arguments are same as father class - object
  BlackHole(int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    blackHole_R = min(x,y);
    blackHole = new FCircle(blackHole_R);
    
    
    blackHole.setPosition(center.x, center.y);
    blackHole.setStatic(true);
    blackHole.setFillColor(blackHoleColor);
    //blackHolePoly.setNoStroke();  
    blackHole.setStroke(255,255,255);
    blackHole.setStrokeWeight(5);
  }
  
  //how to display the blackhole
  void display(FWorld world){
      world.add(blackHole);
  }
  
}
