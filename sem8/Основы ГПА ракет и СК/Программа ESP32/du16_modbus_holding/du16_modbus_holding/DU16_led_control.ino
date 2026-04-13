
void eventTimeTriger3() {

  if (*(uint16_t*)(FLASH_TARGET_ADDR + 16) == 0xffff) {

  State = Setup;

  } else {

    if (auModbusData[14] == 0) {

      State = NoMeasurements;

    } else State = Work;

    if(slave.u16InputNumAccMaxRead > 0 ) {
      slave.u16InputNumAccMaxRead = 0;
      longTimeout = millis();
    }

    if ( (millis() - longTimeout) >= 9000) {
      State = NoTransfer;
    }

  } 

  intLedCounter += 1;

  switch (State) {

    case Setup:

      if (intLedCounter <= 10) digitalWrite(defBlueLed, 1);
      if (intLedCounter >= 10) digitalWrite(defBlueLed, 0);
      if (intLedCounter > 20) intLedCounter = 0;

      break;

    case Work:

      if (intLedCounter >= 99) digitalWrite(defGreenLed, 1);
      if (intLedCounter < 99) digitalWrite(defGreenLed, 0);
      if (intLedCounter > 100) intLedCounter = 0;

      break;

    case NoMeasurements:

      if (intLedCounter >= 99) digitalWrite(defBlueLed, 1);
      if (intLedCounter < 99) digitalWrite(defBlueLed, 0);
      if (intLedCounter > 100) intLedCounter = 0;

      break;

    case NoTransfer:

      if (intLedCounter >= 99) digitalWrite(defRedLed, 1);
      if (intLedCounter < 99) digitalWrite(defRedLed, 0);
      if (intLedCounter > 100) intLedCounter = 0;

      break;

    case Error:

      if (intLedCounter <= 10) digitalWrite(defRedLed, 1);
      if (intLedCounter >= 10) digitalWrite(defRedLed, 0);
      if (intLedCounter > 20) intLedCounter = 0;

      break;
  } 

}