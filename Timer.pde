import java.awt.Point;
import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PFont;

float scale = 1.5;
float Big_Font_Size = 150.0 / scale;
float Small_Font_Size = 36.0 /scale;
float Clock_Mark_Width = 6 / scale;
float Clock_Mark_Height = 30 / scale;
float
Clock_Mark_Radius = 120 / scale;

class Timer{
  PVector center;
  PFont bigFont, smallFont;
  boolean timerFlag;
  int startTime_millis, Total_Time, Rest_Time;
  
  Timer(int seconds, float x, float y) {
    smooth();
    
    center = new PVector(x,y);
    center.x = x;
    center.y = y;
    
    char[] chars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    bigFont = createFont("Helvetica-Bold", Big_Font_Size, true, chars);
    smallFont = createFont("Helvetica-Bold", Small_Font_Size, true, chars);
    
    timerFlag = false;
    
    Total_Time = seconds * 1000;
  }
  
  void startTimer(){
       timerFlag = true;
       startTime_millis = millis();
  }
  
  void drawTimer() {
        colorMode(RGB,256);
        noStroke();
                        
        int pass_time;
        if(timerFlag){
            pass_time = millis()-startTime_millis;
            Rest_Time = (Total_Time - pass_time)/1000;//the rest seconds
        }
        else{
            pass_time = 0;
            Rest_Time = Total_Time/1000;
        }
                     
        int sec, min, millis;
        if(Rest_Time <= 0){
            sec = 0;
            min = 0;
            millis = 0;
        }
        else{
            sec = Rest_Time%60;//second();
            min = Rest_Time/60;
            millis = (Total_Time - pass_time)%1000;
        }
        
        if(min <= 0){
            for (int i = 0; i < 360; i+=6) {
               float x = sin(radians(-i));
               float y = cos(radians(-i));
               colorMode(HSB,360,100,100);
               fill(map(i, 0, 360, 200, 180), map(i, 0, 360, 100, 50), 100);
               colorMode(RGB,255,255,255);
               /* Show the ellipse if the second has passed */
               if (i < sec*6){
                 clockDot(center.x+x*Clock_Mark_Radius, center.y+y*Clock_Mark_Radius, Clock_Mark_Width, Clock_Mark_Height, i);
               }
            }
        }
        else{
            for (int i = 0; i < 360; i+=6) {
               float x = sin(radians(-i));
               float y = cos(radians(-i));
               colorMode(HSB,360,100,100);
               fill(map(i, 0, 360, 200, 180), map(i, 0, 360, 100, 50), 100);
               colorMode(RGB,255,255,255);
               /* Show the ellipse if the second has passed */
               clockDot(center.x+x*Clock_Mark_Radius, center.y+y*Clock_Mark_Radius, Clock_Mark_Width, Clock_Mark_Height, i);
            }
        }
         
        // display the time
        // seconds
        fill(255,255,255,200); // white
        textFont(bigFont);
        textAlign(CENTER);
        text(nf(sec,2), center.x, center.y+30);
        
        // minutes
        fill(255,255,200,200); // yellow
        textFont(smallFont);
        //text(nf(min,2), center.x, center.y - 65);
        text(nf(min,2), center.x, center.y - Big_Font_Size/2);
 
        // millis
        fill(255, 200, 200, 200); // red
        //text(nf(millis,3), center.x, center.y + 90);
        text(nf(millis,3), center.x, center.y + Big_Font_Size/2 + Small_Font_Size/2);
    }
    
    void clockDot(float x, float y, float w, float h, float angle) {
        pushMatrix();
        translate(x, y);
        rotate(radians(angle));
        rect(0, 0, w, h, w);
        popMatrix();
    }
}
