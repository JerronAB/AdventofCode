/*
Goal: Read input from IR sensor, and turn a servo accordingly
Input: IR sensor, high or low, pin 8
Output: IR sensor info & servo behavior

Written By: J. Boling
Date: 3/4/24
Class: EE101
*/
#include <Servo.h> //include the servo library
Servo newServo; //initialize a servo object

void setup() { //setup runs once
  Serial.begin(9600); // starts serial comms; sets baud rate to 9600bps
  newServo.attach(10);
  pinMode(8, INPUT); // initialize pin 8 as an input
  Serial.println("Setup complete.");
}

void loop() { //loop is equivalent to main() in most c programs; runs in forever 
 //newServo.write(0); //set servo angle
 int sensorInput; //this will be the RESULT of digitalRead
 int sensorPin = 8; //this is the pin we initialize for input
 sensorInput = digitalRead(sensorPin); //digitalRead gets the sensor value; in this line the value is assigned to the sensorInput variable
 Serial.print("Sensor input: ");
 Serial.print(sensorInput); //these last 2 lines just display the sensor's output */
 if (sensorInput == 0) { //testing sensor input
  Serial.println(" Turning Counter-Clockwise.");
  newServo.write(90); //turns counter-clockwise
 }
 else if (sensorInput == 1)  {
  Serial.println(" Turning Clockwise.");
  newServo.write(0); //turns clockwise
 }
}
