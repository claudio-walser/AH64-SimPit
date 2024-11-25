#include <Joystick_ESP32S2.h>

Joystick_ Joystick;

bool armLedState = false;
bool lastArmLedState = false;
int armButtonState = 0;

int goButtonState = 0;
bool goLedState = false;
bool lastGoLedState = false;

void setup() {
  // arm yellow led
  pinMode(D2, OUTPUT);
  // arm green led
  pinMode(D3, OUTPUT);
  // arm button
  pinMode(D4, INPUT_PULLUP);

  // ground overwrite led
  pinMode(D5, OUTPUT);
  // ground overwrite button
  pinMode(D6, INPUT_PULLUP);


  // initial ARM Led State is yellow
  digitalWrite(D2, HIGH);
  digitalWrite(D3, LOW);

  // initial Ground Overwrite Led State is off
  digitalWrite(D5, LOW);

  Joystick.begin();
  Serial.begin(9600);
}

void armButtonPress() {
  bool armButtonPressed = digitalRead(D4);
  if (armButtonPressed != armButtonState) {
    Joystick.setButton(0, armButtonPressed);
    armButtonState = armButtonPressed;

    if (armButtonPressed) {
      armLedState = !armLedState;
    }
  }

  if (armLedState != lastArmLedState){
    if (!armLedState) {
      digitalWrite(D2, HIGH);
      digitalWrite(D3, LOW);
    } else {
      digitalWrite(D2, LOW);
      digitalWrite(D3, HIGH);
    }
    lastArmLedState = armLedState;
  }
}

void goButtonPress() {
  bool goButtonPressed = digitalRead(D6);
  if (goButtonPressed != goButtonState) {
    Joystick.setButton(1, goButtonPressed);
    goButtonState = goButtonPressed;

    if (goButtonPressed) {
      goLedState = !goLedState;
    }
  }

  if (goLedState != lastGoLedState){
    if (goLedState) {
      digitalWrite(D5, HIGH);
    } else {
      digitalWrite(D5, LOW);
    }
    lastGoLedState = goLedState;
  }
}


void loop() {
  armButtonPress();
  goButtonPress();
  delay(10);
}
