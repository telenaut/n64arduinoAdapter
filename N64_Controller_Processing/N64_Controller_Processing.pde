import processing.serial.*;
import java.awt.Robot;
import java.awt.AWTException;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

Serial N64Connection;
String buttons;
Robot VKey;
PImage bg;
String[] pressed;

// Declare all booleans false; this helped resolve an issue I saw when pressing each button for the first time after starting up the sketch
boolean a  = false;
boolean b  = false;
boolean z  = false;
boolean s  = false;
boolean cu = false;
boolean cd = false;
boolean cl = false;
boolean cr = false;
boolean dd = false;
boolean du = false;
boolean dr = false;
boolean dl = false;
boolean ll = false;
boolean rr = false;
boolean u  = false;
boolean d  = false;
boolean l  = false;
boolean r  = false;

void setup(){
  
    // Window
    size(540,300);
    frameRate(1);
    
    pressed = split("a", ' ');;
    
    // List all the available serial ports so you can verify your active port
    printArray(Serial.list());
    // Make sure that you match the [index] on the following line to the one of the port your microcontroller is using
    String portName = Serial.list()[1];
    
    N64Connection = new Serial(this, portName, 115200);
    try{
      VKey = new Robot();
    }
    catch(AWTException a){}
    
    N64Connection.bufferUntil('\n');
    buttons = "0000000000000000 0 0";
    bg = loadImage("N64 Controller.jpg");
}

void draw(){
  
    background(bg);
    fill(255, 255, 0);
}

void serialEvent(Serial N64Connection){
  
    try{
        // bits: A, B, Z, Start, Dup, Ddown, Dleft, Dright
        // bits: 0, 0, L, R, Cup, Cdown, Cleft, Cright
        buttons = N64Connection.readString();
        //print(buttons);
        
        pressed = split(buttons, ' ');
        //printArray(pressed);
        
        if(pressed.length >= 3)
        {
            //JOYSTICK TO DIRECTION PRESSES
            if(!u && Integer.valueOf(pressed[2]) > 20){
              VKey.keyPress(KeyEvent.VK_UP);
              u = !u;
            }
            else if (u && Integer.valueOf(pressed[2]) < 20) {
              VKey.keyRelease(KeyEvent.VK_UP);
              u = !u;
            }
            
            if(!d && Integer.valueOf(pressed[2]) < -20){
              VKey.keyPress(KeyEvent.VK_DOWN);
              d = !d;
            } 
            else if (d && Integer.valueOf(pressed[2]) > -20) {
              VKey.keyRelease(KeyEvent.VK_DOWN);
              d = !d;
            }
            
            if(!r && Integer.valueOf(pressed[1]) > 20){
              VKey.keyPress(KeyEvent.VK_RIGHT);
              r = !r;
            } 
            else if (r && Integer.valueOf(pressed[1]) < 20) {
              VKey.keyRelease(KeyEvent.VK_RIGHT);
              r = !r;
            }
            
            if(!l &&Integer.valueOf(pressed[1]) < -20){
              VKey.keyPress(KeyEvent.VK_LEFT);
              l = !l;
            } 
            else if(l && Integer.valueOf(pressed[1]) > -20) {
              VKey.keyRelease(KeyEvent.VK_LEFT);
              l = !l;
            }
            
            
            for (int i = 0; i <= 15; i++){
                if (pressed[0].charAt(i) == ('4')){
                    switch(i){
                        case 0:
                            if(!a){
                                VKey.keyPress(KeyEvent.VK_A);// A
                                a = !a;
                            }
                          break;
                        case 1:
                            if(!b){
                                VKey.keyPress(KeyEvent.VK_B);// B
                                b = !b;
                            }
                          break;
                        case 2:
                            if(!z){
                                VKey.keyPress(KeyEvent.VK_Z);// Z
                                z = !z;
                            }
                          break;
                        case 3:
                            if(!s){
                                VKey.keyPress(KeyEvent.VK_S);// Start
                                s = !s;
                            }
                          break;
                        case 4:
                            if(!du){
                                VKey.keyPress(KeyEvent.VK_NUMPAD8);// DUp
                                du = !du;
                            }
                          break;
                        case 5:
                            if(!dd){
                                VKey.keyPress(KeyEvent.VK_NUMPAD2);// DDown
                                dd = !dd;
                            }
                          break;
                        case 6:
                            if(!dl){
                                VKey.keyPress(KeyEvent.VK_NUMPAD4);// DLeft
                                dl = !dl;
                            }
                          break;
                        case 7:
                            if(!dr){
                                VKey.keyPress(KeyEvent.VK_NUMPAD6);// DRight
                                dr = !dr;
                            }
                          break;
                        case 10:
                            if(!ll){
                                VKey.keyPress(KeyEvent.VK_T);// L
                                ll = !ll;
                            }
                          break;
                        case 11:
                            if(!rr){
                                VKey.keyPress(KeyEvent.VK_R);// R
                                rr = !rr;
                            }
                          break;  
                        case 12:
                            if(!cu){
                                VKey.keyPress(KeyEvent.VK_I);// CUp
                                cu = !cu;
                            }
                          break;
                        case 13:
                            if(!cd){
                                VKey.keyPress(KeyEvent.VK_K);// CDown
                                cd = !cd;
                            }
                          break;
                        case 14:
                            if(!cl){
                                VKey.keyPress(KeyEvent.VK_J);// CLeft
                                cl = !cl;
                            }
                          break;
                        case 15:
                            if(!cr){
                                VKey.keyPress(KeyEvent.VK_L);// CRight
                                cr = !cr;
                            }
                          break;      
                    }
                }
                
                if (pressed[0].charAt(i) == ('0')){
                    switch(i){
                        case 0:
                            if(a){
                                VKey.keyRelease(KeyEvent.VK_A);// A
                                a = !a;
                            }
                          break;
                        case 1:
                            if(b){
                                VKey.keyRelease(KeyEvent.VK_B);// B
                                b = !b;
                            }
                          break;
                        case 2:
                            if(z){
                                VKey.keyRelease(KeyEvent.VK_Z);// Z
                                z = !z;
                            }
                          break;
                        case 3:
                            if(s){
                                VKey.keyRelease(KeyEvent.VK_S);// Start
                                s = !s;
                            }
                          break;
                        case 4:
                            if(du){
                                VKey.keyRelease(KeyEvent.VK_NUMPAD8);// DUp
                                du = !du;
                            }
                          break;
                        case 5:
                            if(dd){
                                VKey.keyRelease(KeyEvent.VK_NUMPAD2);// DDown
                                dd = !dd;
                            }
                          break;
                        case 6:
                            if(dl){
                                VKey.keyRelease(KeyEvent.VK_NUMPAD4);// DLeft
                                dl = !dl;
                            }
                          break;
                        case 7:
                            if(dr){
                                VKey.keyRelease(KeyEvent.VK_NUMPAD6);// DRight
                                dr = !dr;
                            }
                          break;
                        case 10:
                            if(ll){
                                VKey.keyRelease(KeyEvent.VK_T);// L
                                ll = !ll;
                            }
                          break;
                        case 11:
                            if(rr){
                                VKey.keyRelease(KeyEvent.VK_R);// R
                                rr = !rr;
                            }
                          break;  
                        case 12:
                            if(cu) {
                                VKey.keyRelease(KeyEvent.VK_I);// CUp
                                cu = !cu;
                            }
                          break;
                        case 13:
                            if(cd){
                                VKey.keyRelease(KeyEvent.VK_K);// CDown
                                cd = !cd;
                            }
                          break;
                        case 14:
                            if(cl){
                                VKey.keyRelease(KeyEvent.VK_J);// CLeft
                                cl = !cl;
                            }
                          break;
                        case 15:
                            if(cr) {
                                VKey.keyRelease(KeyEvent.VK_L);// CRight
                                cr = !cr;
                            }
                          break;      
                    }
                }
            }
        }
    }
    catch(RuntimeException e) {
        e.printStackTrace();
    }
}
