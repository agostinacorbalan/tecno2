/* TP#2: "Guardian Garden"
   Corbalan, Agostina -91301/2
   Sosa, Camila -
   Alonso, Mayra -
   Rodas, Juan -
*/
import fisica.*;

FWorld mundo;
FMouseJoint cadena;
FCircle[] calabazas;
FCircle bruja;
FCircle pala;
FBox huerta;

int contador = 3;
boolean puedenAparecerCalabazas = false;
int empiezaElTiempo;
PImage imagenCalabaza, imagenPala, imagenBruja;
float vidaDeLaHuerta = 100;
float vidaDeLaBruja = 100;
boolean estaJugando = false;

int cuantasCalabazasGolpeanAlabruja;

// Estados del juego
final int Inicio = 0;
final int Juego = 1;
final int Perder = 2;
final int Ganar = 3;

int estadoJuego = Inicio; // Estado inicial 

void setup() {
  size(900, 600);
  Fisica.init(this);
  mundo = new FWorld();
  mundo.setEdges();

  imagenCalabaza = loadImage("calabaza.png");
  imagenPala = loadImage("pala.png");
  imagenBruja = loadImage("bruja.png");

  empiezaElTiempo = millis();

  dibujarPala();
  dibujarBruja();
  dibujarHuerta();

  calabazas = new FCircle[100];
}

void draw() {
  background(0);

  switch (estadoJuego) {
    case Inicio:
      pantallaInicio();
      break;

    case Juego:
      pantallaJuego();
      break;

    case Perder:
      pantallaPerdida();
      break;

    case Ganar:
      pantallaGanar();
      break;
  }
}

void contactStarted(FContact contact) {
  FBody body1 = contact.getBody1();
  FBody body2 = contact.getBody2();

  // Verifica colisiones entre la bruja y las calabazas
  for (int i = 0; i < calabazas.length; i++) {
    if ((body1 == bruja && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == bruja)) {
      vidaDeLaBruja -= 50;
      mundo.remove(calabazas[i]);
      calabazas[i] = null;
      break;
    }
    if ((body1 == huerta && body2 == calabazas[i]) || (body1 == calabazas[i] && body2 == huerta)) {
      vidaDeLaHuerta -= 1;
      break;
    }
  }
}

void barraDeVida(float vida, float posX, float posY) {
  float tamX = 210;
  float tamY = 20;
  float posX_ = posX - tamX / 2;
  float posY_ = posY - tamY / 2;

  fill(200);
  rect(posX_, posY_, tamX, tamY);

  float porcentajeDeVida = map(vida, 0, 100, 0, tamX);
  fill(0, 255, 0);
  rect(posX_, posY_, porcentajeDeVida, tamY);
}

void dibujarBruja() {
  bruja = new FCircle(90);
  bruja.setPosition(100, 100);
  bruja.setStatic(true);
  bruja.setGrabbable(false);
  mundo.add(bruja);
}

void dibujarPala() {
  pala = new FCircle(30);
  pala.setPosition(width / 2, height / 2);
  mundo.add(pala);
  cadena = new FMouseJoint(pala, width / 2, height / 2);
  mundo.add(cadena);
}

void dibujarHuerta() {
  huerta = new FBox(width, 100);
  huerta.setPosition(width / 2, height - 50);
  huerta.setStatic(true);
  huerta.setGrabbable(false);
  mundo.add(huerta);
}

void dibujarCalabazas() {
  int tiempoTranscurrido = (millis() - empiezaElTiempo) / 1000;
  int tiempoRestante = max(0, contador - tiempoTranscurrido);

  if (estaJugando) {
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
  } else {
    for (int i = 0; i < calabazas.length; i++) {
      mundo.remove(calabazas[i]);
    }
  }
}

void aumentaDificultad() {
  if (vidaDeLaBruja <= 100 && vidaDeLaBruja >= 60) {
    contador = 3;
  }
  if (vidaDeLaBruja <= 50 && vidaDeLaBruja >= 30) {
    contador = 2;
  }
  if (vidaDeLaBruja < 30) {
    contador = 1;
  }
}

void gardenGuardian() {
  dibujarCalabazas();
  cadena.setTarget(mouseX, mouseY);
  barraDeVida(vidaDeLaBruja, 150, 20);
  barraDeVida(vidaDeLaHuerta, width / 2, height - 30);
  aumentaDificultad();
}

void pantallaInicio() {
  fill(255,0,0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("Garden Guardian", width / 2, height / 2 - 50);
  textSize(20);
  text("Haz clic para empezar e \n intenta que la bruja no arrase con tu huerta. ¡Suerte!", width / 2, height / 2 + 50);
}

void pantallaJuego() {
  
      mundo.step();
      mundo.draw();
      
  if (!estaJugando) {
    estaJugando = true;
    empiezaElTiempo = millis();
  }
  gardenGuardian();

  if (vidaDeLaBruja <= 0) {
    estadoJuego = Ganar;
  }
  if (vidaDeLaHuerta <= 0) {
    estadoJuego = Perder;
  }
}

void pantallaPerdida() {
  fill(255, 0, 0);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("¡Perdiste!\n La bruja arruino tu huerta :(", width / 2, height / 2 - 50);
  textSize(20);
  text("Presiona 'R' para reiniciar", width / 2, height / 2 + 50);
}

void pantallaGanar() {
  fill(0, 255, 0);
  textSize(30);
  textAlign(CENTER, CENTER);
  text("¡Ganaste! \n Sos un experto en calabazas magicas :)", width / 2, height / 2 - 50);
  textSize(20);
  text("Presiona 'R' para reiniciar", width / 2, height / 2 + 50);
}

void mousePressed() {
  if (estadoJuego == Inicio) {
    estadoJuego = Juego;
  }
}

void keyPressed() {
  // Reiniciar el juego cuando se presiona la tecla "R"
  if ((estadoJuego == Perder || estadoJuego == Ganar) && (key == 'r' || key == 'R')) {
    reiniciarJuego();
  }
}

void reiniciarJuego() {
  vidaDeLaHuerta = 100;
  vidaDeLaBruja = 100;
  estaJugando = false;
  estadoJuego = Inicio;
  cuantasCalabazasGolpeanAlabruja = 0;
  for (int i = 0; i < calabazas.length; i++) {
    if (calabazas[i] != null) {
      mundo.remove(calabazas[i]);
      calabazas[i] = null;
    }
  }
  dibujarPala();
  dibujarBruja();
  dibujarHuerta();
}
