let conjuntoDeObras;

//------CLASIFICADOR-----
let classifier;
let label;
const classModel = 'https://teachablemachine.withgoogle.com/models/9T5fcPtbU/'; //url del modelo producido con Teachable Machine

//---SONIDO CONFIG------------------------------------------------------------------------------------------------
let AMP_MAX= 0.1;
let AMP_MIN= 0.01;

//ENTRADA DE AUDIO
let mic;

//AMPLITUD
let amp;
let haySonido = false;

let img;

//---SETUP CONFIG-----------------------------------------------------------------------------------------------
function setup() {
  
  createCanvas(windowHeight, windowHeight);
  img = loadImage('data/factura.jpg');
  this.conjuntoDeObras = new Conjunto(img);

  classifier.classify(gotResult);
  mic = new p5.AudioIn();
  mic.start();
  userStartAudio();
}

function draw() {
  background(0,200,100);
  //config sonido
  amp = mic.getLevel();
  haySonido = amp > AMP_MIN;

  this.conjuntoDeObras.dibujar();

  if( label == 'Shh'){
    this.conjuntoDeObras.expandirGrosor();
  }

  if (label == 'Silbido'){
    this.conjuntoDeObras.darColor();
  }

  if (label == 'Campanita'){
    this.conjuntoDeObras.cambioDeColores();
  }
  
  if (label == 'Aplauso'){
    this.conjuntoDeObras.cambiarDeEstado();
    label = 'Ruido de fondo';
  }
  
  
  this.conjuntoDeObras.quitarColor();
  
  text(label, width / 2, height / 2);
}


//--------CLASIFICADOR-------------------------------------------------------------------------------
function preload() {
  // Load SpeechCommands18w sound classifier model
  classifier = ml5.soundClassifier(classModel + 'model.json'); 
}

function gotResult(error, results) {
  // Display error in the console
  if (error) {
    console.error(error);
  }
  // The results are in an array ordered by confidence.
  //console.log(results);
  // Show the first label and confidence
  label = results[0].label;
}
