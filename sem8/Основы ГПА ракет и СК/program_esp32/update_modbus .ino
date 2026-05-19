void updateValue_on_chanel(int chanel) // chanel = {0, 1, 2, 3}
{ 
  bool cur_loop_flag = bool( (ModbusData_Holding[0] >> (chanel*2 + 1)) & 1 );
  bool res_meas_flag = bool( (ModbusData_Holding[0] >> (chanel*2)    ) & 1 );

  digitalWrite(cur_loop[chanel], cur_loop_flag);    // Запись состояния канала из холднига
  digitalWrite(res_meas[chanel], res_meas_flag);

  float ch_volts = ads.computeVolts(data[chanel]);        // напряжение на ADS1015 [В]
  float ch_current = int(1000000*ch_volts / 118.9);       // ток [mА]
  float ch_resistance = (120*ch_volts)/(3.3 - ch_volts);  // сопротивление [Ом]

  if (cur_loop_flag) {  // Режим токовой петли cur_loop_flag
    ModbusData_input[chanel]       = int(ch_current);
    ModbusData_input[chanel*2 + 4] = int(0.025*ch_current - 100); // Давление на манометре [бар]
  }
  if (res_meas_flag) { // Режим подтяжки res_meas_flag
    if (ch_resistance < 64000){
      ModbusData_input[chanel] = int(ch_resistance * 100);
      ModbusData_input[chanel*2 + 5] = int((ch_resistance - 100) * 25.777); // Температура на датчике [°C]
    }
    else { // Максимальное значение температуры! Выход за пределы измерения
      ModbusData_input[chanel] = 64000*100;
      ModbusData_input[chanel*2 + 5] = int((64000 - 100) * 25.777);
    }
  }
  else {
    ModbusData_input[chanel] = int(ch_volts * 1000); // напряжение на ADS1015 [мВ]
  }
}

void calc_HPA() 
{
  // Константы для расчетов
  const float T_st = 288.15f;   // [К]
  const float p_st = 101325.0f; // [Па]
  const float f_st = 1.054f;    // [kgf/m^3]

  // Подсчет кол-ва датчиков
  int cur_loop_num;
  int res_meas_num;
  for (uint16_t i = 0; i < 4; i++){
    cur_loop_num += int( (ModbusData_Holding[0] >> (i*2 + 1)) & 1 );
    res_meas_num += int( (ModbusData_Holding[0] >> (i*2)    ) & 1 );
  }

  // Температура [°C] баллонов, считываем с каналов как ср. арифметическое
  float avg_t = ( ModbusData_input[5] + ModbusData_input[7] + ModbusData_input[9] + ModbusData_input[11] ) / res_meas_num;
  // Давление [бар] аналогично
  float avg_pU_end = ( ModbusData_input[4] + ModbusData_input[6] + ModbusData_input[8] + ModbusData_input[10] ) * 100000 / cur_loop_num;
  float avg_pU = int( ModbusData_Holding[3] );

  // Гидравлический объем системы
  float system_volume = float( ModbusData_Holding[6] ) * int( ModbusData_Holding[7] ); 

  // Расчет
  float avg_T = avg_t + 273.15f;
  float kV_lin     = (avg_pU / p_st) * (T_st / avg_T);
  float kV_end_lin = (avg_pU_end / p_st) * (T_st / avg_T);
  float kV         = kV_lin / (1.0f + kV_lin / 2055.0f);
  float kV_end     = kV_end_lin / (1.0f + kV_end_lin / 2055.0f);

  // Результат
  float V_st = (kV - kV_end) * system_volume;
  // float p_poln = 150.0f * (avg_T/293.15f);
  float Fsum = f_st * V_st;

  // Запись в холдинги
  ModbusData_Holding[4] = int( V_st ); // Объем гелия в системе 
  ModbusData_Holding[5] = int( Fsum ); // Подъемная сила
  // ModbusData_Holding[] = int( p_poln ); // Давление в полной системе
}

void eventTimeTriger2() 
{
  for (uint16_t i = 0; i < 4; i++){
    updateValue_on_chanel(i);
  }
  // Мб лучше в void setup() закинуть?
  if (ModbusData_Holding[2] == 0x01){
    ModbusData_Holding[3] = ModbusData_input[4];  
    ModbusData_Holding[2] = 0;
  }
  calc_HPA();
}
