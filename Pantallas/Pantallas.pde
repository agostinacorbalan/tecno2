/* TP#2: "Guardian Garden"
   Corbalan, Agostina -91301/2
   Sosa, Camila -
   Alonso, Mayra -
   Rodas, Juan -
*/

import fisica.*;

FWorld mundo;// Instancia del mundo físico
FMouseJoint cadena;// Cadena para conectar la pala al mouse
FCircle[] calabazas;// Arreglo para almacenar las calabazas
FCircle bruja;// Bruja
FCircle pala; // Pala
FBox huerta; // huerta

int contador = 3;// Establece el tiempo total en segundos
boolean puedenAparecerCalabazas = false; // Controla si se pueden generar calabazas
int empiezaElTiempo;// Tiempo de inicio

PImage imagenCalabaza, imagenPala, imagenBruja;// Imágenes para elementos
String estado;
int vidaDeLaHuerta = 100;
int vidaDeLaBruja = 100;

// Estados del juego
final int PantallaInicio = 0;
final int PantallaJuego = 1;
final int PantallaFinal = 2;

int estadoJuego = PantallaInicio; // Estado inicial del juego

void setup() {
  size(900, 600);

  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();

  imagenCalabaza = loadImage("calabaza.png");
  imagenPala = loadImage("pala.png");
  imagenBruja = loadImage("bruja.png");

  empiezaElTiempo = millis();

  pala = new FCircle(30);
  pala.setPosition(width / 2, height / 2);
  mundo.add(pala);

  cadena = new FMouseJoint(pala, width / 2, height / 2);
  mundo.add(cadena);

  bruja = new FCircle(90);
  bruja.setPosition(100, 100);
  bruja.setStatic(true);
  bruja.setGrabbable(false);
  mundo.add(bruja);

  huerta = new FBox(width, 100);
  huerta.setPosition(width / 2, height - 50);
  huerta.setStatic(true);
  huerta.setGrabbable(false);
  mundo.add(huerta);

  calabazas = new FCircle[100];
}

void draw() {
  background(0);

  switch (estadoJuego) {
    case PantallaInicio:
    
      fill(255,0,0);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("GARDEN GUARDIAN", width / 2, height / 2 - 50);
      textSize(20);
      text("Haz clic para empezar", width / 2, height / 2 + 50);
      break;

    case PantallaJuego: // Dibuja la pantalla de juego
      
      mundo.step();
      mundo.draw();

      int tiempoTranscurrido = (millis() - empiezaElTiempo) / 1000;
      int tiempoRestante = max(0, contador - tiempoTranscurrido);

      if (tiempoRestante == 0) {
        empiezaElTiempo = millis();
        puedenAparecerCalabazas = true;
      } else {
        puedenAparecerCalabazas = false;
      }

      if (puedenAparecerCalabazas) {
        for (int i = 0; i < calabazas.length; i++) {
          if (calabazas[i] == null) {
            calabazas[i] = new FCircle(50);
            calabazas[i].setPosition(random(200, width - 100), -15);
            calabazas[i].setGrabbable(false);
            mundo.add(calabazas[i]);
            break;
          }
        }
      }

      cadena.setTarget(mouseX, mouseY);
      break;

    case PantallaFinal: // Dibuja la pantalla final
      
      fill(0);
      textSize(30);
      textAlign(CENTER, CENTER);
      text("Juego Terminado", width / 2, height / 2 - 50);
      textSize(20);
      text("Puntuación final: " + vidaDeLaHuerta, width / 2, height / 2 + 50);
      break;
  }
}

void contactStarted(FContact contact) {
  FBody body1 = contact.getBody1();
  FBody body2 = contact.getBody2();

  for (int i = 0; i < calabazas.length; i++) {
    if ((body1 == bruja && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == bruja)) {
      println("¡Una calabaza tocó a la bruja! Le queda " + vidaDeLaBruja + " de vida");
      vidaDeLaBruja -= 10;
      mundo.remove(calabazas[i]);
      calabazas[i] = null;
      break;
    }
    if ((body1 == huerta && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == huerta)) {
      println("¡Una calabaza rompió la huerta! Queda el %" + vidaDeLaHuerta + " de la huerta sana.");
      vidaDeLaHuerta -= 1;
      break;
    }
  }
}

void mouseClicked() {
  if (estadoJuego == PantallaInicio) {
    estadoJuego = PantallaJuego;
    empiezaElTiempo = millis();
  } else if (estadoJuego == PantallaFinal) {
    // Reiniciar el juego
    estadoJuego = PantallaInicio;
    vidaDeLaHuerta = 100;
    vidaDeLaBruja = 100;
  }
}
