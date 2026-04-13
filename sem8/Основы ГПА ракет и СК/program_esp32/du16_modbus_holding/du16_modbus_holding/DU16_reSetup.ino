void eventTimeTriger2() {

  if ( digitalRead(defTechSlavePin) ){

    serialModbusAccUpdate( 0x01, 0x00, 0x00, 0x00 );

    boolTechSlaveMod = true;

  } else {

    if ( boolTechSlaveMod ) { 

      serialModbusAccUpdate( auModbusData[10], auModbusData[11], auModbusData[12], auModbusData[13] );

      boolTechSlaveMod = false;

    }
  }

  if (slave.u16InputNumComWrite > 0){
    Flash_save_settings();
    serialModbusAccUpdate( auModbusData[10], auModbusData[11], auModbusData[12], auModbusData[13] );
    slave.u16InputNumComWrite = 0;
  }

  if (auModbusData[15] == 0xE4){
    for (uint8_t i = 0; i < 16; i++) {
      auModbusData[i] = 0;
    }
    auModbusData[11] = 0x04;
    auModbusData[10] = 0x01;

    Flash_save_settings();

    serialModbusAccUpdate( auModbusData[10], auModbusData[11], auModbusData[12], auModbusData[13] );
  }

}

void serialModbusAccUpdate ( uint16_t SLAVE_ADDR, uint16_t SLAVE_SPEED, uint16_t SLAVE_PARITY, uint16_t RANGE ) {
  
  switch(SLAVE_SPEED){
      case 0x00: IntBand = 9600; break;
      case 0x01: IntBand = 19200; break;
      case 0x02: IntBand = 38400; break;
      case 0x03: IntBand = 57600; break;
      case 0x04: IntBand = 115200; break;
    }

    slave.setID(SLAVE_ADDR);

    switch(SLAVE_PARITY){
      case 0x00:
        Serial1.end();
        Serial1.begin(IntBand,SERIAL_8N1);
        while(!Serial1);
        break;
      case 0x01:
        Serial1.end();
        Serial1.begin(IntBand,SERIAL_8E1);
        while(!Serial1);
      break;
     }
    
  setup_mems(RANGE);
}