#define FirstIMUAddress 0x18
#define SecondIMUAddress 0x19

int16_t IntAccXFirst = 0,
        IntAccYFirst = 0,
        IntAccZFirst = 0,
        IntAccXSecond = 0,
        IntAccYSecond = 0,
        IntAccZSecond = 0,
        IntRegReadFirst = 0,
        IntRegReadSecond = 0;

float floatAccXmgAccu = 0,
      floatAccYmgAccu = 0,
      floatAccZmgAccu = 0,

      floatAccXmgRude = 0,
      floatAccYmgRude = 0,
      floatAccZmgRude = 0,

      floatConstToMg = 0,

      floatAccXnow = 0,
      floatAccYnow = 0,
      floatAccZnow = 0,
      floatAccXmax = 0,
      floatAccYmax = 0,
      floatAccZmax = 0;

long longLastUpdateTime = 0;

float floatTimeConstLine = 0.003, // частота среза сверху 333 Гц
      floatTimeConstFilt = 0.01, // частота среза снизу 0.143 Гц
      floatKoef = 0,
      floatFiltAccX = 0,
      floatFiltAccY = 0,
      floatFiltAccZ = 0;

void getValues() {

  IntRegReadFirst = MemsRegRead(0x29, FirstIMUAddress);
  IntAccXFirst = IntRegReadFirst << 8;
  IntRegReadFirst = MemsRegRead(0x28, FirstIMUAddress);
  IntAccXFirst = IntAccXFirst | IntRegReadFirst;

  IntAccXFirst = -IntAccXFirst;

  IntRegReadFirst = MemsRegRead(0x2b, FirstIMUAddress);
  IntAccYFirst = IntRegReadFirst << 8;
  IntRegReadFirst = MemsRegRead(0x2a, FirstIMUAddress);
  IntAccYFirst = IntAccYFirst | IntRegReadFirst;

  IntAccYFirst = -IntAccYFirst;

  IntRegReadFirst = MemsRegRead(0x2d, FirstIMUAddress);
  IntAccZFirst = IntRegReadFirst << 8;
  IntRegReadFirst = MemsRegRead(0x2c, FirstIMUAddress);
  IntAccZFirst = IntAccZFirst | IntRegReadFirst;

  IntAccZFirst = -IntAccZFirst;

  IntRegReadSecond = MemsRegRead(0x29, SecondIMUAddress);
  IntAccXSecond = IntRegReadSecond << 8;
  IntRegReadSecond = MemsRegRead(0x28, SecondIMUAddress);
  IntAccXSecond = IntAccXSecond | IntRegReadSecond;

  IntRegReadSecond = MemsRegRead(0x2b, SecondIMUAddress);
  IntAccYSecond = IntRegReadSecond << 8;
  IntRegReadSecond = MemsRegRead(0x2a, SecondIMUAddress);
  IntAccYSecond = IntAccYSecond | IntRegReadSecond;

  IntRegReadSecond = MemsRegRead(0x2d, SecondIMUAddress);
  IntAccZSecond = IntRegReadSecond << 8;
  IntRegReadSecond = MemsRegRead(0x2c, SecondIMUAddress);
  IntAccZSecond = IntAccZSecond | IntRegReadSecond;

  IntAccZSecond = -IntAccZSecond;

  // селекция акселерометра c максимальной точностью

  floatAccXmgAccu = IntAccXFirst * 0.06;
  floatAccYmgAccu = IntAccYFirst * 0.06;
  floatAccZmgAccu = IntAccZFirst * 0.06;
  floatAccXmgRude = IntAccXSecond * floatConstToMg;
  floatAccYmgRude = IntAccYSecond * floatConstToMg;
  floatAccZmgRude = IntAccZSecond * floatConstToMg;

  if ( floatAccXmgRude > 1800) {floatAccXmgAccu = floatAccXmgRude;}
  if ( floatAccYmgRude > 1800) {floatAccYmgAccu = floatAccYmgRude;}
  if ( floatAccZmgRude > 1800) {floatAccZmgAccu = floatAccZmgRude;}

  // линейный режим 

  if (auModbusData[14] == 0x01) { 
    updateLineValue(floatAccXmgAccu, floatAccYmgAccu, floatAccZmgAccu, defTimeTrigger1);
  }

  //режим вибродатчика

  if (auModbusData[14] == 0x02) {
      updateFiltValue(floatAccXmgAccu, floatAccYmgAccu, floatAccZmgAccu, defTimeTrigger1);
  }
  
  // обновляем регистр максимального значения 

  if ( abs(floatAccXnow) >= abs(floatAccXmax) ) {floatAccXmax = floatAccXnow;}
  if ( abs(floatAccYnow) >= abs(floatAccYmax) ) {floatAccYmax = floatAccYnow;}
  if ( abs(floatAccZnow) >= abs(floatAccZmax) ) {floatAccZmax = floatAccZnow;}

  auModbusData_input[3] = int(floatAccXmax);
  auModbusData_input[4] = int(floatAccYmax);
  auModbusData_input[5] = int(floatAccZmax);

  //проверка, что регистры с максимальным значением были считаны и обнуление при считывание 

  if ((slave.u16InputNumAccMaxRead > 0) and (slave.boolWriteMaxAccClear)) {

    floatAccXmax = 0;
    floatAccYmax = 0;
    floatAccZmax = 0;

    slave.u16InputNumAccMaxRead = 0;

  }

  // команда на обнуление максимальных значений 

  if (auModbusData[16] == 0x01) { 
    auModbusData[16] = 0x00;
    auModbusData_input[3] = 0x00;
    auModbusData_input[4] = 0x00;
    auModbusData_input[5] = 0x00;
    floatAccXmax = 0x00;
    floatAccYmax = 0x00;
    floatAccZmax = 0x00;
  }
}

void setup_mems(uint8_t IntSetup) {
  Wire2.begin();

  // Настройка первого акселерометра

  MemsRegWrite(0x20, FirstIMUAddress, 0b10010111); // настройки №1: 1600 Гц, выскоточный режим
  MemsRegWrite(0x23, FirstIMUAddress, 0b00001000); // настройки №2: 2 g

  // Настройка второго акселерометра

  MemsRegWrite(0x20, SecondIMUAddress, 0b10010111); // настройки №1: 1600 Гц, выскоточный режим
  if (IntSetup == 0x01) {                           
    MemsRegWrite(0x23, SecondIMUAddress, 0b00111000);// настройки №2: 16 g
    floatConstToMg = 0.73;
  } else{
    MemsRegWrite(0x23, SecondIMUAddress, 0b00101000);// настройки №2: 8 g
    floatConstToMg = 0.24;
  }
}

void eventTimeTriger1() {
  getValues();
}

uint8_t MemsRegRead (uint8_t IntRegAddress, uint8_t IntIMUAddress) {

  uint8_t IntReg = 0;

  Wire2.beginTransmission(IntIMUAddress);
  Wire2.write(IntRegAddress);
  Wire2.endTransmission(false);
  Wire2.requestFrom(IntIMUAddress, 1, true);
  IntReg = Wire2.read();

  return IntReg;
}

uint8_t MemsRegWrite (uint8_t IntRegAddress, uint8_t IntIMUAddress, uint8_t IntBitForWrite) {

  Wire2.beginTransmission(IntIMUAddress);
  Wire2.write(IntRegAddress);
  Wire2.write(IntBitForWrite);
  Wire2.endTransmission(true);
  
}

void updateFiltValue(float newValueAX, float newValueAY, float newValueAZ, long measureTime)  {

    // floatKoef = (measureTime-longLastUpdateTime) / floatTimeConstFilt / 1000000;
    floatKoef = measureTime / floatTimeConstFilt / 1000;

    floatFiltAccX = newValueAX * floatKoef + floatFiltAccX * (1-floatKoef);
    floatFiltAccY = newValueAY * floatKoef + floatFiltAccY * (1-floatKoef);
    floatFiltAccZ = newValueAZ * floatKoef + floatFiltAccZ * (1-floatKoef);

    // long longLastUpdateTime = measureTime;

    floatAccXnow = newValueAX - floatFiltAccX;
    auModbusData_input[0] = int(newValueAX - floatFiltAccX);
    floatAccYnow = newValueAY - floatFiltAccY;
    auModbusData_input[1] = int(newValueAY - floatFiltAccY);
    floatAccZnow = newValueAZ - floatFiltAccZ;
    auModbusData_input[2] = int(newValueAZ - floatFiltAccZ);
}

void updateLineValue(float newValueAX, float newValueAY, float newValueAZ, long measureTime)  {

    // floatKoef = (measureTime-longLastUpdateTime) / floatTimeConstLine / 1000000;
    floatKoef = measureTime / floatTimeConstLine / 1000;

    floatFiltAccX = newValueAX * floatKoef + floatFiltAccX * (1-floatKoef);
    floatFiltAccY = newValueAY * floatKoef + floatFiltAccY * (1-floatKoef);
    floatFiltAccZ = newValueAZ * floatKoef + floatFiltAccZ * (1-floatKoef);

    // long longLastUpdateTime = measureTime;

    floatAccXnow = floatFiltAccX;
    auModbusData_input[0] = int(floatFiltAccX);
    floatAccYnow = floatFiltAccY;
    auModbusData_input[1] = int(floatFiltAccY);
    floatAccZnow = floatFiltAccZ;
    auModbusData_input[2] = int(floatFiltAccZ); 
}

