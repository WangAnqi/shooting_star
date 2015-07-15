import fisica.*;
color monsterColor = #2d881f;
color monster_r = 30;
color monster_R = 40;
public class Monster extends Object
{
  FPoly monsterPoly;
  Monster(int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    monsterPoly = new FPoly();
    monsterPoly.vertex(-15, 0);
    
    float inc = PI/12.0;
    float angle = inc*2;
    for(int i = 0; i < 9; i++)
    {
      angle = angle + inc;
      monsterPoly.vertex(monster_r * cos(angle), monster_r * sin(angle));
      angle = angle + inc;
      monsterPoly.vertex(monster_R * cos(angle), monster_R * sin(angle));
    }
    angle = angle + inc;
    monsterPoly.vertex(monster_r * cos(angle), monster_r * sin(angle));
    monsterPoly.setPosition(center.x, center.y);
    monsterPoly.setStatic(true);
    monsterPoly.setFillColor(monsterColor);
    monsterPoly.setNoStroke();  
  }
  
  void display(FWorld world){
      world.add(monsterPoly);
  }
  
}
