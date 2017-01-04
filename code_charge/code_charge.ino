
char command = ' '; // command received from batt_python.sh 

//int ledPin = 3;    // LED connected to digital pin 9

#define RELAY1  8   //connect relay to digital pin 3


void setup() {
  pinMode(RELAY1, OUTPUT);
  //digitalWrite(RELAY1, HIGH);
  
  Serial.begin(9600);   //python script communicates with serial monitor
}
void loop() {
  //instead of void loop, newly defined will suffice.

}

//This function will be active whenever there is a message from python sript
void serialEvent() {
  while(Serial.available()){
    command = Serial.read();
    Serial.write(command);
    if(command == 'a'){
      digitalWrite(RELAY1, HIGH);  //allow charging
      
    }
    if(command == 'b'){     //stop charging
      digitalWrite(RELAY1, LOW);
      
    }
    
  }
}

