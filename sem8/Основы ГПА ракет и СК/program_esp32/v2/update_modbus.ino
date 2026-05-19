void updateValue_on_chanel(int chanel) // chanel = {0, 1, 2, 3}
{   
  int ch_volts = int(ads.computeVolts(data[chanel]) * 1000);       // напряжение в mV
  
  bool cur_loop_flag = bool( (ModbusData_Holding[0] >> (chanel*2 + 1)) & 1 );
  bool res_meas_flag = bool( (ModbusData_Holding[0] >> (chanel*2)    ) & 1 );
  // float koef_A = ModbusData_Holding[18 + chanel] // Я пока вижу обновление этих ходингов по отдельной функции,
  // float koef_t = ModbusData_Holding[22 + chanel] // в которой уже будут пересчитываться по верхним и нижним границам
  float koef_A = 2.5;
  float koef_t = 2.58;
  
  if (cur_loop_flag) {  // Режим токовой петли
    float ch_current = ch_volts / (120*1000);                     // ток [мкА]
    ModbusData_input[chanel]       = int(ch_current);   
    ModbusData_input[chanel*2 + 4] = int(ch_volts*koef_A/100000); // Давление на манометре [бар]
  }
  if (res_meas_flag) { // Режим шунта
    float ch_resistance = 4.7/(3.3 - ch_volts);                   // сопротивление [Ом]
    ModbusData_input[chanel] = int(ch_resistance);                
    ModbusData_input[chanel*2 + 5] = int(ch_resistance * koef_t); // Температура на датчике [°C]
  }

}

void eventTimeTriger2() {
  for (uint16_t i = 0; i < 4; i++){
    updateValue_on_chanel(i);
  }
}
