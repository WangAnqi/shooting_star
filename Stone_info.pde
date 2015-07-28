// Stone is so simple, just defined one, attach a picture, and the throw it into the FWorld

public class Stone
{
  PImage stoneImage;
  FBox stoneBox;
  Stone()
  {
    int i = int(random(0,4));
    if( i == 4)
    i = 3;
    stoneImage = loadImage("stone"+i+".png");
    float ratio = random(0.8,1.5);
    stoneImage.resize(int(ratio*stoneImage.width), int(ratio*stoneImage.height));
    stoneBox = new FBox(stoneImage.width, stoneImage.height);
    stoneBox.setPosition(random(0,displayWidth),random(0,displayHeight));
    stoneBox.setVelocity(random(0,100),random(0,100));
    stoneBox.setRestitution(1);
    stoneBox.setDamping(0);    
    stoneBox.setFriction(0);
    stoneBox.setFill(192,192,192);
    stoneBox.attachImage(stoneImage);
    world.add(stoneBox);
  }

}
