#include <ModbusRtu.h>
#include <Adafruit_ADS1X15.h>

#define defTimeTrigger1 1
#define defTimeTrigger2 1000
#define defTimeTrigger3 50

#define cur_loop_0 32
#define cur_loop_1 33
#define cur_loop_2 25
#define cur_loop_3 26

#define res_meas_0 27
#define res_meas_1 14
#define res_meas_2 13
#define res_meas_3 18

uint16_t ModbusData_Holding[26] = 0,
         ModbusData_input[12] = 0;

long  longTimer1 = 0,
      longTimer2 = 0,
      longTimer3 = 0,
      longTimeout = 0;


Adafruit_ADS1015 ads; /* Use this for the 12-bit version */
Modbus slave(1, Serial, 1);

void setup() {

  Serial.begin(115200);

  slave.start();

  ads.setGain(GAIN_ONE);        // 1x gain   +/- 4.096V  1 bit = 2mV

  if (!ads.begin()) {
    Serial.println("Failed to initialize ADS.");
    while(1);
  }

  pinMode(cur_loop_0, OUTPUT);
  pinMode(cur_loop_1, OUTPUT);
  pinMode(cur_loop_2, OUTPUT);
  pinMode(cur_loop_3, OUTPUT);

  pinMode(res_meas_0, OUTPUT);
  pinMode(res_meas_1, OUTPUT);
  pinMode(res_meas_2, OUTPUT);
  pinMode(res_meas_3, OUTPUT);

}


void loop() {

  if ( (millis() - longTimer1) >= defTimeTrigger1 )  {  // цикл опроса датчиков и вычисление
    longTimer1 = millis();
    eventTimeTriger1();
  }

  if ( (millis() - longTimer2) >= defTimeTrigger2 )  {  //  обновление мотбаса
    longTimer2 = millis();
    eventTimeTriger2();
  }

  if ( (millis() - longTimer3) >= defTimeTrigger3 )  {  // цикл отладочных миганий
    longTimer3 = millis();
    eventTimeTriger3();
  }

  slave.poll(ModbusData_Holding, 26, ModbusData_input, 12);

}