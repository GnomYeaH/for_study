// Вручную определите регистры Flash (если заголовочный файл не подключён)
#define FLASH_BASE      0x40022000
#define FLASH_ACR       *(volatile uint32_t*)(FLASH_BASE + 0x00)
#define FLASH_KEYR      *(volatile uint32_t*)(FLASH_BASE + 0x04)
#define FLASH_OPTKEYR   *(volatile uint32_t*)(FLASH_BASE + 0x08)
#define FLASH_SR        *(volatile uint32_t*)(FLASH_BASE + 0x0C)
#define FLASH_CR        *(volatile uint32_t*)(FLASH_BASE + 0x10)
#define FLASH_AR        *(volatile uint32_t*)(FLASH_BASE + 0x14)

// Биты регистра FLASH_CR
#define FLASH_CR_PG     (1 << 0)
#define FLASH_CR_PER    (1 << 1)
#define FLASH_CR_STRT   (1 << 6)
#define FLASH_CR_LOCK   (1 << 7)

// Биты регистра FLASH_SR
#define FLASH_SR_BSY    (1 << 0)

#define FLASH_TARGET_ADDR 0x0800F000

void Flash_Unlock() {
    FLASH_KEYR = 0x45670123;  // Первый ключ
    FLASH_KEYR = 0xCDEF89AB;  // Второй ключ
}

void Flash_Lock() {
    FLASH_CR |= FLASH_CR_LOCK;
}

void Flash_ErasePage(uint32_t addr) {
    while (FLASH_SR & FLASH_SR_BSY);  // Ждём завершения операций
    FLASH_CR |= FLASH_CR_PER;         // Режим стирания страницы
    FLASH_AR = addr;                  // Адрес страницы
    FLASH_CR |= FLASH_CR_STRT;        // Запуск стирания
    while (FLASH_SR & FLASH_SR_BSY);  // Ожидание завершения
    FLASH_CR &= ~FLASH_CR_PER;        // Сброс режима стирания
}

void Flash_WriteHalfWord(uint32_t addr, uint16_t data) {
    while (FLASH_SR & FLASH_SR_BSY);  // Ждём завершения операций
    FLASH_CR |= FLASH_CR_PG;          // Режим программирования
    *(__IO uint16_t*)addr = data;     // Запись данных
    while (FLASH_SR & FLASH_SR_BSY);  // Ожидание завершения
    FLASH_CR &= ~FLASH_CR_PG;         // Сброс режима программирования
}

void Flash_save_settings() {
  Flash_Unlock();
  Flash_ErasePage(FLASH_TARGET_ADDR);

  Flash_WriteHalfWord(FLASH_TARGET_ADDR , auModbusData[10]);
  Flash_WriteHalfWord(FLASH_TARGET_ADDR + 4, auModbusData[11]);
  Flash_WriteHalfWord(FLASH_TARGET_ADDR + 8, auModbusData[12]);
  Flash_WriteHalfWord(FLASH_TARGET_ADDR + 12, auModbusData[13]);
  Flash_WriteHalfWord(FLASH_TARGET_ADDR + 16, 0x00);

  Flash_Lock();
}