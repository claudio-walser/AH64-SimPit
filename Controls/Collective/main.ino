void setup()   {
  pinMode(0, INPUT_PULLUP);
  pinMode(1, INPUT_PULLUP);
}
void loop()
{

  int pitch = analogRead(0);
  Joystick.X(pitch);

  int thrust = analogRead(1);
  Joystick.Y(thrust);

  delay(200);
}