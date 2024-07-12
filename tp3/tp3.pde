// Camila Mantiñan
// Comisión 2
// https://youtu.be/KKdj-4440wQ

PImage circulos;
int cant = 20;
int tam;
float ellipseSize = 18;
boolean coloresalternativos1 = false;
boolean coloresalternativos2 = false;
boolean reset = false;
boolean coloresAleatorios = false;
color[][] muchoscolores;

void setup() {
  size(800, 400);
  circulos = loadImage("OpArt.jpg");
  tam = width / cant;
  muchoscolores = new color[cant][cant];
}

void draw() {
  if (reset) {
    resetearIlusion();
    reset = false;
  }
  dibujarGrillas();
}

void mousePressed() {
  ellipseSize = map(mouseY, 0, height, 2, 30);
}

void keyPressed() {
  if (key == 'm' || key == 'M') {
    coloresalternativos2 = !coloresalternativos2;
    coloresalternativos1 = false;
    coloresAleatorios = false;
  } 
  else if (key == 'k' || key == 'K') {
    generarColoresAleatorios();
    coloresAleatorios = true;
    coloresalternativos1 = false;
    coloresalternativos2 = false;
  } 
  else if (key == 'Z') {
    reset = true;
  }
}

void dibujarGrillas() {
  image(circulos, 0, 0, 400, 400); 
  translate(width / 2, 0); 
  for (int i = 0; i < cant; i++) {
    for (int j = 0; j < cant; j++) {
      if (coloresalternativos1) {
        if ((i + j) % 2 == 0) {
          fill(255);
        } 
        else {
          fill(0);
        }
      } 
      else if (coloresalternativos2) {
        if ((i + j) % 2 == 0) {
          fill(0, 255, 0);  // Green
        } 
        else {
          fill(255, 0, 0);  // Red
        }
      } 
      else if (coloresAleatorios) {
        fill(muchoscolores[i][j]);
      }
      else {
        fill(ColorBase(i, j)); 
      }
      rect(i * tam, j * tam, tam, tam);
      fill((i + j) % 2 == 0 ? 255 : 0);
      ellipse(i * tam + tam / 2, j * tam + tam / 2, ellipseSize, ellipseSize);
    }
  }
}

color ColorBase(int i, int j) {
  return (i + j) % 2 == 0 ? color(0) : color(255);
}

void generarColoresAleatorios() {
  for (int i = 0; i < cant; i++) {
    for (int j = 0; j < cant; j++) {
      muchoscolores[i][j] = color(random(255), random(255), random(255));
    }
  }
}

void resetearIlusion() {
  ellipseSize = 17;
  coloresalternativos1 = false;
  coloresalternativos2 = false;
  coloresAleatorios = false;
}
