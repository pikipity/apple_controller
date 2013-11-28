import processing.serial.*;
import java.awt.*;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;

public class RobotWrapper {
  private final Robot robot;
  private int MenuStaus;

  public RobotWrapper() {
        try {
            robot = new Robot();
        } catch (AWTException e) {
            throw new RuntimeException(e);
        }
    }

    public void doStuff(int rdata) {
        if(rdata==62){
          robot.keyPress(KeyEvent.VK_DOWN);
        }else if(rdata==60){
          robot.keyPress(KeyEvent.VK_UP);
        }else if(rdata==43){
          robot.keyPress(KeyEvent.VK_RIGHT);
        }else if(rdata==45){
          robot.keyPress(KeyEvent.VK_LEFT);
        }else if(rdata==69){
          if(MenuStaus==0){
            robot.keyPress(KeyEvent.VK_EQUALS);
            MenuStaus=1;
          }else{
            robot.keyPress(KeyEvent.VK_ENTER);
            MenuStaus=0;
          }
        }else if(rdata==48){
          robot.keyPress(KeyEvent.VK_0);
        }else if(rdata==49){
          robot.keyPress(KeyEvent.VK_1);
        }else if(rdata==50){
          robot.keyPress(KeyEvent.VK_2);
        }else if(rdata==51){
          robot.keyPress(KeyEvent.VK_3);
        }else if(rdata==52){
          robot.keyPress(KeyEvent.VK_4);
        }else if(rdata==53){
          robot.keyPress(KeyEvent.VK_5);
        }else if(rdata==54){
          robot.keyPress(KeyEvent.VK_6);
        }else if(rdata==55){
          robot.keyPress(KeyEvent.VK_7);
        }else if(rdata==56){
          robot.keyPress(KeyEvent.VK_8);
        }else if(rdata==57){
          robot.keyPress(KeyEvent.VK_9);
        }
    }
}

Serial Port;
RobotWrapper robotWrapper = new RobotWrapper();
int rdata=63;
String Button="begin";

void setup(){
  size(120,120);
  smooth();
  textSize(64);
  textAlign(CENTER);
  String PortName="/dev/tty.usbmodem1421";//first USB
  Port=new Serial(this,PortName,9600);
}

void draw(){
  background(0);
  if(Port.available()>0){
    rdata=Port.read(); 
    Button=Character.toString((char) rdata);
    robotWrapper.doStuff(rdata);
  }
  text(Button,60,60);
}


