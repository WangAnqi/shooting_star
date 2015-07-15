import fisica.*;
color monsterColor = #2d881f;
public class Monster extends Object
{
  FPoly monsterPoly;
  float monster_r;
  float monster_R;
  //arguments are same as father class - object
  Monster(int a, float x, float y, float dx, float dy, float theta){
    super(a,x,y,dx,dy,theta);
    monsterPoly = new FPoly();
    
    monster_R = min(x,y)/2.0;
    monster_r = monster_R / 4.0 * 3.0;
    monsterPoly.vertex(-monster_R / 2.0, 0);
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
  
  //how to display the monster
  void display(FWorld world){
      world.add(monsterPoly);
  }
  
}
