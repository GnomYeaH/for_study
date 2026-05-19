void ReadADC() {
    for(uint16_t i = 0; i < 4; i++){
        data[i] = ads.readADC_SingleEnded(i);
    }
}
void eventTimeTriger1() { 
    ReadADC(); 
}