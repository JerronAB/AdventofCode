/*
Goal: Read input from IR sensor, and turn a servo accordingly
Input: IR sensor, high or low, pin 8
Output: IR sensor info & servo behavior

Written By: J. Boling
Date: 3/4/24
Class: EE101
*/
/*
setup servos + pin modes + serial writeouts
Read both IRs & save to variables
Print IRs for debugging
Decisions: 
If A == 0 and B == 0, go forward
Elseif A==1 and B==0, go left
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
 bool debug = false;
 int leftSensorInput; //this will be the RESULT of digitalRead
 int rightSensorInput;
 leftSensorInput = digitalRead(leftSensorPin); //digitalRead gets the sensor value
 rightSensorInput = digitalRead(rightSensorPin);
 Serial.print("Left sensor input: ");
 Serial.print(leftSensorInput); //these last 2 lines just display the sensor's output */
 Serial.print(" -- Right sensor input: ");
 Serial.print(rightSensorInput);
 if (leftSensorInput == 0 && rightSensorInput == 0) {straightForward();}
 else if (leftSensorInput == 0 && rightSensorInput == 1) {rightTurn();}
 else if (leftSensorInput == 1 && rightSensorInput == 0)  {leftTurn();}
 else if (leftSensorInput == 1 && rightSensorInput == 1)  {straightForward();}
}
//.write(180); //turns counter-clockwise
//.write(0); //turns clockwise