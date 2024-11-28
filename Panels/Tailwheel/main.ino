#define DCSBIOS_DEFAULT_SERIAL
#define DCSBIOS_DISABLE_SERVO
#include <DcsBios.h>

DcsBios::LED pltCollectiveTailWheel(AH_64D_PLT_COLLECTIVE_TAIL_WHEEL_AM, D7);
DcsBios::Switch3Pos pltNvsMode("PLT_NVS_MODE", D3, D4);


void setup() {
  DcsBios::setup();
}

void loop() {
  DcsBios::loop();
}
