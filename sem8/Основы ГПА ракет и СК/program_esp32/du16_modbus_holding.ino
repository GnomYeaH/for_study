#include <Wire.h>
#include <ModbusRtuMod.h>

#define TXEN PA8

#define defTimeTrigger1 1
#define defTimeTrigger2 1000
#define defTimeTrigger3 50

#define defRedLed PC15
#define defBlueLed PC14
#define defGreenLed PC13

#define defTechSlavePin PA3

uint16_t auModbusData[17] = {
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00};

uint16_t auModbusData_input[8] = {
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01};

typedef enum {
  Setup,            // Ожидание настройки, синий: 0.5 c горит, 1 с период
  Work,             // Стандартный режим и измерения идут, зелёный: 50 мc горит, 5 с период
  NoMeasurements,   // Стандартный режим и измерения не идут, голубой: 50 мc горит, 5 с период
  NoTransfer,       // нет обемна 10 сек, красный: 50 мc горит, 5 с период
  Error             // ошибка, красный: 0.5 c горит, 1 с период
} LedState;

Modbus slave(1,Serial1,TXEN);

/*

имя регистра | адрес |   тип   | Число байт | описание
X_NOW	       | 0x00  |  input  |      2     |Мгновенное значение ускорения по оси X 
Y_NOW	       | 0x01  |  input  |      2     |Мгновенное значение ускорения по оси Y 
Z_NOW        | 0x02  |  input  |      2     |Мгновенное значение ускорения по оси Z 
X_ACCUM      | 0x03  |  input  |      2     |Накопленное наибольшее амплитудное значение ускорения по оси X. 
X_ACCUM      | 0x04  |  input  |      2     |Накопленное наибольшее амплитудное значение ускорения по оси Y. 
X_ACCUM      | 0x05  |  input  |      2     |Накопленное наибольшее амплитудное значение ускорения по оси Z. 
SW_VER_L     | 0x06  |  input  |      2     |Версия программного обеспечения
SW_VER_H     | 0x07  |  input  |      2     |        акселерометра.
ACCUM_R      | 0x16  | holding |      1     |Записать 0x01 для сброса накопленного амплитудного значения в ноль по всем осям.

SLAVE_ADDR   | 0x10  | holding |      1     |Адрес slave для штатной работы (по умолчанию 0x01)
SLAVE_SPEED  | 0x11  | holding |      1     |Определяет скорость передачи данных для штатной работы. (по умолчанию 0x04) 
SLAVE_PARITY | 0x12  | holding |      1     |Чётность обмена данными для штатной работы: 0x00 - нет, 0x01 - чётный (по умолчанию 0x00) 
RANGE        | 0x13  | holding |      1     |Определяет диапазон измерения амплитуды ускорения: 0x00 - 8g, 0x01 - 16g (по умолчанию 0x00) 
MEASURE_MODE | 0x14  | holding |      1     |Определяет режим измерения ускорения: 0x00 - измерение не производится, 0x01 - линейный режим, 0x02 - режиме виброускорений (по умолчанию 0x00) 
RESET        | 0x15  | holding |      1     |Записать 0xE4 для сброса всех параметров до заводских настроек (по умолчанию 0x00) 

TODO:
-добавить перевод в попугаи на выходе
-добавить защиту от зависаний
-отладка работы i2c
-защита от записи в регистры значений которые ничего не делают
-добавить возможность выводить данные как в попугаях так и в милли G

*/

#define FLASH_TARGET_ADDR 0x0800F000

long IntBand = 115200;

uint8_t intLedCounter = 0;

long  longTimer1 = 0,
      longTimer2 = 0,
      longTimer3 = 0,
      longTimeout = 0;


bool boolTechSlaveMod = false;

LedState State;

TwoWire Wire2(2);

void setup() {

  pinMode(defRedLed, OUTPUT); 
  digitalWrite(defRedLed, 0);

  pinMode(defBlueLed, OUTPUT);
  digitalWrite(defBlueLed, 0);

  pinMode(defGreenLed, OUTPUT);
  digitalWrite(defGreenLed, 0);

  pinMode(defTechSlavePin, INPUT);

  Serial1.begin(IntBand);
  while(!Serial1);
  slave.start();
  delay(500);
  

  auModbusData[10] = *(uint16_t*)(FLASH_TARGET_ADDR);
  auModbusData[11] = *(uint16_t*)(FLASH_TARGET_ADDR + 4);
  auModbusData[12] = *(uint16_t*)(FLASH_TARGET_ADDR + 8);
  auModbusData[13] = *(uint16_t*)(FLASH_TARGET_ADDR + 12);

  if (*(uint16_t*)(FLASH_TARGET_ADDR + 16) == 0xffff) {

    for (uint8_t i = 0; i < 16; i++) {
      auModbusData[i] = 0;
    }
    auModbusData[11] = 0x04;
    auModbusData[10] = 0x01;

  State = Setup;

  }

  serialModbusAccUpdate( auModbusData[10], auModbusData[11], auModbusData[12], auModbusData[13] );

}


void loop() {

  if ( (millis() - longTimer1) >= defTimeTrigger1 )  {  // цикл опроса датчиков и вычисления 
    longTimer1 = millis();
    if ( !digitalRead(defTechSlavePin) ) {eventTimeTriger1();}
  }

  if ( (millis() - longTimer2) >= defTimeTrigger2 )  {  // переключения режимов датчика
    longTimer2 = millis();
    eventTimeTriger2();
  }

  if ( (millis() - longTimer3) >= defTimeTrigger3 )  {  //цикл отладочных миганий
    longTimer3 = millis();
    eventTimeTriger3();
  }

  slave.poll( auModbusData, 17, auModbusData_input, 8);
}