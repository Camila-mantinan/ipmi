//Camila Mantiñan 
//Tp 2 Comisión 2 

String homescape; 


PImage juegos; //pantalla1
PImage juegos1; //pantalla2
PImage juegos2; //pantalla3


float tamaño; 


int esqX = 270;
int esqY = 400;
int ancho = 100;
int alto = 30;



void setup(){
  size (640, 480);
  textAlign (CENTER,CENTER);
  
  juegos= loadImage("homescape.jpg");
  juegos1= loadImage("homescape1.jpeg");
  juegos2= loadImage("homescape2.jpg");
  tamaño= 10;

}

void draw(){
  background (0);
  println (frameCount/50);
  
  
  //pantalla 0
 
  if (frameCount/50>=0) {
    homescape= "pantalla0";
  }
  if ( homescape.equals ( "pantalla0")){
    image (juegos,0,0,640,480);
    if (tamaño < 30){
      tamaño += 0.06;
      textSize(tamaño);
      fill (0);
      text ("Es un videojuego donde se combina e intercambian piezas", 320, 240);
    }
  }
  
  //pantalla 1
    
  if (frameCount/50>=5) {
     homescape= "pantalla1";
  }
  if (homescape.equals ("pantalla1")){
    image (juegos1 , 0, 0,640,480);
    textSize(tamaño);
    if (tamaño > 1){
      tamaño += 0.01;
      fill(0);
      text ("Tambien se puede rediseñar una Antigua Mansión", 320, 240); 
   }
  }
  
  //pantalla 2

 if (frameCount/50>=10){
    homescape= "pantalla2";
    tamaño=20;
   
 }
 if (homescape.equals ("pantalla2")){
   image (juegos2, 0, 0,640,480);
   if (tamaño <30 ){
     tamaño += 0.06;
     textSize(tamaño);
     fill(0);
     text ("*Diviertete pasando distintos retos en el celular o computadora*", 320, 240);
   }     
     rect (esqX, esqY, ancho, alto);
     fill (150);
     text ("REINICIAR", 321,416);
   
   
 } 
}

void mousePressed (){
  if (mouseX > esqX && mouseX < esqX + ancho && mouseY > esqY && mouseY < esqY + alto) {
    frameCount=0;
    }
}
