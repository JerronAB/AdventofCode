/* read input from IR sensor set variable lastInstruction to IR sensor value (if received) operation based on instruction operations/instructions: 
  go (fan on) 
  stop (fan off) 
  if PWM available, have variable fanStrength 
*/ 

//#include <Servo.h>  //include the servo library 
//Servo sailServo; //initialize a servo object 
//int ssPin = 0; 
int fanPin = 3;

/////////
#include <IRremote.h>
#include <iRremoteInt.h>
#define DEBUG
int irPin = 10;
/////////

int lastInstruction = 0; 
int goInstruction = 0; 
int stopInstruction = 0; 
int toggleFan = 0x45;
bool fanActive = false;

void setup() { //setup runs once 
Serial.begin(9600); // starts serial comms; sets baud rate to 9600bps
IrReceiver.begin(irPin, ENABLE_LED_FEEDBACK);
printActiveIRProtocols(&Serial);
pinMode(fanPin, OUTPUT);
pinMode(LED_BUILTIN, OUTPUT);
Serial.println("Setup complete."); 
//sailServo.attach(ssPin); 
} 

//void leftTurn() { 
  //sailServo.write(0); 
//}  

void loop() { 
    /*
     * Check if received data is available and if yes, try to decode it.
     * Decoded result is in the IrReceiver.decodedIRData structure.
     *
     * E.g. command is in IrReceiver.decodedIRData.command
     * address is in command is in IrReceiver.decodedIRData.address
     * and up to 32 bit raw data in IrReceiver.decodedIRData.decodedRawData
     */
    if (IrReceiver.decode()) {
      Serial.println("DATA RECEIVED!!!");
        /*
         * Print a summary of received data
         */
        if (IrReceiver.decodedIRData.protocol == UNKNOWN) {
            Serial.println(F("Received noise or an unknown (or not yet enabled) protocol"));
            // We have an unknown protocol here, print extended info
            IrReceiver.printIRResultRawFormatted(&Serial, true);
            IrReceiver.resume(); // Do it here, to preserve raw data for printing with printIRResultRawFormatted()
        } else {
            IrReceiver.resume(); // Early enable receiving of the next IR frame
            IrReceiver.printIRResultShort(&Serial);
            IrReceiver.printIRSendUsage(&Serial);
        }
        Serial.println();

        /*
         * Finally, check the received data and perform actions according to the received command
         */
        if (IrReceiver.decodedIRData.command == toggleFan) {
            if (fanActive) {
              fanActive = false;
              digitalWrite(fanPin, LOW);
              digitalWrite(LED_BUILTIN, LOW);
            }
            else if (!fanActive) {
              fanActive = true;
              digitalWrite(fanPin, HIGH);
              digitalWrite(LED_BUILTIN, HIGH);
            }
        }
    }
}