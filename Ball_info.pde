public class Ball
{
  FCircle ball;
  float speed_mag = 500;
  PVector speed_vec;
  PVector temp_location; 
  PVector current_location; // The two locations are related to the ball, which is used to

  // The items belows are all related to the effect of the ball, just ignore it if you don't want to change what it looks like
  // The logical of drawing particles are:
  // 1. set npartTotal particle, which will be slightly moved near the ball
  // 2. set particles with a initial speed
  // 3. set particles with a accelate related to the ball's motion (dir = -ball.velocity)
  // 4. set particles with a opacity. If the opacity = 0, set the particles into initial state.
  PImage sprite;// the picture of the particle
  int npartTotal = 1000;//The amount of the particles
  int npartPerFrame = 20;
  float speed = 2;// the initial speed of each particle
  PVector gravity;
  float gravity_mag = 0.05;
  
  float partSize = 20;
  
  int partLifetime;
  PVector positions[];
  PVector velocities[];
  int lifetimes[];  
  
  Ball(float size)
  {
    sprite = loadImage("sprite.png");
    gravity = new PVector(0,0.5);
    speed_vec = new PVector(random(50,150),250);
    speed_vec.setMag(speed_mag);
    partLifetime = npartTotal / npartPerFrame;
    initPositions();
    initVelocities();
    initLifetimes();
    
    ball = new FCircle(size);
    ball.setPosition(random(0,width),random(0,height));
    ball.setVelocity(speed_vec.x,speed_vec.y);
    ball.setRestitution(1);
    ball.setFriction(0);
    //ball.setDensity(100);
    //ball.setBullet(true);
    ball.setDamping(0);
    ball.setDrawable(false);
    
    world.add(ball);

    temp_location = new PVector(ball.getX(), ball.getY());
    current_location = new PVector(ball.getX(), ball.getY());
    
  }
  

  void drawParticle(PVector center, float opacity, float d) {
    beginShape(QUAD);
    noStroke();
    colorMode(HSB,360,100,100);
    tint(180,d,100, opacity * 255);// here we made the color between s -> distance into the core.
    texture(sprite);
    normal(0, 0, 1);
    vertex(center.x - partSize/2, center.y - partSize/2, 0, 0);
    vertex(center.x + partSize/2, center.y - partSize/2, sprite.width, 0);
    vertex(center.x + partSize/2, center.y + partSize/2, sprite.width, sprite.height);
    vertex(center.x - partSize/2, center.y + partSize/2, 0, sprite.height);
    colorMode(RGB,255,255,255);    
    endShape();  
  }
  
  void update() {
    speed_vec.x = ball.getVelocityX();
    speed_vec.y = ball.getVelocityY();
    speed_vec.setMag(speed_mag);
    ball.setVelocity(speed_vec.x,speed_vec.y);
    
    current_location.set(ball.getX(), ball.getY());// If you take velocity instead of the substration between current_location and temp_location, the particle will be ugly... I don't know why
    if((current_location.x != temp_location.x)&&(current_location.y != temp_location.y))
    {
      gravity = PVector.sub(temp_location, current_location);
      temp_location.set(current_location);
      gravity.setMag(gravity_mag);
      //println("moving");
    }
    else
    {
      gravity.x = 0;
      gravity.y = gravity_mag;
    }
    
    for (int n = 0; n < npartTotal; n++) {
      lifetimes[n]++;
      if (lifetimes[n] == partLifetime) {
        lifetimes[n] = 0;
      }      
  
      if (0 <= lifetimes[n]) {      
        float opacity = 1.0 - float(lifetimes[n]) / partLifetime;
              
        if (lifetimes[n] == 0) {
          // Re-spawn dead particle
          positions[n].x = ball.getX();
          positions[n].y = ball.getY();
          
          float angle = random(0, TWO_PI);
          float s = random(0.5 * speed, 0.5 * speed);
          velocities[n].x = s * cos(angle);
          velocities[n].y = s * sin(angle);
          velocities[n].x += gravity.x;
          velocities[n].y += gravity.y;
          velocities[n].setMag(speed);
        } else {
          positions[n].x += velocities[n].x;
          positions[n].y += velocities[n].y;
          
          velocities[n].x += gravity.x;
          velocities[n].y += gravity.y;        
        }
        float d = (PVector.sub(positions[n],current_location)).mag();
        d = d/2;
        drawParticle(positions[n], opacity,d );
      }
    }
  }
  
  void initPositions() {
    positions = new PVector[npartTotal];
    for (int n = 0; n < positions.length; n++) {
      positions[n] = new PVector();
    }  
  }
  
  void initVelocities() {
    velocities = new PVector[npartTotal];
    for (int n = 0; n < velocities.length; n++) {
      velocities[n] = new PVector();
    }
  }
  
  void initLifetimes() {
    // Initializing particles with negative lifetimes so they are added
    // progressively into the screen during the first frames of the sketch   
    lifetimes = new int[npartTotal];
    int t = -1;
    for (int n = 0; n < lifetimes.length; n++) {    
      if (n % npartPerFrame == 0) {
        t++;
      }
      lifetimes[n] = -t;
    }
  }   
}






