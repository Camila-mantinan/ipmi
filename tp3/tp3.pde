// Camila Mantiñan
// Comisión 2
// https://youtu.be/h4fEkv64tos

int numeros = 20;
color[] Colores;   
boolean reset = false;
boolean  drawNestedSquares = false; 
PImage OpArt;

void setup() {
  size(800, 400);
  background(255);
  noFill();
  iniciarColores();
  drawOpArt(numeros, Colores);
  OpArt = loadImage("OpArt.jpg");
}

void draw() {
  image(OpArt, 0, 0, 400, 400); // Mostrar la imagen a la izquierda
  
  if (reset) {
    reset = false;
    numeros = 20 
    ;
    background(255);
    iniciarColores();
    drawOpArt(numeros, Colores);
  }
  
 
  if ( drawNestedSquares) {
     drawNestedSquares(20,Colores);
  }
}

void iniciarColores() {
  Colores = new color[numeros];
  for (int i = 0; i < numeros; i++) {
    if (i % 2 == 0) {
      Colores[i] = color(0); 
    } else {
      Colores[i] = color(255); 
    }
  }
}

void drawOpArt(int numeros, color[] colores) {
  for (int i = 0; i < numeros; i++) {
    fill(colores[i]);
    noStroke();
    float side = map(i, 0, numeros, height, 10);
    rect(width * 3/4 - side / 2, height / 2 - side / 2, side, side);
  }
}

void drawNestedSquares(int numSquares, color[] colors) {
  for (int i = 0; i < numSquares; i++) {
    fill(colors[i]);
    noStroke();
    float side = map(i, 0, numSquares, height, 10);
    for (int j = 0; j < 5; j++) { 
      float x = width * 3/4 - side / 2 + j * 20;
      float y = height / 2 - side / 2 + j * 20;
      rect(x, y, side - j * 10, side - j * 10);
    }
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    reset = true;
     drawNestedSquares = false;
  } else if (key == 'g') {
    for (int i = 0; i < numeros; i++) {
      // Cambiar cada color a uno aleatorio
      Colores[i] = color(random(256), random(256), random(256));
    }
    background(255);
    drawOpArt(numeros, Colores);
  } else if (key == 'm') {
     drawNestedSquares = true; 
  }
}
