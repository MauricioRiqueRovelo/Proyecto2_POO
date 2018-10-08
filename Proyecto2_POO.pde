//Librerías
import processing.sound.*;
import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

//Mundo de Box2D
Box2DProcessing box2d;

//Pantallas
Pantalla pantalla0, pantalla1, pantalla2, pantalla3;

//Arreglo para los sonidos
SoundFile[] sounds;

//Arreglos de objetos
ArrayList<Triangulo1> triangulos1;

ArrayList<Triangulo2> triangulos2;

ArrayList<Circulo> circulitos;

ArrayList<Particula_Circulo> hitballs1;
ArrayList<Particula_Circulo> hitballs2;
ArrayList<Particula_Circulo> hitballs3;

//Variables globales 
int circc, circnum;
int pant;
int ss, hits;
int nosounds = 49;
int limit1, limit2, limit3;

PFont titulo, texto;

//Setup
void setup() {
  size(1080, 800);
  smooth();

//Objeto de clase Pantalla
  pantalla0 = new Pantalla(0);
  pantalla1 = new Pantalla(1);
  pantalla2 = new Pantalla(2);
  pantalla3 = new Pantalla(3);
  
//Fuentes usadas
  titulo = loadFont("Vermin-Vibes-1989-150.vlw");
  texto = loadFont("ComputerPixel-7-50.vlw"); 
  
//Creación de los parámetros del mundo de Box2D
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -1);
  box2d.listenForCollisions();

//Arreglo de sonido definido y guardado de los sonidos en las posiciones
  sounds = new SoundFile[nosounds];
  
  for (int s = 0; s < nosounds; s++) {
    sounds[s] = new SoundFile(this, (s+1) + ".mp3");
  }
  
//Arreglos definidos
  circulitos = new ArrayList<Circulo>();
  triangulos1 = new ArrayList<Triangulo1>();
  triangulos2 = new ArrayList<Triangulo2>();
  hitballs1 = new ArrayList<Particula_Circulo>();
  hitballs2 = new ArrayList<Particula_Circulo>();
  hitballs3 = new ArrayList<Particula_Circulo>();

//Creación de los trángulos de cada arreglo
  triangulos1.add(new Triangulo1(184.61, 55.48, 4, 4));
  triangulos1.add(new Triangulo1(246.05, 55.48, 3, 5));
  triangulos1.add(new Triangulo1(153.89, 108.69, 3, 3));
  triangulos1.add(new Triangulo1(276.77, 108.69, 4, 6));
  triangulos1.add(new Triangulo1(123.17, 161.90, 4, 2));
  triangulos1.add(new Triangulo1(307.49, 161.90, 3, 7));
  triangulos1.add(new Triangulo1(92.45, 215.11, 3, 1));
  triangulos1.add(new Triangulo1(338.21, 215.11, 4, 8));
  triangulos1.add(new Triangulo1(61.73, 268.32, 4, 0));
  triangulos1.add(new Triangulo1(368.94, 268.32, 3, 9));
  
  triangulos1.add(new Triangulo1(833.95, 55.48, 1, 24));
  triangulos1.add(new Triangulo1(895.39, 55.48, 2, 25));
  triangulos1.add(new Triangulo1(803.23, 108.69, 2, 23));
  triangulos1.add(new Triangulo1(926.11, 108.69, 1, 26));
  triangulos1.add(new Triangulo1(772.51, 161.90, 1, 22));
  triangulos1.add(new Triangulo1(956.83, 161.90, 2, 27));
  triangulos1.add(new Triangulo1(741.79, 215.11, 2, 21));
  triangulos1.add(new Triangulo1(987.55, 215.11, 1, 28));
  triangulos1.add(new Triangulo1(711.07, 268.32, 1, 20));
  triangulos1.add(new Triangulo1(1018.27, 268.32, 2, 29));
  
  triangulos2.add(new Triangulo2(61.73, 391.68, 3, 10));
  triangulos2.add(new Triangulo2(368.94, 391.68, 4, 19));
  triangulos2.add(new Triangulo2(92.45, 444.89, 4, 11));
  triangulos2.add(new Triangulo2(338.21, 444.89, 3, 18));
  triangulos2.add(new Triangulo2(123.17, 498.1, 3, 12));
  triangulos2.add(new Triangulo2(307.49, 498.1, 4, 17));
  triangulos2.add(new Triangulo2(153.89, 551.31, 4, 13));
  triangulos2.add(new Triangulo2(276.77, 551.31, 3, 16));
  triangulos2.add(new Triangulo2(184.61, 604.52, 3, 14));
  triangulos2.add(new Triangulo2(246.05, 604.52, 4, 15));
  
  triangulos2.add(new Triangulo2(711.07, 391.68, 2, 30));
  triangulos2.add(new Triangulo2(1018.27, 391.68, 1, 39));
  triangulos2.add(new Triangulo2(741.79, 444.89, 1, 31));
  triangulos2.add(new Triangulo2(987.55, 444.89, 2, 38));
  triangulos2.add(new Triangulo2(772.51, 498.1, 2, 32));
  triangulos2.add(new Triangulo2(956.83, 498.1, 1, 37));
  triangulos2.add(new Triangulo2(803.23, 551.31, 1, 33));
  triangulos2.add(new Triangulo2(926.11, 551.31, 2, 36));
  triangulos2.add(new Triangulo2(833.95, 604.52, 2, 34));
  triangulos2.add(new Triangulo2(895.39, 604.52, 1, 35));
  
//Creación de los círculos de cada arreglo
  circc = 1;
  circnum = 40;
  
  for (int i = 0; i<8; i++){
    Circulo c = new Circulo((541.87+cos(i*0.8)*96.79), (559.81+sin(i*0.8)*96.79), 15, circc, circnum);
    if (circc == 1){
      circc += 1;
    } else if (circc == 2){
      circc -= 1;
    }
    circnum++;
    circulitos.add(c);
  }
  
  circc = 2;
  circnum = 47;
  
  for (int i = 1; i<16; i+=2){
    Circulo c = new Circulo((541.87+cos(i*0.4)*140.79), (559.81+sin(i*0.4)*140.79), 15, circc, circnum);
    if (circc == 1){
      circc += 1;
    } else if (circc == 2){
      circc -= 1;
    }
    circnum--;
    circulitos.add(c);
  }
  
  
//Parámetro preestablecido de la variable "hits"
  hits = 0;
}


//Función Draw
void draw() {
  //Uso de la variable "pant" para mejor orden de pantallas
  //Uso de la función display de cada pantalla para generar el objeto
  if (pant == 0){
    //Pantalla de presentación
    pantalla0.display();
  } else if (pant > 0){
    if (pant == 1){
      //Pantalla de instrucciones
        pantalla1.display();
    } if (pant == 2){
      //Pantalla de interfaz
        pantalla2.display();

//Función Step de Box2D
  box2d.step();

//Definición de las variables "limit" para poder definir el número máximo de hitballs
  limit1 = hitballs1.size();
  limit2 = hitballs2.size();
  limit3 = hitballs3.size();
  
//Uso de funcion verificar1 de las hitball para eliminarlas una vez se alcance el límite
  if (limit1 > 3){
    for (int h1 = hitballs1.size()-1; h1 >= 0; h1--) {
      Particula_Circulo hb1 = hitballs1.get(h1);
      if (hb1.verificar1()) {
        hitballs1.remove(h1);
      }
    }
  }
  
  if (limit2 > 3){
    for (int h2 = hitballs2.size()-1; h2 >= 0; h2--) {
      Particula_Circulo hb2 = hitballs2.get(h2);
      if (hb2.verificar1()) {
        hitballs2.remove(h2);
      }
    }
  }
  
  if (limit3 > 2){
    for (int h3 = hitballs3.size()-1; h3 >= 0; h3--) {
      Particula_Circulo hb3 = hitballs3.get(h3);
      if (hb3.verificar1()) {
        hitballs3.remove(h3);
      }
    }
  }

  //Uso de funcion verificar1 de las hitball para eliminarlas cuando salgan del mapa
    for (int h1 = hitballs1.size()-1; h1 >= 0; h1--) {
      Particula_Circulo hb1 = hitballs1.get(h1);
      if (hb1.verificar2()) {
        hitballs1.remove(h1);
      }
    }
  
      for (int h2 = hitballs2.size()-1; h2 >= 0; h2--) {
      Particula_Circulo hb2 = hitballs2.get(h2);
      if (hb2.verificar2()) {
        hitballs2.remove(h2);
      }
    }
    
      for (int h3 = hitballs3.size()-1; h3 >= 0; h3--) {
      Particula_Circulo hb3 = hitballs3.get(h3);
      if (hb3.verificar2()) {
        hitballs3.remove(h3);
      }
    }

//Display de cada objeto
  for (Circulo circulos: circulitos){
    circulos.display();
  }
  
  for (Particula_Circulo bolas1: hitballs1){
    bolas1.display();
  }
  
  for (Particula_Circulo bolas2: hitballs2){
    bolas2.display();
  }
  
  for (Particula_Circulo bolas3: hitballs3){
    bolas3.display();
  }

  for (Triangulo1 triangles1: triangulos1) {
    triangles1.display();
  }
  
  for (Triangulo2 triangles2: triangulos2) {
    triangles2.display();
  }

//Eliminación de cada objeto una vez se llegó al límite de impactos
  if (hits == 500){
    for (int triangles1 = triangulos1.size()-1; triangles1 >= 0; triangles1--) {
    Triangulo1 t1 = triangulos1.get(triangles1);
    if (t1.verificar()) {
      triangulos1.remove(t1);
    }
  }
    
    for (int triangles2 = triangulos2.size()-1; triangles2 >= 0; triangles2--) {
    Triangulo2 t2 = triangulos2.get(triangles2);
    if (t2.verificar()) {
      triangulos2.remove(t2);
    }
  }
  
    for (int circles = circulitos.size()-1; circles >= 0; circles--) {
    Circulo c1 = circulitos.get(circles);
    if (c1.verificar()) {
      circulitos.remove(c1);
    }
  }
  
    for (int hballs1 = hitballs1.size()-1; hballs1 >= 0; hballs1--) {
    Particula_Circulo hb1 = hitballs1.get(hballs1);
    if (hb1.verificar1()) {
      hitballs1.remove(hballs1);
    }
  }
  
    for (int hballs2 = hitballs2.size()-1; hballs2 >= 0; hballs2--) {
    Particula_Circulo hb2 = hitballs2.get(hballs2);
    if (hb2.verificar1()) {
      hitballs2.remove(hballs2);
    }
  }
  
    for (int hballs3 = hitballs3.size()-1; hballs3 >= 0; hballs3--) {
    Particula_Circulo hb3 = hitballs3.get(hballs3);
    if (hb3.verificar1()) {
      hitballs3.remove(hballs3);
    }
  }

//Pantalla final
  pant = 3;
}
  } else if (pant == 3){
    pantalla3.display();
  }
}
}

//Función para detectar impactos
void beginContact(Contact hit){
  
  Fixture f1 = hit.getFixtureA();
  Fixture f2 = hit.getFixtureB();
  
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();
  
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  
  //Generación de instrucciones en caso de un tipo de impacto
  if (o1.getClass() == Triangulo1.class && o2.getClass() == Particula_Circulo.class){
    Triangulo1 p1 = (Triangulo1) o1;
    if (p1.c > 2){
      p1.c -= 2;
    } else if (p1.c <= 2){
      p1.c += 2;
    }
    p1.cambiarColor();
    hits++;
    ss = p1.num;
    generarSonido(ss);
  } else if (o1.getClass() == Triangulo2.class && o2.getClass() == Particula_Circulo.class){
    Triangulo2 p1 = (Triangulo2) o1;
    if (p1.c > 2){
      p1.c -= 2;
    } else if (p1.c <= 2){
      p1.c += 2;
    }
    p1.cambiarColor();
    hits++;
    ss = p1.num;
    generarSonido(ss);
  } else if (o1.getClass() == Circulo.class && o2.getClass() == Particula_Circulo.class){
    Circulo p1 = (Circulo) o1;
    if (p1.c == 1){
      p1.c += 1;
    } else if (p1.c == 2){
      p1.c -= 1;
    }
    p1.cambiarColor();
    hits++;
    ss = p1.num;
    generarSonido(ss);
  } else if (o1.getClass() == Particula_Circulo.class && o2.getClass() == Particula_Circulo.class){
    Particula_Circulo p1 = (Particula_Circulo) o1;
    hits++;
    ss = p1.num;
    generarSonido(ss);
}
}

//Controles de la interfaz
void keyPressed(){
    switch (key){
      case ENTER:
        if (pant == 0){
          pant++;
          break;
        } else if (pant == 1){
          pant++;
          break;
        }
        else if (pant == 3){
          hits = 0;
          pant -= 2;
          break;
        }
// Casos "a", "s" y "d" para la creación de hitballs
      case 'a':
        if (hits == 500 || pant != 2){
          break;
        }
        Particula_Circulo a = new Particula_Circulo(random(61.73, 368.94), random(323.4, 336.6), 10, 48);
        hitballs1.add(a);
        break;
      case  'd':
        if (hits == 500 || pant != 2){
          break;
        }
        Particula_Circulo d = new Particula_Circulo(random(833.95, 895.39), random(323.4, 336.6), 10, 48);
        hitballs2.add(d);
        break;
      case 's':
        if (hits == 500 || pant != 2){
          break;
        }
        Particula_Circulo s = new Particula_Circulo((541.87+cos(0.5)*random(-96.79, 96.79)), (559.81+sin(0.5)*random(-96.79, 96.79)), 10, 48);
        hitballs3.add(s);
        break;
  }
}

//Función para reproducir un sonido en específico
void generarSonido(int sounds1){
  sounds[sounds1].play(1.0, 0.25);
}
