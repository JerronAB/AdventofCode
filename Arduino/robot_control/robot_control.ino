/*
Goal: Read input from IR sensors, and turn 2 servos accordingly
Input: IR sensor (high or low)
Output: IR sensor info & servo behavior

Written By: J. Boling & J. Sprague
Date: 3/4/24
Class: EE101
*/
/*
OUTLINE:
Setup servos + pin modes + serial writeouts
Create functions for left turns and right turns
Read both sensors & save to variables
Print IR values for debugging
If leftSensor == 0 and rightSensor == 0, go forward
Elseif leftSensor == 1 and rightSensor == 0, go left
Elseif leftSensor == 0 and rightSensor == 1, go right
*/

#include <Servo.h> //include the servo library
Servo leftServo; //initialize left servo object
Servo rightServo; //init right servo object
int leftSensorPin = 2; //these are plugin locations for sensors; left sensor pin
int rightSensorPin = 4; //right sensor pin

void setup() { //setup runs once
  Serial.begin(9600); // starts serial comms; sets baud rate to 9600bps
  leftServo.attach(10); //sets up left servo using servo object
  rightServo.attach(9); //sets up right servo using servo object
  pinMode(leftSensorPin, INPUT); // init left sensor's pin as an input
  pinMode(rightSensorPin, INPUT); //init right sensor's pin as input
  Serial.println("Setup complete."); //println prints to attached console
}

void leftTurn() { //this function performs left turn
  rightServo.write(0);
  leftServo.write(0);
}
void rightTurn() { //this function performs right turn
  rightServo.write(180);
  leftServo.write(180);
}
void straightForward() { //this function moves straight forward
  rightServo.write(0);
  leftServo.write(180);
}

void loop() { //loop is equivalent to main() in most c programs; runs in forever 
 bool debug = true; //if this is set to TRUE, it will demo for Dr. Cambron (forward back left right)
 int leftSensorInput; //these variables will be the RESULT of digitalRead
 int rightSensorInput;
 leftSensorInput = digitalRead(leftSensorPin); //digitalRead gets the sensor value & stores to variable; left sensor
 rightSensorInput = digitalRead(rightSensorPin); //right sensor
 Serial.print("Left sensor input: "); //these last 4 lines just display the sensor's output 
 Serial.print(leftSensorInput); 
 Serial.print(" -- Right sensor input: ");
 Serial.print(rightSensorInput);
Serial.print("\n");

 if      (leftSensorInput == 1 && rightSensorInput == 1) {straightForward();}
 else if (leftSensorInput == 1 && rightSensorInput == 0) {leftTurn();}
 else if (leftSensorInput == 0 && rightSensorInput == 1) {rightTurn();}
}