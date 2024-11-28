#define DCSBIOS_DEFAULT_SERIAL
#define DCSBIOS_DISABLE_SERVO
#include <DcsBios.h>

//DcsBios::ActionButton pltGroundOverrideBtnToggle("PLT_GROUND_OVERRIDE_BTN", "TOGGLE", D6);
DcsBios::LED pltGroundOverrideBtn(AH_64D_PLT_GROUND_OVERRIDE_BTN_AM, D5);

//DcsBios::ActionButton pltMasterArmBtnToggle("PLT_MASTER_ARM_BTN", "TOGGLE", D4);

void setup() {
  DcsBios::setup();
  Serial.begin(9600);
}

void loop() {
  DcsBios::loop();
  Serial.println("Hello DCS");
  Serial.println(digitalRead(D5));
  delay(500);
}

// #include <Joystick_ESP32S2.h>

// Joystick_ Joystick;

// bool armLedState = false;
// bool lastArmLedState = false;
// int armButtonState = 0;

// int goButtonState = 0;
// bool goLedState = false;
// bool lastGoLedState = false;

// void setup() {
//   // arm-panel safe led
//   pinMode(D2, OUTPUT);
//   // arm-panel arm led
//   pinMode(D3, OUTPUT);

//   // arm button
//   pinMode(D4, INPUT_PULLUP);

//   // go button
//   pinMode(D6, INPUT_PULLUP);

//   // led ground safe
//   pinMode(D5, OUTPUT);


//   // initial ARM Led State is yellow
//   digitalWrite(D2, HIGH);
//   digitalWrite(D3, LOW);

//   // initial Ground Override Led State is off
//   digitalWrite(D5, LOW);

//   Joystick.begin();
// }
// void armButtonPress() {
//   bool armButtonPressed = digitalRead(D4);
//   if (armButtonPressed != armButtonState) {
//     Joystick.setButton(0, armButtonPressed);
//     armButtonState = armButtonPressed;

//     if (armButtonPressed) {
//       armLedState = !armLedState;
//     }

//   }

//   if (armLedState != lastArmLedState){
//     if (!armLedState) {
//       digitalWrite(D2, HIGH);
//       digitalWrite(D3, LOW);
//     } else {
//       digitalWrite(D2, LOW);
//       digitalWrite(D3, HIGH);
//     }
//     lastArmLedState = armLedState;
//   }
// }

// void goButtonPress() {
//   bool goButtonPressed = digitalRead(D6);
//   if (goButtonPressed != goButtonState) {
//     Joystick.setButton(1, goButtonPressed);
//     goButtonState = goButtonPressed;

//     if (goButtonPressed) {
//       goLedState = !goLedState;
//     }
//   }

//   if (goLedState != lastGoLedState){
//     if (goLedState) {
//       digitalWrite(D5, HIGH);
//     } else {
//       digitalWrite(D5, LOW);
//     }
//     lastGoLedState = goLedState;
//   }
// }

// void loop() {
//   armButtonPress();
//   goButtonPress();
//   delay(40);
// }
