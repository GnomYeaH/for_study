#include <ModbusRtuMod.h>
#include <Adafruit_ADS1X15.h>

#define defTimeTrigger1 10
#define defTimeTrigger2 10
#define defTimeTrigger3 333

#define cur_loop_0 32
#define cur_loop_1 33
#define cur_loop_2 25
#define cur_loop_3 26

#define res_meas_0 27
#define res_meas_1 14
#define res_meas_2 13
#define res_meas_3 18

#define PinLed 16

constexpr int cur_loop[4] = {cur_loop_0, cur_loop_1, cur_loop_2, cur_loop_3};
constexpr int res_meas[4] = {res_meas_0, res_meas_1, res_meas_2, res_meas_3};

uint16_t ModbusData_Holding[26];
uint16_t ModbusData_input[12];

bool BoolLedFlag = false;

// void eventTimeTriger2();

long  longTimer1 = 0,
      longTimer2 = 0,
      longTimer3 = 0,
      longTimeout = 0;

int data[4];

Adafruit_ADS1015 ads; /* Use this for the 12-bit version */
Modbus slave(1, Serial, 1);

void setup() {

  Serial.begin(115200);

  slave.start();

  ads.setGain(GAIN_ONE);        // 1x gain   +/- 4.096V  1 bit = 2mV
  ads.begin();

  // if (!ads.begin()) {
  //   Serial.println("Failed to initialize ADS.");
  //   while(1);
  // }

  for(auto i: cur_loop){
    pinMode(i, OUTPUT);
  }

  for(auto i: res_meas){
    pinMode(i, OUTPUT);
  }

  pinMode(PinLed, OUTPUT);
  
}


void loop() {

  if ( (millis() - longTimer1) >= defTimeTrigger1 )  {  // цикл опроса датчиков 
    longTimer1 = millis();
    eventTimeTriger1();
  }

  if ( (millis() - longTimer2) >= defTimeTrigger2 )  {  //  обновление мотбаса и вычисление
    longTimer2 = millis();
    eventTimeTriger2();
  }

  if ( (millis() - longTimer3) >= defTimeTrigger3 )  {  // цикл отладочных миганий
    longTimer3 = millis();
    eventTimeTriger3();
  }

  slave.poll(ModbusData_Holding, 26, ModbusData_input, 12);

}