#include <Joystick_ESP32S2.h>

// Create the Joystick
Joystick_ Joystick;

bool blinkState = false;  //true or false


void setup() {
  pinMode(D3, OUTPUT);
  pinMode(D6, INPUT);
  digitalWrite(D3, LOW);
  Joystick.begin();

  Serial.begin(9600);
}
void loop() {




  bool buttonPressed = digitalRead(D6);
  Joystick.setButton(0, buttonPressed);
  if (buttonPressed) {
    //blinkState = blinkState == false ? true : false;
    blinkState = !blinkState;
  }

  if (blinkState) {
    digitalWrite(D3, HIGH);
  } else {
    digitalWrite(D3, LOW);
  }

  if (buttonPressed) {
    delay(500);
  }


}