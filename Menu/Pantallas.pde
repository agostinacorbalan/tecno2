class Pantallas {
  
  void PantallaInicio(){
    background (0);
    text ( "Click para empezar", width/4, height/2+20);
    text ("INSTRUCCIONES: \n Usa WASD para jugar", width/2-25, height/2);
    textSize(15);
   
    push();
    fill (255,0,0);
    textSize(60);
    text ( "GARDEN GUARDIAN", width/6, height/3);
    pop();
    
  }
  
  void PantallaJuego(){
    background(100);
  }
  
  void PantallaCreditos(){
    background (0);
    fill(255, 0, 0);
    text ("CREDITOS:\n Programación: Camila Sosa y Agostina Corbalan \n Ilustración: Juan Rodas \n Sonido: Mayra Alonso", width/8, height/4);
    textSize(25);
 }
}
