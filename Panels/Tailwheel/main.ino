#include <Joystick_ESP32S2.h>

Joystick_ Joystick;

bool blinkState = false;
bool lastBlinkState = false;
int lastButtonState = 0;

char* lastToggleState = "none";

void setup() {
  pinMode(D7, OUTPUT);
  digitalWrite(D7, LOW);


  pinMode(D3, INPUT_PULLUP);
  pinMode(D4, INPUT_PULLUP);

  //pinMode(D9, INPUT);
  //pinMode(D12, INPUT);
  Joystick.begin();
  toggleSwitch();
  Serial.begin(9600);
}
void buttonPress() {
  bool buttonPressed = digitalRead(D6);

  if (buttonPressed != lastButtonState) {
    Joystick.setButton(0, buttonPressed);
    lastButtonState = buttonPressed;

    if (buttonPressed) {
      blinkState = !blinkState;
    }

  }

  //Serial.println("buttonPressed");
  //Serial.println(buttonPressed);

  if (blinkState != lastBlinkState){
    if (blinkState) {
      digitalWrite(D7, HIGH);
    } else {
      digitalWrite(D7, LOW);
    }
    lastBlinkState = blinkState;
  }
}

void toggleSwitch() {
  bool off = digitalRead(D3);
  bool fixed = digitalRead(D4);

  char* toggleState;
  if (fixed && !off) {
    toggleState = "fixed";
    //Joystick.setButton(1, true);
  } else if (fixed && off) {
    toggleState = "norm";
    //Joystick.setButton(2, true);
  } else if (!fixed && off) {
    toggleState = "off";
    //Joystick.setButton(3, true);
  }

  if (toggleState != lastToggleState){
    if (toggleState == "fixed") {
      Joystick.setButton(1, true);
      Joystick.setButton(2, false);
      Joystick.setButton(3, false);
    } else if (toggleState == "norm") {
      Joystick.setButton(1, false);
      Joystick.setButton(2, true);
      Joystick.setButton(3, false);
    } else if (toggleState == "off") {
      Joystick.setButton(1, false);
      Joystick.setButton(2, false);
      Joystick.setButton(3, true);
    }
    lastToggleState = toggleState;
  }

}

void loop() {
  buttonPress();
  toggleSwitch();
  delay(40);
}