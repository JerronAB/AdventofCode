/*
Hello World/Lab 1 First Arduino Setup
Goal: Write a program that says "Hello World!" on a loop
Input: None
Output: Serial Monitor

Written By: J. Boling
Date: 2/19/24
Class: EE101
*/

 //every arduino program has these two functions
//setup runs once
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(3, OUTPUT);
  Serial.begin(9600); //starts serial comms; sets baud rate to 9600bps
  Serial.println("Setup complete. \n");
}

void loop() { //loop is equivalent to main() in most c programs; 
  int i; //i will be used for increment/decrement; start at 0
  int rampTime = 20; //represents time between 
  for (int i; i<180; i++) {
    analogWrite(3, i);
    delay(rampTime);
    Serial.println(i);
  }
  for (int i = 180; i>0; i--) {
    analogWrite(3, i);
    delay(rampTime);
    Serial.println(i);
  }
}
