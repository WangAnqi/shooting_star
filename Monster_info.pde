import fisica.*;
color monsterColor = #155AAD;
public class Monster extends Object
{
  FPoly monsterPoly;
  Monster(int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    monsterPoly = new FPoly();
    monsterPoly.vertex(20, 20);
    monsterPoly.vertex(-20, 20);
    monsterPoly.vertex(0, -20);
    monsterPoly.setPosition(center.x, center.y);
    monsterPoly.setStatic(true);
    monsterPoly.setFillColor(monsterColor);
    monsterPoly.setNoStroke();  
  }
  
  void display(FWorld world){
      world.add(monsterPoly);
  }
  
}
