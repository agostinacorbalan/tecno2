/* import gab.opencv.*;
import processing.video.*;
import java.awt.*;
//Pala pala;

boolean isHandMovementDetectorWindowCreated = false;
boolean didUserChooseMovementDetectorType =false;
int userChoiseForMovementDetectorType = 0;

class HandMovementDetector extends PApplet {

  Capture video;
  OpenCV opencv;
  
  boolean handDetectionPositive = false;  
 
  void settings() {
    size(1000, 700);
  }

  void setup() {     
    video = new Capture(this, 1000/2, 700/2, 0);
    opencv = new OpenCV(this, 1000/2, 700/2);
    if(userChoiseForMovementDetectorType == 1)
      opencv.loadCascade(".\\fist.xml");    
    else if(userChoiseForMovementDetectorType == 2)
      opencv.loadCascade(".\\palm.xml");
   // currentTime = 0;
  //  startTime = millis();
    video.start();
  }

  void draw() {
    isHandMovementDetectorWindowCreated = true;    
    surface.setLocation(0,50);
    scale(2);
    opencv.loadImage(video);
  
    image(video, 0, 0 );
  
    noFill();
    stroke(0, 255, 0);
    strokeWeight(3);
    Rectangle[] faces = opencv.detect();
    //println(faces.length);
    
    if(faces.length == 0) {
      handDetectionPositive=false;
    }
    
    for (int i = 0; i < faces.length; i++) {
      //println(faces[i].x + "," + faces[i].y);
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
      
      if(faces[i].x>0 && (faces[i].x+faces[i].width)<=320 && faces[i].y+faces[i].height<=50) {               
        if (yPos >= -10) {
          pala.moveUp = true;        
          handDetectionPositive=true;
        }
      }    
      else if(faces[i].x>0 && (faces[i].x+faces[i].width)<=320 && faces[i].y<=50) {        
        if (yPos >= -10) {
          pala.moveUp = true;        
          handDetectionPositive = true;
        }
      }    
      else {       
        handDetectionPositive = false;
      }
    }
    
    if (handDetectionPositive == false){
       if (yPos <= 530) {
           pala.moveUp = false;
           pala.moveDown = true;           
       }
    }             
    line(0, 50, 320, 50);
  }

  void captureEvent(Capture c) {
    c.read();
  }
} */
