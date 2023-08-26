/* TP#2: "Guardian Garden"
   Corbalan, Agostina -91301/2
   Sosa, Camila -
   Alonso, Mayra -
   Rodas, Juan -
*/

Pantallas pantallas;

int Pantalla;

void setup (){
  size (800,800);
  pantallas = new Pantallas();
  
  //mp3 =
}

void draw(){
  if (Pantalla == 0){
  pantallas.PantallaInicio();
  } else if (Pantalla == 1){
    pantallas.PantallaJuego();
    //etc etc
  } else if ( Pantalla == 2){ // Reinicio();
    pantallas.PantallaCreditos();
   }
  }
  
  void mousePressed(){
    if (Pantalla == 0){
      Pantalla = 1;
    }
  }
  
   void keyPressed(){
    if (Pantalla == 1){
      Pantalla = 2;
    }
  }
  
  /* void Reinicio(){
    if (Pantalla == 2 && key == ' '){
      Pantalla = 0;
    }
  } */
