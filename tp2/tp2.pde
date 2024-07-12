//Camila Mantiñan 
//Tp 2 Comisión 2 

String homescape; 

PImage juegos;     // pantalla 1
PImage juegos1;    // pantalla 2
PImage juegos2;    // pantalla 3

float tamaño; 

int esqXInicio, esqYInicio;
int esqXReiniciar, esqYReiniciar;
int anchoBotonInicio = 200;
int altoBotonInicio = 60;

int anchoBotonReiniciar = 150;
int altoBotonReiniciar = 40;

PFont miFuente;  
boolean inicio = true;

void setup() {
  size(640, 480);
  textAlign(CENTER, CENTER);
  
  
  juegos = loadImage("homescape.jpg");
  juegos1 = loadImage("homescape1.jpeg");
  juegos2 = loadImage("homescape2.jpg");
  
 
  miFuente = loadFont("AgencyFB-Bold-55.vlw");
  
  textFont(miFuente);
  
  tamaño = 10;
  
  esqXInicio = width / 2 - anchoBotonInicio / 2;
  esqYInicio = height / 2 - altoBotonInicio / 2;
}

void draw() {
  background(0);
  
  if (inicio) {
    fill(150);
    rect(esqXInicio, esqYInicio, anchoBotonInicio, altoBotonInicio, 10); 
    fill(255);
    textSize(24);  
    text("INICIAR", width / 2, esqYInicio + altoBotonInicio / 2);
  } else {
    float tiempo = frameCount / 50.0; 
    
    // pantalla 0
    if (tiempo >= 0 && tiempo < 5) {
      homescape = "pantalla0";
      image(juegos, 0, 0, 640, 480);
      if (tamaño < 30) {
        tamaño += 0.06;
      }
      textSize(tamaño);
      fill(20);  
      text("Es un videojuego donde se combinan piezas", 320, 240);
    }
    
    // pantalla 1
    else if (tiempo >= 5 && tiempo < 10) {
      homescape = "pantalla1";
      image(juegos1, 0, 0, 640, 480);
      if (tamaño > 10) {
        tamaño -= 0.05;
      }
      textSize(tamaño);
      fill(20);
      text("Pasando los niveles se puede rediseñar una Antigua Mansión", 320, 240); 
    }
    
    // pantalla 2
    else if (tiempo >= 10) {
      homescape = "pantalla2";
      image(juegos2, 0, 0, 640, 480);
      if (tamaño < 20) {
        tamaño += 0.05;
      }
      textSize(tamaño);
      fill(20);
      
      float salto = sin(tiempo * 3) * 10; 
      text("Diviértete pasando distintos retos en el celular o computadora", 320, 240 + salto);
      
      // Botón reiniciar
      esqXReiniciar = width / 2 - anchoBotonReiniciar / 2;
      esqYReiniciar = height - altoBotonReiniciar - 50;  
      fill(150);
      rect(esqXReiniciar, esqYReiniciar, anchoBotonReiniciar, altoBotonReiniciar, 10);  
      fill(255);
      textSize(16);  
      text("REINICIAR", width / 2, esqYReiniciar + altoBotonReiniciar / 2);
    }
  }
}

void mousePressed() {
  if (inicio) {
    if (mouseX > esqXInicio && mouseX < esqXInicio + anchoBotonInicio && mouseY > esqYInicio && mouseY < esqYInicio + altoBotonInicio) {
      inicio = false;
      frameCount = 0; // Reiniciar el contador de frames
      tamaño = 10;    
    }
  } else if (homescape.equals("pantalla2")) {
    if (mouseX > esqXReiniciar && mouseX < esqXReiniciar + anchoBotonReiniciar && mouseY > esqYReiniciar && mouseY < esqYReiniciar + altoBotonReiniciar) {
      inicio = true; // Volver al estado inicial
      frameCount = 0;
      tamaño = 10; // Reiniciar tamaño del texto
    }
  }
}
