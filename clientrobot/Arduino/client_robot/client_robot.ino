#include <SeeedOLED.h>
#include <Servo.h>
#include <Wire.h>

Servo servo_av_bras_g;
Servo servo_bras_g;
Servo servo_poignet_g;
Servo servo_phalanges_g;

String tableau_id[16] = {
    "01000","01018","01036","01054","01072","01090","02000","02018","02036","02054","02072","02090","03000","03180","04000","04180"
};

int tableau_pos[16] = {
    0,18,36,54,72,90,0,18,36,54,72,90,0,180,0,180
};

int tableau_id_nb[16] = {
    1,1,1,1,1,1,2,2,2,2,2,2,3,3,4,4
};

String data = "NULL";
String previous_data = "NULL";
const int tableau_nb = 16;
int i;

void debug_oled(String oled_data, int oled_id_nb, int oled_pos) {
    SeeedOled.clearDisplay();
    SeeedOled.setTextXY(2, 0);
    SeeedOled.putString("ID ");
    SeeedOled.putNumber(oled_id_nb);
    SeeedOled.putString(" DATA ");
    char heya = oled_data[5];
    SeeedOled.putChar(heya);
    SeeedOled.setTextXY(4, 0);
    SeeedOled.putString("POS ");
    SeeedOled.putNumber(oled_pos);
}

void init_oled() {
    SeeedOled.setTextXY(2, 0);
    SeeedOled.putString("iMercy");
    SeeedOled.setTextXY(4, 0);
    SeeedOled.putString("Version 1.0");
    delay(500);
}

void setup() {
    Serial.begin(9600);
    Wire.begin();
    SeeedOled.init();

    servo_av_bras_g.attach(1);
    servo_bras_g.attach(2);
    servo_poignet_g.attach(3);
    servo_phalanges_g.attach(4);

    SeeedOled.clearDisplay();
    SeeedOled.setNormalDisplay();
    SeeedOled.setPageMode();
    
    init_oled();
}

void loop() {
  data = Serial.readString();
  SeeedOled.setTextXY(5, 0);
  SeeedOled.putString("EN ATTENTE...");

    if (previous_data == data){
        SeeedOled.setTextXY(6, 0);
        SeeedOled.putString("PREVIOUS EQUAL");
    } else {
        for (i = 0; i < tableau_nb; i++) {
            if (tableau_id[i] == data) {
                if (tableau_id_nb[i] == 1) {
                    servo_av_bras_g.write(tableau_pos[i]);
                    debug_oled(tableau_id[i], tableau_id_nb[i], tableau_pos[i]);
                } else if (tableau_id_nb[i] == 2){
                    servo_bras_g.write(tableau_pos[i]);
                    debug_oled(tableau_id[i], tableau_id_nb[i], tableau_pos[i]);
                } else if (tableau_id_nb[i] == 3) {
                    servo_poignet_g.write(tableau_pos[i]);
                    debug_oled(tableau_id[i], tableau_id_nb[i], tableau_pos[i]);
                } else if (tableau_id_nb[i] == 4) {
                    servo_phalanges_g.write(tableau_pos[i]);
                    debug_oled(tableau_id[i], tableau_id_nb[i], tableau_pos[i]);
                }
                delay(50);
                previous_data = data;
            } 
        }
    }
}
