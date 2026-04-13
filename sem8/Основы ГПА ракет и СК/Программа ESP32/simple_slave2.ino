#include <Wire.h>
#include <ModbusRtu.h>
#include <>


#define cur_loop_0 32
#define cur_loop_1 33
#define cur_loop_2 25
#define cur_loop_3 26

#define res_meas_0 27
#define res_meas_1 14
#define res_meas_2 25
#define res_meas_3 26


uint16_t ModbusData_Holding[26] = 0;
uint16_t ModbusData_input[12] = 0;

Modbus slave(1, Serial, 1);


void setup() {

  Serial.begin(115200);

  slave.start();
  Wire.begin();

  uint16_t config = 0x84C3;
  Wire.beginTransmission(ADS1015_ADDR);
  Wire.write(0x01);
  Wire.write(config >> 8);
  Wire.write(config & 0xFF);
  Wire.endTransmission();
  delay(10)

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

  Wire.beginTransmission(ADS1015_ADDR);
  Wire.write(0x00);
  Wire.endTransmission();
  Wire.requestFrom(ADS1015_ADDR, 2);

  if (Wire.available() >= 2) {
    uint16_t raw = (Wire.read() << 8) | Wire.read();
    int16_t value = (int16_t)raw >> 4; 
    float voltage = value * 0.002;     
    Serial.println(voltage, 3);
  }


  slave.poll(ModbusData_Holding, 26, ModbusData_input, 12);

}
