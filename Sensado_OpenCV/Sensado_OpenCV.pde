Camara camara;
openCVd open;

void setup() {
  size(640, 480);
  background(0);

  camara = new Camara(this);
  open = new openCVd(this, "C:/Users/Julia/Documents/GitHub/InterfacezNoTactiles/detector_openCV/Hand.Cascade.1.xml");

}
void draw() {
  camara.mostrarFeed();
  open.medicion(camara.enviarFeed());
  println(frameRate);
}

void keyPressed() {
  camara.filtros();
}
