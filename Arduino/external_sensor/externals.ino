/*
Goal: read input from a sensor
Input: pin 8, an IR sensor
Output: Serial output, HIGH or LOW

Written By: J. Boling
Date: 3/4/24
Class: EE101
*/
void setup() { //setup runs once
  Serial.begin(9600); // starts serial comms; sets baud rate to 9600bps
  pinMode(8, INPUT); // initialize pin 8 as an input
  Serial.println("Setup complete.");
}

void loop() { //loop is equivalent to main() in most c programs; runs in forever 
 int sensorInput; //this will be the RESULT of digitalRead
 int sensorPin = 8; //this is the pin we initialize for input
 sensorInput = digitalRead(sensorPin); //digitalRead gets the sensor value; in this line the value is assigned to the sensorInput variable
 Serial.println("Sensor input: ");
 Serial.print(sensorInput); //these last 2 lines just display the sensor's output 
}
