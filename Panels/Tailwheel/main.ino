bool blinkState = false;  //true or false


void setup() {
  pinMode(D3, OUTPUT);
  pinMode(D6, INPUT);
  digitalWrite(D3, LOW);
  Serial.begin(9600);
}
void loop() {




  bool buttonPressed = digitalRead(D6);
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