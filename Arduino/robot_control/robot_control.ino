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
Read both sensors & save to variables
Create functions for left turns and right turns
Print IR values for debugging
If leftSensor == 1 and rightSensor == 1, go forward
Elseif leftSensor == 1 and rightSensor == 0, go left
Elseif leftSensor == 0 and rightSensor == 1, go right
*/

#include <Servo.h> //include the servo library
Servo leftServo; //initialize a servo object
Servo rightServo;
int leftSensorPin = 2; 
int rightSensorPin = 13; 

void setup() { //setup runs once
  Serial.begin(9600); // starts serial comms; sets baud rate to 9600bps
  leftServo.attach(10);
  rightServo.attach(9);
  pinMode(leftSensorPin, INPUT); // init pin 8 as an input
  pinMode(rightSensorPin, INPUT); //init pin 11 as input
  Serial.println("Setup complete.");
}

void leftTurn() {
  rightServo.write(0);
  leftServo.write(0);
}
void rightTurn() {
  rightServo.write(180);
  leftServo.write(180);
}
void straightForward() {
  rightServo.write(0);
  leftServo.write(180);
}

void loop() { //loop is equivalent to main() in most c programs; runs in forever 
 //initialize function?
 bool debug = true;
 int leftSensorInput; //this will be the RESULT of digitalRead
 int rightSensorInput;
 leftSensorInput = digitalRead(leftSensorPin); //digitalRead gets the sensor value
 rightSensorInput = digitalRead(rightSensorPin);
 Serial.print("Left sensor input: ");
 Serial.print(leftSensorInput); //these last 2 lines just display the sensor's output */
 Serial.print(" -- Right sensor input: ");
 Serial.print(rightSensorInput);
 if (debug) {
  straightForward();
  delay(5000);
  rightServo.write(180);
  delay(5000);
  leftServo.write(0);
  rightTurn();
  delay(5000);
  leftTurn();
  delay(5000);
  }
 else if (leftSensorInput == 0 && rightSensorInput == 0) {straightForward();}
 else if (leftSensorInput == 0 && rightSensorInput == 1) {rightTurn();}
 else if (leftSensorInput == 1 && rightSensorInput == 0) {leftTurn();}
}
//.write(180); //turns counter-clockwise
//.write(0); //turns clockwise