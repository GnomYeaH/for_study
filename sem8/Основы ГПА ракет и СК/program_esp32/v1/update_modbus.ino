void calculate(float *out, float koef_mkA, float koef_Om){

  for(uint16_t i = 0; i < 4; i++){
    out[i] = ads.computeVolts(data[i]);       // напряжение в mV
  }

  for(uint16_t i = 0; i < 4; i++){
    if (cur_loop[i]) {                        // Режим токовой петли
      out[i] /= (120.0*1000.0);               // ток в мкА
      out[i*2 + 4] = out[i]*koef_mkA/100000;  // Давление на манометре в барах
      out[i*2 + 5] = 0;                       // Температура на датчике (не работает в этом режиме)
    }
    else if (res_meas[i]) {                   // Режим шунта
      out[i] = 4.7/(3.3 - out[i]);            // сопротивление в Ом
      out[i*2 + 4] = 0;                       // Давление на манометре(не работает в этом режиме)
      out[i*2 + 5] = out[i]*2;                // Температура на датчике
    }
    else{                                     // Третий(нулевой) режим
      out[i*2 + 4] = 0;                       
      out[i*2 + 5] = 0;
    }

}

void updateValue(){ 
  
  float koef_pressure = 2.5;
  float koef_temperature = 2.58;

  float sensor_data[12];
  calculate(&sensor_data, koef_pressure, koef_temperature);

  for(uint16_t i = 0; i < 12; i++){
    ModbusData_input[i] = int(sensor_data[i]);
  }
  
}

void eventTimeTriger1() {
  updateValue(); 
}
