/*
Goal: Write a for loop that notates when certain values are reached (1,3,8,29) and repeats
Input: None
Output: "Reading (number)"

Written By: J. Boling
Date: 2/26/24
Class: EE101
*/
void setup() { //setup runs once
  Serial.begin(9600); // starts serial comms; sets baud rate to 9600bps
  int i = 0;
}

void loop() { //loop is equivalent to main() in most c programs; runs in forever 
for (int i = 0; i<31;i++) { // starts at 0, and increments until 30, then repeats
  if (i == 1) {Serial.println("Reading 1");} // if i is 1, print that fact
  else if (i == 3) {Serial.println("Reading 3");} // if i is 3, print that fact
  else if (i == 8) {Serial.println("Reading 8");} // if i is 8, print that fact
  else if (i == 29) {Serial.println("Reading 29");} // if i is 29, print that fact
  else if (i == 30) {int i = 0;} //this item "resets" our loop when i reaches 30
  delay(500);
  }
}
