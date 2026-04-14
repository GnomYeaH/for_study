void cal_chanel(int chanel) // chanel = {0, 1, 2, 3}
{ 
  int ch_volts = int(ads.computeVolts(data[chanel]) * 1000);       // напряжение в mV
  
  bool cur_loop_flag = bool( (ModbusData_Holding[0] >> (chanel*2 + 1)) & 1 );
  bool res_meas_flag = bool( (ModbusData_Holding[0] >> (chanel*2)    ) & 1 );
  // float koef_A = ModbusData_Holding[18 + chanel]
  // float koef_t = ModbusData_Holding[22 + chanel]
  float koef_A = 2.5;
  float koef_t = 2.58;
  
  if (cur_loop_flag) {  // Режим токовой петли
    float ch_current = ch_volts / (120*1000);                     // ток [мкА]
    ModbusData_input[chanel]       = int(ch_current);   
    ModbusData_input[chanel*2 + 4] = int(ch_volts*koef_A/100000); // Давление на манометре [бар]
    // ModbusData_input[chanel*2 + 5] = 0;                        // Температура на датчике (не работает в этом режиме)
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ <-Не имеет же смысл обновлять не использующийся номер?
  }
  if (res_meas_flag) { // Режим шунта
    float ch_resistance = 4.7/(3.3 - ch_volts);                   // сопротивление [Ом]
    ModbusData_input[chanel] = int(ch_resistance);                
    ModbusData_input[chanel*2 + 5] = int(ch_resistance * koef_t); // Температура на датчике [°C]
    // ModbusData_input[chanel*2 + 4] = 0;                        // Давление на манометре(не работает в этом режиме)
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ <-Не имеет же смысл обновлять не использующийся номер?
  }
  // else{                                     // Третий(нулевой) режим
  //   out[i*2 + 4] = 0;                       
  //   out[i*2 + 5] = 0;
  // }

}

void updateValue(){
  for(uint16_t i = 0; i < 4; i++){
    cal_chanel(i);
  }
}

// old code
void calculate(float *out, float koef_mkA, float koef_Om){

  for(uint16_t i = 0; i < 4; i++){
    ModbusData_input[i] = int(ads.computeVolts(data[i]) * 1000);       // напряжение в mV
  }

  bool cur_loop_flag[4];
  bool res_meas_flag[4];

  for(uint16_t i = 0; i < 4; i++){
    cur_loop_flag[i] = bool( (ModbusData_Holding[0] >> (i*2 + 1)) & 1 );
    res_meas_flag[i] = bool( (ModbusData_Holding[0] >> (i*2)    ) & 1 );
  }

  for(uint16_t i = 0; i < 4; i++){
    if (cur_loop_flag[i]) {                   // Режим токовой петли
      out[i] /= (120.0*1000.0);               // ток в мкА
      out[i*2 + 4] = out[i]*koef_mkA/100000;  // Давление на манометре0 в барах
      out[i*2 + 5] = 0;                       // Температура на датчике (не работает в этом режиме)
    }
    else if (res_meas_flag[i]) {              // Режим шунта
      out[i] = 4.7/(3.3 - out[i]);            // сопротивление в Ом
      out[i*2 + 4] = 0;                       // Давление на манометре(не работает в этом режиме)
      out[i*2 + 5] = out[i]*2;                // Температура на датчике
    }
    else{                                     // Третий(нулевой) режим
      out[i*2 + 4] = 0;                       
      out[i*2 + 5] = 0;
    }
  }

}

void updateValue(){
  
  float koef_pressure = 2.5;
  float koef_temperature = 2.58;

  float sensor_data[12];
  calculate(sensor_data, koef_pressure, koef_temperature);

  for(uint16_t i = 0; i < 12; i++){
    ModbusData_input[i] = int(sensor_data[i]);
  }
  
}