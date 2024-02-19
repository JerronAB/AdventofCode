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
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600); //starts serial comms; sets baud rate to 9600bps
}

void loop() { //loop is equivalent to main() in most c programs; 
             //on arduino, it loops forever after setup is run
  Serial.write("Hello World! \n");     //could also use serial.println
  digitalWrite(LED_BUILTIN, HIGH);    // turn the LED on (HIGH is the voltage level)
  delay(1000);                       // wait for a second
  digitalWrite(LED_BUILTIN, LOW);   // turn the LED off by making the voltage LOW
  delay(500);                      // wait for a second

}
