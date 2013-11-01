#include <IRremote.h>

int RECV_PIN = 2; // 使用數位腳位2接收紅外線訊號
IRrecv irrecv(RECV_PIN); // 初始化紅外線訊號輸入
decode_results results; // 儲存訊號的結構

void setup()
{
  Serial.begin(9600);
  irrecv.blink13(true); // 設為true的話，當收到訊號時，腳位13的LED便會閃爍
  irrecv.enableIRIn(); // 啟動接收
}

void loop() {
  if (irrecv.decode(&results)) { // 接收紅外線訊號並解碼
    if(results.value==0xFF02FD){
      Serial.print("<");
    }else if(results.value==0xFFC23D){
      Serial.print(">");
    }else if(results.value==0xFFA857){
      Serial.print("-");
    }else if(results.value==0xFF906F){
      Serial.print("+");
    }else if(results.value==0xFFA25D){
      Serial.print("E");
    }else if(results.value==0xFF6897){
      Serial.print("0");
    }else if(results.value==0xFF30CF){
      Serial.print("1");
    }else if(results.value==0xFF18E7){
      Serial.print("2");
    }else if(results.value==0xFF7A85){
      Serial.print("3");
    }else if(results.value==0xFF10EF){
      Serial.print("4");
    }else if(results.value==0xFF38C7){
      Serial.print("5");
    }else if(results.value==0xFF5AA5){
      Serial.print("6");
    }else if(results.value==0xFF42BD){
      Serial.print("7");
    }else if(results.value==0xFF4AB5){
      Serial.print("8");
    }else if(results.value==0xFF52AD){
      Serial.print("9");
    }else if(results.value==0xFFFFFFFF){
      Serial.print("R");
    }else{
      Serial.print("N");
    }
    irrecv.resume(); // 準備接收下一個訊號
  }
}


