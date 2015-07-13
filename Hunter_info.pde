import fisica.*;

public class Hunter extends Object
{
  FPoly myPoly;
  Hunter(int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    myPoly = new FPoly();
    myPoly.vertex(20, 20);
    myPoly.vertex(-20, 20);
    myPoly.vertex(0, -20);
    myPoly.setPosition(3*width/4, 200);
    myPoly.setRotation(random(TWO_PI));
    myPoly.setVelocity(0, 200);
    myPoly.setFillColor(120,0,0);
    myPoly.setNoStroke();
    
  }
  
  void display(){
      world.add(myPoly);
  }
  
}
