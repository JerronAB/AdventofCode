void setup() {
  // put your setup code here, to run once:
  // Telling arduino to work with pin 13, using it as an OUTPUT:
  //
  pinMode(13,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  // Turn on LED. Send signal using digitalWrite, signal is HIGH (on)
  digitalWrite(13,HIGH);
  delay(1000); //in miliseconds
  digitalWrite(13,LOW);
  delay(1000);
}
