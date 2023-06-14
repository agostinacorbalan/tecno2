let conjuntoDeCirculos;

//------CLASIFICADOR-----
let classifier;
let label;
const classModel = 'https://teachablemachine.withgoogle.com/models/K7u4qibed/'; //url del modelo producido con Teachable Machine

//---SONIDO CONFIG------------------------------------------------------------------------------------------------
let AMP_MAX= 0.1;
let AMP_MIN= 0.01;

//ENTRADA DE AUDIO
let mic;

//AMPLITUD
let amp;
let haySonido = false;


//---SETUP CONFIG-----------------------------------------------------------------------------------------------
function setup() {

  createCanvas(windowHeight, windowHeight);
  this.conjuntoDeCirculos = new Conjunto();

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

  this.conjuntoDeCirculos.dibujar();

  if( label == 'Shh'){
    this.conjuntoDeCirculos.expandirGrosor();
  }

  if (label == 'Aplauso'){
    this.conjuntoDeCirculos.darColor();
  }
  
  this.conjuntoDeCirculos.quitarColor();
  
  //text(label, width / 2, height / 2);
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
