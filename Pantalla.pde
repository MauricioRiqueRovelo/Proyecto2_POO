class Pantalla{
  int x, y;
  int w, h;
  int num;
  int c;
  
  float incremento = 0.01;
  
  color col;
  
  String subtitulo1, subtitulo2, subtitulo3, text1, text2, text3, text4;
  
  Pantalla(int num_){
    this.x = width/2;
    this.y = height/2;
    this.w = width;
    this.h = height;
    this.num = num_;
  }
  
  void display(){
    switch(this.num){
      case 0:
        background(0);
        pushMatrix();
        frameRate(15);
        
        for (float i = 0; i < width; i+= 10){
          for (float j = 0; j < height; j += 10){
            fill(ceil(random(127, 255)), 0, 127);
            noStroke();
            rect(i, j, 10, 10);
          }
        }
        for (float i = width/16; i < (width/16)*15; i+= 10){
          for (float j = height/16; j < (height/16)*14; j += 10){
            fill(0, ceil(random(0, 127)), 127);
            noStroke();
            rect(i, j, 10, 10);
          }
        }
        
        this.subtitulo1 = "HITBALL";
        this.subtitulo2 = "SOUND";
        this.subtitulo3 = "MACHINE";
        this.text1 = "Presiona [Enter para continuar]";
        
        textFont(titulo);
        textAlign(CENTER);
        fill(255, 255, 255);
        text(this.subtitulo1, width/2, height/4);
        text(this.subtitulo2, width/2, (height/8)*3);
        text(this.subtitulo3, width/2, (height/4)*2);
        
        textFont(texto);
        text(this.text1, width/2, (height/4) * 3);
        popMatrix();
        break;
      
      case 1:
        background(0);
        
        pushMatrix();
        frameRate(60);
        this.text1 = "Hitball Sound Machine es una interfaz que te permite crear piezas musicales extravagantes, con la ayuda de pelotas (hitballs) creadas al azar por ti. Cada impacto es una nota, un sonido único. ¡Atrévete a crear!";
        this.text2 = "Tendrás sólo 500 impactos para crear tu propia melodía. Ten en cuenta que hay un límite de hitballs por área: los rombos sólo permiten 3, mientras que los círculos, 2. Si quieres limpiar una de estas áreas, basta con crear crear una hitball más en dicha área. :D";
        this.text3 = "Pulsa [A] para crear hitballs en el rombo izquierdo. Pulsa [D] para crear hitball en el rombo derecho. Pulsa [S] para crear hitballs dentro de los círculos inferiores.";
        this.text4 = "Cuando estés listo, vuelve a pulsar [Enter] para continuar";
        textFont(texto);
        textAlign(CENTER);
        fill(255, 255, 255);
        text(this.text1, width/6, height/8, (width/6)*4, 100);
        text(this.text2, width/6, (height/8)*2.5, (width/6)*4, 200);
        text(this.text3, width/6, (height/8)*4.5, (width/6)*4, 300);
        text(this.text4, width/6, (height/8)*6.5, (width/6)*4, 300);
        
        popMatrix();
        
        break;
        
      case 2:
        background(0);
        break;
      
      case 3:
        
        pushMatrix();
        frameRate(30);
        
        float dx = 0.0;
        noiseDetail(8, 0.1);
        
        for (int x1 = 0; x1 < width; x1++){
          dx += incremento;
          float dy = 0.0;
          for (int y1 = 0; y1 < height; y1++){
            dy += incremento;
            
            float brillo = noise(dx, dy)*255;
            
            col = color(brillo, 0, 127);
            
            fill(col);
            noStroke();
            rect(x1, y1, 1, 1);
          }
        }
      
     popMatrix(); 
     
     this.text1 = "Espero que te haya gustado, si quieres volver a crear música, pulsa [Enter]";
    
        
     textFont(texto);
     textAlign(CENTER);
     fill(255, 255, 255);
     text(this.text1, width/6, (height/8)*3, (width/6)* 4, 200);
     break;
    }
  }
}
