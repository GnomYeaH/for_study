float ReadADC() {

    uint16_t adc0, adc1, adc2, adc3;
    float volts0, volts1, volts2, volts3;

    adc0 = ads.readADC_SingleEnded(0);
    adc1 = ads.readADC_SingleEnded(1);
    adc2 = ads.readADC_SingleEnded(2);
    adc3 = ads.readADC_SingleEnded(3);

    volts0 = ads.computeVolts(adc0);
    volts1 = ads.computeVolts(adc1);
    volts2 = ads.computeVolts(adc2);
    volts3 = ads.computeVolts(adc3);

    return volts0, volts1, volts2, volts3; 

}

void calculate(){

    float data0, data1, data2, data3 = ReadADC(); 

    // 1й канал
    if (cur_loop_0) { data0 /= 120.0;           }; // ток в режиме токовой петли
    if (res_meas_0) { data0 = 4.7/(3.3 - data0);}; // сопротивление в режиме шунта

    // 2й канал
    if (cur_loop_1) { data0 /= 120.0;           }; // ток в режиме токовой петли
    if (res_meas_1) { data0 = 4.7/(3.3 - data0);}; // сопротивление в режиме шунта

    // 3й канал
    if (cur_loop_2) { data0 /= 120.0;           }; // ток в режиме токовой петли
    if (res_meas_2) { data0 = 4.7/(3.3 - data0);}; // сопротивление в режиме шунта

    // 4й канал
    if (cur_loop_3) { data0 /= 120.0;           }; // ток в режиме токовой петли
    if (res_meas_4) { data0 = 4.7/(3.3 - data0);}; // сопротивление в режиме шунта
    
    ModbusData_input[0] = data0;
    ModbusData_input[1] = data1;
    ModbusData_input[2] = data2;
    ModbusData_input[3] = data3;

}s

void eventTimeTriger1() { 
    calculate(); 
}
