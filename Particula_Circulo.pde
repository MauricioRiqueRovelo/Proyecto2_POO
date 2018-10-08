class Particula_Circulo{
  Body circle;
  float r;
  int num;
  
  Particula_Circulo(float x, float y, float r_, int num_){
    this.r = r_;
    this.num = num_;
    
    crearCirculo(x, y, r);
    circle.setUserData(this);
  }
  
  void killBody(){
    box2d.destroyBody(circle);
  }
  
  boolean verificar1(){
    Vec2 c = box2d.getBodyPixelCoord(circle);
    
    if (c.x != 0 && c.y != 0){
    killBody();
    return true;
    }
    return false;
  }
  
  boolean verificar2(){
    Vec2 c = box2d.getBodyPixelCoord(circle);
    
    if (c.x < 0 || c.x > width || c.y < 0 || c.y > height){
      killBody();
      return true;
    }
    return false;
  }
  
  void display(){
    Vec2 posicion = box2d.getBodyPixelCoord(circle);
    
    pushMatrix();
    translate(posicion.x, posicion.y);
    fill(255, 133, 0);
    noStroke();
    ellipse(0, 0, r*2, r*2);
    popMatrix();
  }
  
  void crearCirculo(float x, float y, float r){
    BodyDef pcbd = new BodyDef();
    
    pcbd.position = box2d.coordPixelsToWorld(x, y);
    pcbd.type = BodyType.DYNAMIC;
    circle = box2d.createBody(pcbd);
    
    CircleShape pcs = new CircleShape();
    pcs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef pcfd = new FixtureDef();
    pcfd.shape = pcs;
    
    pcfd.density = 1;
    pcfd.friction = 0.01;
    pcfd.restitution = 1.05;
    circle.createFixture(pcfd);
    
    circle.setLinearVelocity(new Vec2 (random(-10, 10), random(-10, 10)));
  }
  
  
  
}
