/*
Goal: Softly turn an LED on or off
Input: None
Output: Softly turn an LED on or off

Written By: J. Boling
Date: 2/19/24
Class: EE101
*/
void setup() { //setup runs once
  pinMode(3, OUTPUT); // initialize digital pin 3 as an output.
  Serial.begin(9600); // starts serial comms; sets baud rate to 9600bps
  Serial.println("Setup complete. \n");
}

void loop() { //loop is equivalent to main() in most c programs; runs in forever 
  int rampTime = 10; //represents time between increments or decrements
  Serial.println("Start of ramp-up of for loop.");
  for (int i = 0; i<255; i++) { // initialize loop from 0 to 255; increment 1
    Serial.println(i); //prints current value of i
    analogWrite(3, i); //this just sets the intensity of what's going out pin 3
    delay(rampTime); //delays for previously set time
  }
  Serial.println("Start of ramp-down for loop.");
  for (int i = 255; i>0; i--) { // initialize loop from 255 to 0; step 1
    Serial.println(i); //prints current increment value
    analogWrite(3, i); //sets intensity of pin 3
    delay(rampTime); //delays for previously set time
  }
  Serial.println("End of for loop.");
}
