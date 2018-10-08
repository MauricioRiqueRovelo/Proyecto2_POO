class Circulo{
  Body circle;
  
  float r;
  int c, num;
  color col;
  
  Circulo(float x, float y, float r_, int c_, int num_){
    this.r = r_;
    this.c = c_;
    this.num = num_;
    
    crearCirculo(x, y, r);
    circle.setUserData(this);
    queColor(this.c);
    
  }
  
  void killBody(){
    box2d.destroyBody(circle);
  }
  
  boolean verificar(){
    Vec2 c = box2d.getBodyPixelCoord(circle);
    
    if (c.x != 0 && c.y != 0){
    killBody();
    return true;
    }
    return false;
  }
  
  void display(){
    Vec2 posicion = box2d.getBodyPixelCoord(circle);
    
    pushMatrix();
    translate(posicion.x, posicion.y);
    fill(col);
    noStroke();
    ellipse(0, 0, r*2, r*2);
    popMatrix();
  }
  
  void crearCirculo(float x, float y, float r){
    BodyDef cbd = new BodyDef();
    
    cbd.position = box2d.coordPixelsToWorld(x, y);
    cbd.type = BodyType.STATIC;
    circle = box2d.createBody(cbd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    circle.createFixture(cs, 1.0);
    
    
  }
  
  void queColor(int tcol){
    switch (tcol){
      case 1: 
        col = color(0, 18, 127);
        break;
      case 2: 
        col = color(0, 28, 191);
        break;
      case 3: 
        col = color(0, 30, 255);
        break;
    }
  }
  
  void cambiarColor(){
    switch (this.c){
      case 1: 
        col = color(0, 18, 127);
        break;
      case 2: 
        col = color(0, 28, 191);
        break;
      case 3: 
        col = color(0, 30, 255);
        break;
    }
  }
}
