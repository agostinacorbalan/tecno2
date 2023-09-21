PFont texto, titulo;

void pantalla() {
  texto = createFont("fuente.vlw", 10);
 // titulo = createFont ("littlewitch.ttf", 15);
}

void pantallaDibujar(color colorDeLetra, int tamFuente1, String texto1, String texto2 ) {
  pushMatrix();
  textAlign(CENTER, CENTER);
  fill(colorDeLetra);
  textSize(tamFuente1);
  textFont(texto);
  text(texto1, width / 2, height / 2 - 150);
  textSize(width/30);
 // textFont(titulo);
  text(texto2, width / 2, height / 2);
  popMatrix();
}
